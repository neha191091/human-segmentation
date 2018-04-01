import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt
#import tfslimlocalcopy as slim
import segmentation_python.net_mobilenet_v1 as mob
from tensorflow.contrib import slim
from segmentation_python.data_utils import DataSet, labels_list

class Resnet50:
    def __init__(self, inputs, scope='ResNet50'):
        self.deconv_logits = None
        self.end_points = {}
        pass

class MobileNet_V1:

    final_endpoint_array = ['Conv2d_0', 'Conv2d_1_pointwise', 'Conv2d_2_pointwise',
                            'Conv2d_3_pointwise', 'Conv2d_4_pointwise', 'Conv2d_5_pointwise',
                            'Conv2d_6_pointwise', 'Conv2d_7_pointwise', 'Conv2d_8_pointwise',
                            'Conv2d_9_pointwise', 'Conv2d_10_pointwise', 'Conv2d_11_pointwise',
                            'Conv2d_12_pointwise', 'Conv2d_13_pointwise']
    def __init__(self,
                 inputs,
                 deconv_size,
                 multi_deconv=True,
                 f_endpoint=13,
                 num_classes=11,
                 dropout_keep_prob=0.999,
                 is_training=True,
                 min_depth=8,
                 depth_multiplier=1.0,
                 conv_defs=None,
                 scope='MobileNet_V1',
                 reuse=None):
        if f_endpoint < 0 and f_endpoint > 13:
            print("Can only choose a value between 0 and 13 for MobileNet_V1 endpoint, choosing the default ", 13)
            f_endpoint = 13
        final_endpoint = MobileNet_V1.final_endpoint_array[f_endpoint]

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
                                                            conv_defs=conv_defs)
                    end_points['Input'] =inputs
                    with tf.variable_scope('ImageLogits'):
                        # Add prediction layers
                        deconv_logits, extra_endpoints = MobileNet_V1._get_deconvlogits_and_endpoints(net,deconv_size,num_classes,dropout_keep_prob, f_endpoint,end_points, is_training, multi_deconv=multi_deconv)

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
            print('sum: ',sum)
            #tiled_sum = tf.tile(sum, 120*160)
            #tf.reshape(tiled_sum,[tf.shape(sum)[0],120,160])
            sum = tf.expand_dims(sum, 1)
            sum = tf.expand_dims(sum, 2)
            print('sum: ', sum)
            mask_temp = mask_temp / sum
            loss_temp = tf.multiply(tf.cast(loss, tf.float64), tf.cast(mask_temp, tf.float64))
            masked_loss = masked_loss + loss_temp

        return masked_loss

    @staticmethod
    def _get_deconvlogits_and_endpoints(net,deconv_size,num_classes,dropout_keep_prob, f_endpoint,conv_endpoints, is_training, multi_deconv=True):
        """
        Add prediction layers on top of MobileNet_V1
        :param net: Pass the base net
        :param deconv_size: Size of the original image
        :param num_classes: Number of classes
        :param dropout_keep_prob: Dropout probability
        :return: logits from the final deconv layer and endpoints
        """
        end_points = {}

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
            print('Multi-deconv, f_endpoint is ', f_endpoint)
            conv_defs = mob._CONV_DEFS
            for i in range(f_endpoint,-1,-1):
                conv_def = conv_defs[i]
                if i == 0:
                    corr_ep_text ='Input'
                    num_out_filt = num_classes
                else:
                    corr_ep_text = MobileNet_V1.final_endpoint_array[i-1]
                    num_out_filt = int(conv_def.depth / 2)
                corr_shape = conv_endpoints[corr_ep_text].shape
                if conv_def.stride == 2:
                    if corr_shape[1]%2 == 0 and corr_shape[2]%2 == 0:
                        net = slim.conv2d_transpose(net, num_out_filt,conv_def.kernel,stride=2,normalizer_fn=slim.batch_norm)
                        #end_points['Debef'+corr_ep_text]=net
                    else:
                        print('De' + corr_ep_text, ' shape: ', corr_shape, ' num filters: ', int(conv_def.depth/2))
                        kern_1 = int(corr_shape[1]) - int(net.shape[1]) + 1
                        kern_2 = int(corr_shape[2]) - int(net.shape[2]) + 1
                        net = slim.conv2d_transpose(net, num_out_filt, [kern_1,kern_2], stride=1, padding='VALID', normalizer_fn=slim.batch_norm)
                        #end_points['Debef' + corr_ep_text] = net
                    if i is 1:
                        net = slim.dropout(net, keep_prob=dropout_keep_prob, is_training=is_training, scope='Dropout_1b')
                    if i is not 0:
                        net = tf.concat([net, conv_endpoints[corr_ep_text]], 3)
                    end_points['De' + corr_ep_text] = net

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
    def __init__(self, inputs, image_size, num_classes=11,  scope='SegmentationNet', base_net_name='MobileNet_V1', is_training = True, dropout_keep_prob=0.999, multi_deconv=True,  mob_f_ep = 13, mob_depth_multiplier=1):

        if(base_net_name == 'MobileNet_V1'):
            net_class = MobileNet_V1(inputs, image_size, num_classes=num_classes, scope=scope, is_training=is_training, dropout_keep_prob=dropout_keep_prob, multi_deconv=multi_deconv, f_endpoint=mob_f_ep, depth_multiplier=mob_depth_multiplier)
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

    dataset = DataSet(num_poses=1, num_angles=360, max_records_in_tfrec_file=100)
    xbatch, ybatch = dataset.get_batch_from_raw_data(1)
    print('xbatch shape: ', xbatch.shape)
    print('ybatch shape: ', ybatch.shape)
    x = tf.placeholder(tf.float32, xbatch.shape, name='placeholder_x')
    y = tf.placeholder(tf.int32, ybatch.shape, name='placeholder_y')
    model = SegmentationNetwork(x, ybatch[0].shape, multi_deconv=True, mob_f_ep=9, mob_depth_multiplier=0.75)
    print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    print('prediction shape', model.get_predictions().shape)

    #TODO: Remove later
    network_endpoints = model.net_class.end_points
    for key in sorted(network_endpoints):
        print("Endpoint ",key, " shape: ",network_endpoints[key].shape)

    #TODO: Remove later
    #exit()


    cross_entropy_loss = model.loss(y)
    train_op = tf.train.AdamOptimizer(1e-4).minimize(cross_entropy_loss)

    import time
    #
    with tf.Session() as sess:
        tf.global_variables_initializer().run()
        logits_val = sess.run(model.net_class.deconv_logits, feed_dict={x: xbatch})
        loss = sess.run(cross_entropy_loss, feed_dict={x: xbatch, y: ybatch})
        print('loss before: ', np.sum(loss))
        starttime = time.time()
        for iter in range(500):
            print(iter)
            sess.run(train_op, feed_dict={x: xbatch, y: ybatch})

        endtime = time.time()
        print('Time taken for training: ', endtime-starttime)
        loss = sess.run(cross_entropy_loss, feed_dict={x: xbatch, y: ybatch})
        print('loss after: ', np.sum(loss))
        pred = sess.run(model.get_predictions(), feed_dict={x: xbatch})
    rgbPred = DataSet.label2rgb(pred[0])
    plt.subplot(1,2,1)
    plt.imshow(rgbPred)
    plt.axis('off')
    plt.subplot(1, 2, 2)
    plt.imshow(DataSet.label2rgb(ybatch[0]))
    plt.axis('off')
    plt.show()
    #print(loss)
    #print(logits_val)
    #print(label)
    #print('Are any logits nan?: ', np.sum(np.isnan(logits_val)))
