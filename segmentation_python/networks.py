import numpy as np
from scipy import misc
import tensorflow as tf
import matplotlib.pyplot as plt
from data_utils import DataSet
from tensorflow.contrib import slim
#import tfslimlocalcopy as slim
from tfslimlocalcopy.nets import mobilenet_v1 as mob

class Resnet50:
    def __init__(self, inputs, scope='ResNet50'):
        pass

class MobileNet:
    def __init__(self,
                 inputs,
                 deconv_size,
                 num_classes=11,
                 dropout_keep_prob=0.999,
                 is_training=True,
                 min_depth=8,
                 depth_multiplier=1.0,
                 conv_defs=None,
                 scope='MobileNet',
                 reuse=None):

        with tf.variable_scope(scope, 'MobileNet', [inputs, num_classes],
                               reuse=reuse) as scope:
            with slim.arg_scope([slim.batch_norm, slim.dropout],
                                is_training=is_training):
                net, end_points = mob.mobilenet_v1_base(inputs, scope=scope,
                                                    min_depth=min_depth,
                                                    depth_multiplier=depth_multiplier,
                                                    conv_defs=conv_defs)
                with tf.variable_scope('ImageLogits'):
                    ## Add prediction layers
                    kernel_size = MobileNet._reduced_kernel_size_for_small_input(net, [7, 7])
                    net = slim.avg_pool2d(net, kernel_size, padding='VALID',
                                          scope='AvgPool_1a')
                    end_points['AvgPool_1a'] = net
                    # 1 x 1 x 1024
                    net = slim.dropout(net, keep_prob=dropout_keep_prob, scope='Dropout_1b')

                    kernel_size = (net.shape[1], net.shape[2])
                    # output should be Batch_sizex1x1xnum_classes
                    logits = slim.conv2d(net, num_classes, kernel_size=kernel_size, padding='VALID', scope='Conv2d_1c_1x1')
                    end_points['AvgPool_1a'] = logits
                    # output should be Batch_sizexHxWxnum_classes where (H,W) = size of the original image

                    deconv_logits = slim.conv2d_transpose(logits, num_classes, kernel_size=deconv_size, padding='VALID')
                end_points['ImageLogits'] = deconv_logits
                predictions = tf.argmax(deconv_logits, axis=3)
                end_points['Predictions'] = predictions

        self.deconv_logits = deconv_logits
        self.end_points = end_points

    def loss(self, labels, loss_func = tf.nn.sparse_softmax_cross_entropy_with_logits):
        return loss_func(labels=labels, logits=self.deconv_logits)


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
    def __init__(self, inputs, image_size, num_classes=11,  scope='SegmentationNet', base_net_name='MobileNet'):

        if(base_net_name == 'MobileNet'):
            net_class = MobileNet(inputs, image_size, num_classes=num_classes, scope=scope)
        elif(base_net_name == 'ResNet50'):
            net_class = Resnet50(inputs, scope=scope)
        else:
            raise ValueError('You must choose from ''MobileNet'' or ''ResNet50''')

        self.net_class = net_class

    def loss(self, labels, loss_func = tf.nn.sparse_softmax_cross_entropy_with_logits):
        return self.net_class.loss(labels, loss_func)

    def get_predictions(self):
        return self.net_class.end_points['Predictions']

if __name__ == '__main__':

    dataset = DataSet(2, 7)
    xbatch, ybatch = dataset.get_permuted_batch(1)
    print('xbatxh shape: ', xbatch.shape)
    print('ybatch shape: ', ybatch.shape)
    x = tf.placeholder(tf.float32, xbatch.shape, name='placeholder_x')
    y = tf.placeholder(tf.int32, ybatch.shape, name='placeholder_y')
    model = SegmentationNetwork(x, ybatch[0].shape)
    print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    print('prediction shape', model.get_predictions().shape)

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
        for iter in range(200):
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
