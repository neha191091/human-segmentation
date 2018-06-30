import numpy as np
import tensorflow as tf
from initialize import _DATA_PATH
import net_mobilenet_v1 as mob
from tensorflow.contrib import slim
from data_utils import DataSet, Dataset_Raw_Provide, labels_list
from conv_defs import _CONV_DEFS
import collections
import sys
from tensorflow.python.client import timeline

class Resnet50:
    def __init__(self, inputs, scope='ResNet50'):
        self.deconv_logits = None
        self.end_points = {}
        pass

class MobileNet_V1:

    final_endpoint_array = ['Conv2d_0', 'Conv2d_1', 'Conv2d_2',
                            'Conv2d_3', 'Conv2d_4', 'Conv2d_5',
                            'Conv2d_6', 'Conv2d_7', 'Conv2d_8',
                            'Conv2d_9', 'Conv2d_10', 'Conv2d_11',
                            'Conv2d_12', 'Conv2d_13']
    def __init__(self,
                 inputs,
                 deconv_size,
                 multi_deconv=1,
                 num_classes=11,
                 dropout_keep_prob=0.999,
                 is_training=True,
                 min_depth=8,
                 depth_multiplier=1.0,
                 conv_defs=_CONV_DEFS[0],
                 follow_up_convs = 0,
                 sep_convs = False,
                 depthsep_inter_norm_activn = True,
                 scope='MobileNet_V1',
                 reuse=None):
        f_endpoint = len(conv_defs) - 1
        final_endpoint = MobileNet_V1.final_endpoint_array[f_endpoint]
        if isinstance(conv_defs[f_endpoint], mob.DepthSepConv):
            final_endpoint = final_endpoint + '_pointwise'

        with tf.variable_scope(scope, 'MobileNet_V1', [inputs, num_classes],
                               reuse=reuse) as scope:
            # set is_training=passed value for all the batch norm and drop out layers in the net
            with slim.arg_scope([slim.batch_norm, slim.dropout],
                                is_training=is_training):
                # set decay for batch_norm as 0.9 for all the batch norm layers in the net
                with slim.arg_scope([slim.batch_norm], decay=0.9):
                    net, end_points = mob.mobilenet_v1_base(inputs,
                                                            final_endpoint=final_endpoint,
                                                            scope=scope,
                                                            min_depth=min_depth,
                                                            depth_multiplier=depth_multiplier,
                                                            conv_defs=conv_defs,
                                                            depthsep_inter_norm_activn=depthsep_inter_norm_activn)
                    end_points['Input'] =inputs
                    with tf.variable_scope('ImageLogits'):
                        # Add prediction layers
                        deconv_logits, extra_endpoints = MobileNet_V1._get_deconvlogits_and_endpoints(net, deconv_size,
                                                                                                      num_classes, dropout_keep_prob,
                                                                                                      f_endpoint, end_points, is_training,
                                                                                                      conv_defs, multi_deconv=multi_deconv,
                                                                                                      follow_up_convs = follow_up_convs, sep_convs = sep_convs,
                                                                                                      depthsep_inter_norm_activn=depthsep_inter_norm_activn)

                    end_points.update(extra_endpoints)
                    end_points['ImageLogits'] = deconv_logits
                    predictions = tf.argmax(deconv_logits, axis=3, name='predictions')
                    end_points['Predictions'] = predictions

        self.deconv_logits = deconv_logits
        self.end_points = end_points

    def loss(self, labels, loss_func = tf.nn.sparse_softmax_cross_entropy_with_logits):

        loss = loss_func(labels=labels, logits=self.deconv_logits)
        #print('loss shape: ', loss)

        mask_discard = tf.multiply(tf.ones_like(labels, dtype=tf.float64), 0.0)
        mask_keep = tf.multiply(tf.ones_like(labels, dtype=tf.float64), 1.0)

        size = tf.reduce_sum(tf.ones_like(labels, dtype=tf.float64))
        #print('size: ', size)

        mask = tf.where(tf.equal(labels,0), mask_discard, mask_keep)
        #print(mask.shape,' ',labels.shape, ' ', self.deconv_logits.shape)

        # loss = tf.multiply(loss, tf.cast(mask, tf.float32))
        # return loss

        masked_loss =  tf.multiply(tf.ones_like(labels, dtype=tf.float64), 0.0)
        for label in labels_list:
            if(label['id'] == 0):
                continue
            mask_temp = tf.where(tf.equal(labels, label['id']), mask_keep, mask_discard)
            sum = tf.reduce_sum(mask_temp, axis=[1,2])
            #sum = sum + (sum == 0)
            sum = tf.cast(sum, tf.float64) + (tf.where(tf.equal(sum, 0), tf.ones_like(sum, dtype=tf.float64), tf.multiply(tf.ones_like(sum, dtype=tf.float64), 0.0)))
            #print('sum: ',sum)
            #tiled_sum = tf.tile(sum, 120*160)
            #tf.reshape(tiled_sum,[tf.shape(sum)[0],120,160])
            sum = tf.expand_dims(sum, 1)
            sum = tf.expand_dims(sum, 2)
            #print('sum: ', sum)
            mask_temp = mask_temp / sum
            loss_temp = tf.multiply(tf.cast(loss, tf.float64), tf.cast(mask_temp, tf.float64))
            masked_loss = masked_loss + loss_temp

        return masked_loss

    @staticmethod
    def _get_deconvlogits_and_endpoints(net,deconv_size,num_classes,dropout_keep_prob, f_endpoint,conv_endpoints,
                                        is_training, conv_defs, multi_deconv=1, follow_up_convs = 0, sep_convs = False,
                                        depthsep_inter_norm_activn=True):
        """
        Add prediction layers on top of MobileNet_V1
        :param net: Pass the base net
        :param deconv_size: Size of the original image
        :param num_classes: Number of classes
        :param dropout_keep_prob: Dropout probability
        :return: logits from the final deconv layer and endpoints
        """
        end_points = collections.OrderedDict()#{}

        if depthsep_inter_norm_activn:
            depthsep_inter_norm = slim.batch_norm
            depthsep_inter_activn = tf.nn.relu
        else:
            depthsep_inter_norm = None
            depthsep_inter_activn = None

        if not multi_deconv:

            kernel_size = MobileNet_V1._reduced_kernel_size_for_small_input(net, [7, 7])
            net = slim.avg_pool2d(net, kernel_size, padding='VALID',
                                  scope='AvgPool_1a')
            end_points['AvgPool_1a'] = net
            # 1 x 1 x 1024
            net = slim.dropout(net, keep_prob=dropout_keep_prob, is_training=is_training, scope='Dropout_1b')

            kernel_size = (net.shape[1], net.shape[2])
            # output should be Batch_sizex1x1xnum_classes
            logits = slim.conv2d(net, num_classes, kernel_size=kernel_size, padding='VALID', scope='Conv2d_1c_1x1')
            end_points['Logits'] = logits
            # output should be Batch_sizexHxWxnum_classes where (H,W) = size of the original image

            deconv_logits = slim.conv2d_transpose(logits, num_classes, kernel_size=deconv_size, padding='VALID')

        else:
            #print('Multi-deconv, f_endpoint is ', f_endpoint)
            for i in range(f_endpoint,-1,-1):
                conv_def = conv_defs[i]
                if i is f_endpoint:
                    net = slim.dropout(net, keep_prob=dropout_keep_prob, is_training=is_training, scope='Dropout_encoder')
                    net = slim.conv2d(net, conv_def.depth, conv_def.kernel, stride=1, activation_fn=None, normalizer_fn=None)
                    end_points['DropoutConv2dEncoder'] = net
                if i == 0:
                    corr_ep_text ='Input'
                    num_out_filt = num_classes
                else:
                    corr_ep_text = MobileNet_V1.final_endpoint_array[i-1]
                    if isinstance(conv_defs[i-1], mob.DepthSepConv):
                        corr_ep_text = corr_ep_text + '_pointwise'
                    num_out_filt = int(conv_def.depth / 2)
                corr_shape = conv_endpoints[corr_ep_text].shape
                if not conv_def.stride == 1:
                    if corr_shape[1]%2 == 0 and corr_shape[2]%2 == 0:
                        if multi_deconv == 1:
                            # conv2d_transposed with large strides
                            net = slim.conv2d_transpose(net, num_out_filt,conv_def.kernel,stride=conv_def.stride,normalizer_fn=slim.batch_norm)
                            end_points['DeConv2dtranspose_' + corr_ep_text] = net
                        elif multi_deconv == 2:
                            # resize+conv2d
                            net = tf.image.resize_images(net,[int(net.shape[1]*2),int(net.shape[2]*2)],method=tf.image.ResizeMethod.NEAREST_NEIGHBOR)
                            end_points['Deresize_' + corr_ep_text] = net
                            net = slim.conv2d(net, num_out_filt, conv_def.kernel,
                                              stride=1,
                                              normalizer_fn=slim.batch_norm)
                            end_points['Deconv2d_' + corr_ep_text] = net
                        elif multi_deconv == 3:
                            # resize+sep_conv+pointwise_conv
                            net = tf.image.resize_images(net, [int(net.shape[1]*2),int(net.shape[2]*2)],
                                                         method=tf.image.ResizeMethod.NEAREST_NEIGHBOR)
                            end_points['Deresize_' + corr_ep_text] = net
                            net = slim.separable_conv2d(net, None, conv_def.kernel,
                                                        depth_multiplier=1,
                                                        stride=1,
                                                        normalizer_fn=depthsep_inter_norm,
                                                        activation_fn=depthsep_inter_activn,
                                                        rate=1
                                                        )
                            end_points['Deconv2dDepthwise_' + corr_ep_text] = net
                            net = slim.conv2d(net, num_out_filt, [1, 1],
                                              stride=1,
                                              normalizer_fn=slim.batch_norm)
                            end_points['Deconv2dPointwise_' + corr_ep_text] = net
                    else:
                        #print('De' + corr_ep_text, ' shape: ', corr_shape, ' num filters: ', int(conv_def.depth/2))
                        kern_1 = int(corr_shape[1]) - int(net.shape[1]) + 1
                        kern_2 = int(corr_shape[2]) - int(net.shape[2]) + 1
                        net = slim.conv2d_transpose(net, num_out_filt, [kern_1,kern_2], stride=1, padding='VALID', normalizer_fn=slim.batch_norm)
                        end_points['Deconv2dtranspose_' + corr_ep_text] = net
                    if i is not 0:
                        net = tf.concat([net, conv_endpoints[corr_ep_text]], 3)
                        end_points['Deconcat_' + corr_ep_text] = net
                        #print('follow_up_convs: ', follow_up_convs)
                        if follow_up_convs:
                            for j in range(follow_up_convs):
                                if not sep_convs:
                                    net = slim.conv2d(net, num_out_filt, conv_def.kernel,
                                                      stride=1,
                                                      normalizer_fn=slim.batch_norm)
                                    end_points['DefollowupConv2d' + '_' + str(j+1) + '_' + corr_ep_text] = net
                                else:
                                    net = slim.separable_conv2d(net, None, conv_def.kernel,
                                                                depth_multiplier=1,
                                                                stride=1,
                                                                normalizer_fn=depthsep_inter_norm,
                                                                activation_fn=depthsep_inter_activn,
                                                                rate=1
                                                                )

                                    end_points['DefollowupConv2dDepthwise' + '_' + str(j+1) + '_' + corr_ep_text] = net
                                    net = slim.conv2d(net, num_out_filt, [1, 1],
                                                      stride=1,
                                                      normalizer_fn=slim.batch_norm)
                                    end_points['DefollowupConv2dPointwise' + '_' + str(j+1) + '_' + corr_ep_text] = net
                    #end_points['Definal_' + corr_ep_text] = net

            deconv_logits = net

        return deconv_logits, end_points

    @staticmethod
    def _reduced_kernel_size_for_small_input(input_tensor, kernel_size):
        """Define kernel size which is automatically reduced for small input.

        If the shape of the input images is unknown at graph construction time this
        function assumes that the input images are large enough.

        Args:
          input_tensor: input tensor of size [batch_size, height, width, channels].
          kernel_size: desired kernel size of length 2: [kernel_height, kernel_width]

        Returns:
          a tensor with the kernel size.
        """
        shape = input_tensor.get_shape().as_list()
        if shape[1] is None or shape[2] is None:
            kernel_size_out = kernel_size
        else:
            kernel_size_out = [min(shape[1], kernel_size[0]),
                               min(shape[2], kernel_size[1])]
        return kernel_size_out

