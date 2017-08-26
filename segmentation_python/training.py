import numpy as np
from scipy import misc
import tensorflow as tf
import matplotlib.pyplot as plt
from data_utils import DataSet
from networks import SegmentationNetwork
import time
import utils

if __name__ == '__main__':

    dataset = DataSet(num_poses=1, num_angles=360, max_records_in_tfrec_file=360)
    batch_size = 1
    num_epochs = 1

    data_dim = dataset.data_dim
    depths, labels = dataset.get_batch_from_tfrecords_via_queue(batch_size=batch_size, num_epochs=num_epochs, type='test')

    model = SegmentationNetwork(depths, data_dim)
    print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    predictions = model.get_predictions()
    print('prediction shape', predictions.shape)

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
            start_time = time.time()
            while not coord.should_stop():



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
                _, loss, pred, corr_depth, correct_label = sess.run([train_op, cross_entropy_loss, predictions, tf.squeeze(depths), tf.squeeze(labels)])

                loss_value = np.sum(loss)

                #pred = sess.run(model.get_predictions())
                #last_label = sess.run(labels)

                #print('pred shape: ', pred.shape)
                #print('last label shape: ', last_label.shape)


                # Print an overview fairly often.
                if step % 100 == 0:
                    duration = time.time() - start_time
                    print('Step %d: loss = %.2f (%.3f sec)' % (step, loss_value,
                                                               duration))
                    utils.save_checkpoint(sess, step)

                step += 1

        except tf.errors.OutOfRangeError:
            print('Done training for %d epochs, %d steps.' % (1, step))
        finally:
            # When done, ask the threads to stop.
            utils.save_checkpoint(sess, step)

            coord.request_stop()

            end_time = time.time()
            print('Time taken for training: ', end_time - start_time)


        # Wait for threads to finish.
        coord.join(threads)

        rgbPred = DataSet.label2rgb(pred[0])
        plt.subplot(1, 3, 1)
        plt.imshow(rgbPred)
        plt.axis('off')
        plt.subplot(1, 3, 2)
        plt.imshow(DataSet.label2rgb(correct_label))
        plt.axis('off')
        plt.subplot(1, 3, 3)
        plt.imshow(corr_depth)
        plt.axis('off')
        plt.show()