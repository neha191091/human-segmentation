import math
import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt
import time
import utils
import os
from tensorflow.contrib import slim
from initialize import _CHKPT_PATH ,_RESULT_PATH
from data_utils import DataSet
from networks import SegmentationNetwork

def train(dataset, batch_size, num_epochs, chckpt_interval = 100, lr=1e-4, show_last_prediction = True, override_tfrecords = None, load_from_chkpt=None):
    data_dim = dataset.data_dim
    print('Data dimension: ', data_dim)
    # batch_size_tensor = tf.placeholder_with_default(batch_size, shape=[])
    # depths, labels = dataset.get_batch_from_tfrecords_via_queue(batch_size=batch_size_tensor, num_epochs=num_epochs,
    #                                                             type='train', override_tfrecords = override_tfrecords)


    num_its = math.ceil(dataset.total_samples / batch_size)

    depths = tf.placeholder(dtype=tf.float32, shape=[None, data_dim[0], data_dim[1], 1])
    labels = tf.placeholder(dtype=tf.int32, shape=[None, data_dim[0], data_dim[1]])

    print('depths: ', depths, ' labels: ', labels)

    model = SegmentationNetwork(depths, data_dim, is_training=True)
    print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    predictions = model.get_predictions()
    print('prediction shape', predictions.shape)

    cross_entropy_loss = model.loss(labels)
    # TODO: Fix if correct
    train_op = slim.learning.create_train_op(cross_entropy_loss, tf.train.AdamOptimizer(learning_rate=lr))
    # train_op = tf.train.AdamOptimizer(learning_rate=lr).minimize(cross_entropy_loss)

    init_op = tf.group(tf.global_variables_initializer(),
                       tf.local_variables_initializer())

    timestamp = utils.get_timestamp()

    chkpt_details_file_path = _CHKPT_PATH + '%s' % timestamp + "_ckpt_details.txt"
    utils.print_chkpoint_details(batch_size,num_epochs,override_tfrecords,lr,load_from_chkpt,chkpt_details_file_path)

    training_result_path = _RESULT_PATH + '%s' % timestamp + "/"
    if not os.path.exists(training_result_path):
        os.makedirs(training_result_path)

    metrics_file_path = training_result_path + "train_metrics.txt"
    utils.print_chkpoint_details(batch_size, num_epochs, override_tfrecords, lr, load_from_chkpt,
                                 metrics_file_path)
    image_result_part_path =training_result_path + "train_img_"
    loss_path = training_result_path + "loss.png"

    with tf.Session() as sess:
        sess.run(init_op)
        step = 0
        step_vector = []
        loss_vector = []
        acc_vector = []

        if load_from_chkpt:
            utils.load_checkpoint(sess, load_from_chkpt)

        start_time = time.time()
        for epoch in range(num_epochs):

            dataset.initialize_epoch_for_raw_data(permutate=True)

            for it in range(num_its):

                depths_data, labels_data = dataset.get_batch_from_raw_data(batch_size, convert2tensor=False)

                # Run one step of the model.  The return values are
                # the activations from the `train_op` (which is
                # discarded) and the `loss` op.  To inspect the values
                # of your ops or variables, you may include them in
                # the list passed to sess.run() and the value tensors
                # will be returned in the tuple from the call.
                _, loss, pred, corr_depth, corr_label = sess.run(
                    [train_op, cross_entropy_loss, predictions, depths, labels], feed_dict={depths: depths_data, labels: labels_data})

                loss_value = np.mean(loss)

                # pred = sess.run(model.get_predictions())
                # last_label = sess.run(labels)

                # print('pred shape: ', pred.shape)
                # print('last label shape: ', last_label.shape)


                step_vector.append(step)
                loss_vector.append(loss_value)
                # Print an overview fairly often.
                if step % chckpt_interval == 0 or (epoch == num_epochs-1 and it == num_its - 1):
                    acc = utils.accuracy_per_pixel(pred, corr_label)
                    utils.print_metrics(loss=loss_value,accuracy=acc,step=step,metrics_file_path=metrics_file_path)
                    utils.save_checkpoint(sess, timestamp, step)
                    utils.plot_loss(step_vector, loss_vector, loss_path)

                step += 1

        end_time = time.time()
        print('Time taken for training: ', end_time - start_time)

        # Wait for threads to finish.
        utils.plot_loss(step_vector, loss_vector, loss_path)

        if show_last_prediction:
            for j in range(batch_size):

                utils.visualize_predictions(pred[j],np.squeeze(corr_label[j]),np.squeeze(corr_depth[j]),path = image_result_part_path + str(step-1) + '_' + str(j) + '.png')

if __name__ == '__main__':
    # dataset = DataSet(num_poses=53, num_angles=360, max_records_in_tfrec_file=3600, val_fraction=0.01,
    #                   test_fraction=0.01)

    dataset = DataSet(num_poses=1, num_angles=360, max_records_in_tfrec_file=360, val_fraction=0.1, test_fraction=0.1)
    batch_size = 144
    num_epochs = 100
    override_tfrecords = ['/home/neha/Documents/TUM_Books/projects/IDP/segmentation/segmentation_python/data_single_model_by_4/TfRecordFile_train_0.tfrecords']
    chkpt = '/home/neha/Documents/TUM_Books/projects/IDP/segmentation/segmentation_python/chkpt/2017_09_17_17_30_checkpoint100.ckpt'

    train(dataset=dataset,batch_size=batch_size,num_epochs=num_epochs, lr=1e-3, override_tfrecords=None, load_from_chkpt = None)

