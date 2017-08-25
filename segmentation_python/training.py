import numpy as np
from scipy import misc
import tensorflow as tf
import matplotlib.pyplot as plt
from data_utils import DataSet
from networks import SegmentationNetwork
import time

if __name__ == '__main__':

    dataset = DataSet(num_poses=1, num_angles=360, max_pairs=100)

    data_dim = dataset.data_dim
    depths, labels = dataset.inputs(batch_size=1, num_epochs=1, type='test')

    model = SegmentationNetwork(depths, data_dim)
    print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    print('prediction shape', model.get_predictions().shape)

    cross_entropy_loss = model.loss(labels)
    train_op = tf.train.AdamOptimizer(1e-4).minimize(cross_entropy_loss)

    coord = tf.train.Coordinator()
    init_op = tf.group(tf.global_variables_initializer(),
                       tf.local_variables_initializer())

    pred = []
    last_label = []

    with tf.Session() as sess:
        sess.run(init_op)
        threads = tf.train.start_queue_runners(sess=sess, coord=coord)
        step = 0
        try:
            starttime = time.time()
            while not coord.should_stop():
                start_time = time.time()

                duration = time.time() - start_time

                # Print the details of the input data
                # depths_val, labels_val = sess.run([tf.squeeze(depths), labels])
                # print('Step:', step, '; depths shape: ', depths_val.shape, '; label shape: ', labels_val.shape)
                #
                # print(depths_val)
                #
                # rgb_label = DataSet.label2rgb(labels_val[0])
                #
                # print(labels_val[0])
                #
                # plt.subplot(1, 2, 1)
                # plt.imshow(depths_val)
                # plt.axis('off')
                # plt.subplot(1, 2, 2)
                # plt.imshow(rgb_label)
                # plt.axis('off')
                # plt.show()

                # Run one step of the model.  The return values are
                # the activations from the `train_op` (which is
                # discarded) and the `loss` op.  To inspect the values
                # of your ops or variables, you may include them in
                # the list passed to sess.run() and the value tensors
                # will be returned in the tuple from the call.
                _, loss = sess.run([train_op, cross_entropy_loss])

                print('loss_shape', loss.shape)

                loss_value = np.sum(loss)

                pred = sess.run(model.get_predictions())
                last_label = sess.run(labels)

                print('pred shape: ', pred.shape)
                print('last label shape: ', last_label.shape)

                # Print an overview fairly often.
                if step % 1 == 0:
                    print('Step %d: loss = %.2f (%.3f sec)' % (step, loss_value,
                                                               duration))

                step += 1

        except tf.errors.OutOfRangeError:
            print('Done training for %d epochs, %d steps.' % (1, step))
        finally:
            # When done, ask the threads to stop.
            coord.request_stop()

            endtime = time.time()
            print('Time taken for training: ', endtime - starttime)


        # Wait for threads to finish.
        coord.join(threads)

        rgbPred = DataSet.label2rgb(pred[0])
        plt.subplot(1, 2, 1)
        plt.imshow(rgbPred)
        plt.axis('off')
        plt.subplot(1, 2, 2)
        plt.imshow(DataSet.label2rgb(last_label[0]))
        plt.axis('off')
        plt.show()