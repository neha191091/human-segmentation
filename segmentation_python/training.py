import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt
import time
import utils
import os
from tensorflow.contrib import slim
from initialize import _PROJECT_PATH, _CHKPT_PATH ,_RESULT_PATH
from data_utils import DataSet
from networks import SegmentationNetwork

'''
This script contains modules that can be called to train from the tfRecord data.
'''

def train(dataset, batch_size, num_epochs, chckpt_interval = 100, lr=1e-4, show_last_prediction = True, override_tfrecords = None, load_from_chkpt=None):
    '''
    Train the network using TfRecords
    :param dataset: Object of the class DataSet
    :param batch_size: batch size for training
    :param num_epochs: numbe of epochs you want to run the training for
    :param chckpt_interval: number of epochs after which you want save a checkpoint
    :param lr: initial learning rate
    :param show_last_prediction: Do you want to see the last prediction after training
    :param override_tfrecords: name of the tfRecord file you want to train from. If not supplied, all training data will be used
    :param load_from_chkpt: Load the checkpoint from which you want to commence training
    :return: N/A
    '''

    data_dim = dataset.data_dim
    batch_size_tensor = tf.placeholder_with_default(batch_size, shape=[])
    depths, labels = dataset.get_batch_from_tfrecords_via_queue(batch_size=batch_size, num_epochs=num_epochs,
                                                                type='train', override_tfrecords = override_tfrecords)
    print('depths: ', depths, ' labels: ', labels)

    model = SegmentationNetwork(depths, data_dim, is_training=True)
    print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    predictions = model.get_predictions()
    print('prediction shape', predictions.shape)

    cross_entropy_loss = model.loss(labels)
    #TODO: Fix if correct
    train_op = slim.learning.create_train_op(cross_entropy_loss,tf.train.AdamOptimizer(learning_rate=lr))
    #train_op = tf.train.AdamOptimizer(learning_rate=lr).minimize(cross_entropy_loss)

    coord = tf.train.Coordinator()
    init_op = tf.group(tf.global_variables_initializer(),
                       tf.local_variables_initializer())

    timestamp = utils.get_timestamp()

    chkpt_details_file_path = _CHKPT_PATH + '%s' % timestamp + "_ckpt_details.txt"
    utils.print_chkpoint_details(batch_size,num_epochs,override_tfrecords,lr,load_from_chkpt,chkpt_details_file_path)

    training_result_path = _RESULT_PATH + '%s' % timestamp + "_lr_" + str(lr) + "_batch_" + str(batch_size) + "_ckpt_" + str(load_from_chkpt) + "/"
    if not os.path.exists(training_result_path):
        os.makedirs(training_result_path)

    metrics_file_path = training_result_path + "train_metrics.txt"
    utils.print_chkpoint_details(batch_size,num_epochs,override_tfrecords,lr,load_from_chkpt,metrics_file_path)
    image_result_part_path = training_result_path + "train_img_"
    loss_path = training_result_path + "loss.png"

    with tf.Session() as sess:
        sess.run(init_op)
        threads = tf.train.start_queue_runners(sess=sess, coord=coord)
        step = 0
        step_vector = []
        loss_vector = []
        acc_vector = []

        if load_from_chkpt:
            utils.load_checkpoint(sess, load_from_chkpt)

        start_time = time.time()
        try:
            while not coord.should_stop():
            #for it in range(1):

                # Run one step of the model.  The return values are
                # the activations from the `train_op` (which is
                # discarded) and the `loss` op.  To inspect the values
                # of your ops or variables, you may include them in
                # the list passed to sess.run() and the value tensors
                # will be returned in the tuple from the call.
                _, loss, pred, corr_depth, corr_label = sess.run(
                    [train_op, cross_entropy_loss, predictions, depths, labels])

                loss_value = np.mean(loss)

                # pred = sess.run(model.get_predictions())
                # last_label = sess.run(labels)

                # print('pred shape: ', pred.shape)
                # print('last label shape: ', last_label.shape)


                step_vector.append(step)
                loss_vector.append(loss_value)
                # Print an overview fairly often.
                if step % chckpt_interval == 0:
                    acc = utils.accuracy_per_pixel(pred, corr_label)
                    utils.print_metrics(loss=loss_value,accuracy=acc,step=step,metrics_file_path=metrics_file_path)
                    utils.save_checkpoint(sess, timestamp, step)
                    utils.plot_loss(step_vector, loss_vector, loss_path)

                step += 1

        except tf.errors.OutOfRangeError:
            print('Done training for %d epochs, %d steps.' % (num_epochs, step))
        finally:
            # When done, ask the threads to stop.
            acc = utils.accuracy_per_pixel(pred, corr_label)
            utils.print_metrics(loss=loss_value,accuracy=acc,step=step,metrics_file_path=metrics_file_path)
            # step_vector.append(step)
            # loss_vector.append(loss_value)
            utils.save_checkpoint(sess, timestamp, -1)

            coord.request_stop()

            end_time = time.time()
            print('Time taken for training: ', end_time - start_time)

        # Wait for threads to finish.
        coord.join(threads)
        utils.plot_loss(step_vector, loss_vector, loss_path)

        if show_last_prediction:
            for j in range(batch_size):

                utils.visualize_predictions(pred[j],np.squeeze(corr_label[j]),np.squeeze(corr_depth[j]),path = image_result_part_path + str(step) + '_' + str(j) + '.png')

if __name__ == '__main__':

    #dataset = DataSet(num_poses=53, num_angles=360, max_records_in_tfrec_file=3600, val_fraction=0.01, test_fraction=0.01)
    dataset = DataSet(num_poses=1, num_angles=360, max_records_in_tfrec_file=360, val_fraction=0.1, test_fraction=0.1)
    batch_size = 144
    num_epochs = 200
    override_tfrecords = [_PROJECT_PATH+'data/data_single_model_by_4/TfRecordFile_train_0.tfrecords']
    #chkpt = _CHKPT_PATH+'2017_09_17_17_30_checkpoint100.ckpt'

    train(dataset=dataset,batch_size=batch_size,num_epochs=num_epochs, lr=1e-3, override_tfrecords=override_tfrecords, load_from_chkpt = None)