class SegmentationNetwork:
    def __init__(self, inputs, image_size, num_classes=11,  scope='SegmentationNet', base_net_name='MobileNet_V1',
                 is_training = True, dropout_keep_prob=0.999, conv_defs=None, multi_deconv=1, mob_depth_multiplier=1, follow_up_convs = 0, sep_convs = False, depthsep_inter_norm_activn=True):

        #print('follow_up_convs: ', follow_up_convs)
        if(base_net_name == 'MobileNet_V1'):
            net_class = MobileNet_V1(inputs, image_size, num_classes=num_classes, scope=scope, is_training=is_training,
                                     dropout_keep_prob=dropout_keep_prob, conv_defs=conv_defs, multi_deconv=multi_deconv,
                                     depth_multiplier=mob_depth_multiplier, follow_up_convs = follow_up_convs, sep_convs = sep_convs, depthsep_inter_norm_activn=depthsep_inter_norm_activn)
        elif(base_net_name == 'ResNet50'):
            net_class = Resnet50(inputs, scope=scope)
        else:
            raise ValueError('You must choose from ''MobileNet_V1'' or ''ResNet50''')

        self.net_class = net_class

    def loss(self, labels, loss_func = tf.nn.sparse_softmax_cross_entropy_with_logits):
        return self.net_class.loss(labels, loss_func)

    def get_predictions(self):
        return self.net_class.end_points['Predictions']

if __name__ == '__main__':

    # WARNING: Do not run this file directly ... use the following code for only testing the functionality #

    #dir_raw_record = _DATA_PATH + 'raw_data_single_model'
    #dir_raw_record = _DATA_PATH + 'raw_data_single_model_by_4'
    dir_raw_record = _DATA_PATH + 'render_data_360_by_4'

    # TODO: Dont use this path until fully tested
    # dir_raw_record = _DATA_PATH + 'raw_data_single_model_in_by_4_out_by_1'

    batch_size = 1
    num_epochs = 1
    lr = 1e-3
    multi_deconv = 1
    mob_depth_multiplier = 1
    conv_def_num = 6
    conv_defs = _CONV_DEFS[conv_def_num]   #_CONV_DEFS[1]
    data_dims_from_ckpt = None
    follow_up_convs = 2
    sep_convs = True
    depthsep_inter_norm_activn = False
    dataset = Dataset_Raw_Provide(dir_raw_record)


    xbatch, ybatch = dataset.get_batch_from_raw_data(batch_size)
    print('xbatch shape: ', xbatch.shape)
    print('ybatch shape: ', ybatch.shape)

    x = tf.placeholder(tf.float32, xbatch.shape, name='placeholder_x')
    y = tf.placeholder(tf.int32, ybatch.shape, name='placeholder_y')

    model = SegmentationNetwork(x, dataset.data_dim, conv_defs=conv_defs, multi_deconv=multi_deconv, follow_up_convs = follow_up_convs, sep_convs = sep_convs,
                                mob_depth_multiplier=mob_depth_multiplier, depthsep_inter_norm_activn=depthsep_inter_norm_activn)
    print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    print('prediction shape', model.get_predictions().shape)

    num_params = np.sum([np.product([xi.value for xi in x.get_shape()]) for x in tf.all_variables()])
    print('Number of parameters: ', num_params)


    network_endpoints = model.net_class.end_points
    print('\nModel Endpoints with Output Shape')
    for key in network_endpoints:
        print(key, ", ", network_endpoints[key].shape)
    print('\n')


    cross_entropy_loss = model.loss(y)
    train_op = tf.train.AdamOptimizer(1e-4).minimize(cross_entropy_loss)




    details_str = "_ConvDef_"+str(conv_def_num)+"_Multideconv_"+str(multi_deconv)+"_Followups_"+\
                  str(follow_up_convs)+"_Sepconvs_"+str(sep_convs)+"_depthsep_inter_norm_activn_"+str(depthsep_inter_norm_activn)+"_MobDepthMul_"+str(mob_depth_multiplier)+'_no_cuda'

    import time
    #
    run_metadata = tf.RunMetadata()
    with tf.Session() as sess:
        tf.global_variables_initializer().run()
        #logits_val = sess.run(model.net_class.deconv_logits, feed_dict={x: xbatch})
        #loss = sess.run(cross_entropy_loss, feed_dict={x: xbatch, y: ybatch})
        #print('loss before: ', np.sum(loss))
        starttime = time.time()
        #profiler = tf.profiler.Profiler(sess.graph)

        for iter in range(1):
            print(iter)

            # training profile
            #sess.run(train_op, feed_dict={x: xbatch, y: ybatch},
            #   options=tf.RunOptions(trace_level=tf.RunOptions.FULL_TRACE),
            #   run_metadata=run_metadata)

            print('Running eval trace for iter : ', iter)
            # pred profile
            sess.run(model.get_predictions(), feed_dict={x: xbatch},
                     options=tf.RunOptions(trace_level=tf.RunOptions.FULL_TRACE),
                     run_metadata=run_metadata)

            print('Finished eval trace')

            # Uncomment to save a trace
            fetched_timeline = timeline.Timeline(run_metadata.step_stats)
            chrome_trace = fetched_timeline.generate_chrome_trace_format()
            with open(_DATA_PATH+details_str+'.json', 'w') as f:
                f.write(chrome_trace)

        endtime = time.time()
        print('Time taken for training: ', endtime-starttime)
        #loss = sess.run(cross_entropy_loss, feed_dict={x: xbatch, y: ybatch})
        #print('loss after: ', np.sum(loss))
        pred = sess.run(model.get_predictions(), feed_dict={x: xbatch})
    rgbPred = DataSet.label2rgb(pred[0])


    ProfileOptionBuilder = tf.profiler.ProfileOptionBuilder


    print("\nReport for Number of Parameters")
    opts = (ProfileOptionBuilder(
        ProfileOptionBuilder.trainable_variables_parameter()).build()
            )
    tf.profiler.profile(
        tf.get_default_graph(),
        options=opts)

    print("\nReport for Number of FLOPS")
    opts = (ProfileOptionBuilder(
                ProfileOptionBuilder.float_operation()).build())
    tf.profiler.profile(
        tf.get_default_graph(),
        options=opts)

    print("\nReport Time and Memory")
    opts = (ProfileOptionBuilder(ProfileOptionBuilder.time_and_memory()).build())
    tf.profiler.profile(
        tf.get_default_graph(),
        run_meta=run_metadata,
        cmd='op',
        options=opts)

    #tf.profiler.profile(
    #    tf.get_default_graph(),
    #    run_meta=run_metadata,
    #    cmd='code',
    #    options=opts)
    # param_stats can be tensorflow.tfprof.GraphNodeProto or
    # tensorflow.tfprof.MultiGraphNodeProto, depending on the view.
    # Let's print the root below.
    #sys.stdout.write('total_params: %d\n' % param_stats.total_parameters)

    #FLOPS = tf.profiler.profile(
    #tf.get_default_graph(),
    #options=tf.profiler.ProfileOptionBuilder.float_operation())

    #sys.stdout.write('total_FLOPS: %d\n' % FLOPS)


    #import matplotlib.pyplot as plt

    #plt.subplot(1,2,1)
    #plt.imshow(rgbPred)
    #plt.axis('off')
    #plt.subplot(1, 2, 2)
    #plt.imshow(DataSet.label2rgb(ybatch[0]))
    #plt.axis('off')
    #plt.show()
    #print(loss)
    #print(logits_val)
    #print(label)
    #print('Are any logits nan?: ', np.sum(np.isnan(logits_val)))
