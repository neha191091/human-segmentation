import math
import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt
import time
import utils as utils
import os
from tensorflow.contrib import slim
from initialize import _DATA_PATH, _CHKPT_PATH ,_RESULT_PATH
from data_utils import Dataset_Raw_Provide
from net_main import SegmentationNetwork
from conv_defs import _CONV_DEFS

def train(dir_raw_record,
          batch_size,
          num_epochs,
          data_dims_from_ckpt = None,
          chckpt_interval = 200,
          lr=1e-4,
          show_last_prediction = True,
          load_from_chkpt=None,
          multi_deconv=1,
          mob_depth_multiplier=1.0,
          conv_def_num = 0,
          follow_up_convs = 0,
          sep_convs = False,
          depthsep_inter_norm_activn = True):
    '''
    Train the network using TfRecords
    :param dir_raw_record: Directory from which the data is produced
    :param batch_size: batch size for training
    :param num_epochs: numbe of epochs you want to run the training for
    :param chckpt_interval: number of epochs after which you want save a checkpoint
    :param lr: initial learning rate
    :param show_last_prediction: Do you want to see the last prediction after training
    :param load_from_chkpt: Load the checkpoint from which you want to commence training
    :param multi_deconv: Set true to allow multiple layers in deconv network
    :param mob_f_ep: The mobilenet layer upto which the network must be built
    :param mob_depth_multiplier: depth multiplier of mobilenet to reduce the number of parameters
    :return: N/A
    '''
    dataset = Dataset_Raw_Provide(dir_raw_record)
    data_dim = dataset.data_dim
    print('Data dimension: ', data_dim)
    print('Data dims from chkpt ', data_dims_from_ckpt)

    if load_from_chkpt and (not data_dims_from_ckpt == data_dim):
        print('The data dimensions from chkpt and data do not match')
        return

    conv_defs = _CONV_DEFS[conv_def_num]

    num_its = math.floor(dataset.total_samples / batch_size)
    print('Total raw samples', dataset.total_samples)
    print('batch size', batch_size)

    depths = tf.placeholder(dtype=tf.float32, shape=[batch_size, data_dim[0], data_dim[1], 1])
    labels = tf.placeholder(dtype=tf.int32, shape=[batch_size, data_dim[0], data_dim[1]])

    print('depths: ', depths, ' labels: ', labels)

    model = SegmentationNetwork(depths,
                                data_dim,
                                is_training=True,
                                multi_deconv=multi_deconv,
                                mob_depth_multiplier=mob_depth_multiplier,
                                conv_defs=conv_defs,
                                follow_up_convs = follow_up_convs,
                                sep_convs = sep_convs,
                                depthsep_inter_norm_activn = depthsep_inter_norm_activn)
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
    utils.print_chkpoint_details(batch_size=batch_size,
                                 num_epochs=num_epochs,
                                 override_tfrecords=None,
                                 lr=lr,
                                 load_from_chkpt=load_from_chkpt,
                                 chkpt_details_file_path=chkpt_details_file_path,
                                 multi_deconv=multi_deconv,
                                 conv_def_num=conv_def_num,
                                 mob_depth_multiplier=mob_depth_multiplier,
                                 data_dims=data_dim,
                                 depthsep_inter_norm_activn = depthsep_inter_norm_activn)

    if load_from_chkpt:
        chkpt_text = str(load_from_chkpt.split('/')[-1].split('.')[0])
    else:
        chkpt_text = str(None)

    training_result_path = _RESULT_PATH + '_training_raw_' + '%s' % timestamp + "_lr_" + str(lr) + "_batch_" + str(
        batch_size) + "_ckpt_" + chkpt_text + "/"
    if not os.path.exists(training_result_path):
        os.makedirs(training_result_path)

    metrics_file_path = training_result_path + "train_metrics.txt"
    utils.print_chkpoint_details(batch_size=batch_size,
                                 num_epochs=num_epochs,
                                 override_tfrecords=None,
                                 lr=lr,
                                 load_from_chkpt=load_from_chkpt,
                                 chkpt_details_file_path=metrics_file_path,
                                 multi_deconv=multi_deconv,
                                 conv_def_num=conv_def_num,
                                 mob_depth_multiplier=mob_depth_multiplier,
                                 data_dims=data_dim,
                                 depthsep_inter_norm_activn = depthsep_inter_norm_activn)
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
            print('Epoch: ', epoch)
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
                    [train_op, cross_entropy_loss, predictions, depths, labels],
                    feed_dict={depths: depths_data, labels: labels_data})

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

                utils.visualize_predictions(pred[j],np.squeeze(corr_label[j]),np.squeeze(corr_depth[j]),
                                            path = image_result_part_path + str(step-1) + '_' + str(j) + '.png')

if __name__ == '__main__':

    # dataset = DataSet(num_poses=53, num_angles=360, max_records_in_tfrec_file=3600, val_fraction=0.01,
    #                   test_fraction=0.01)

    #dir_raw_record = _DATA_PATH + 'raw_data_render_example_by_4'
    dir_raw_record = '/home/neha/segmentation/' + 'data/blender_data/render_data'
    batch_size = 100
    num_epochs = 1
    lr = 1e-3
    load_from_chkpt = None#_CHKPT_PATH + '2018_04_01_15_38_checkpoint-1.ckpt'
    #load_from_chkpt = _CHKPT_PATH + '2018_04_29_06_56_checkpoint200.ckpt'
    multi_deconv = 1
    mob_depth_multiplier = 0.75
    conv_def_num = 1
    data_dims_from_ckpt = None
    follow_up_convs = 0
    sep_convs = False
    depthsep_inter_norm_activn = True

    if load_from_chkpt:
        multi_deconv, conv_def_num, mob_depth_multiplier, data_dims_from_ckpt, follow_up_convs, sep_convs, depthsep_inter_norm_activn = utils.get_model_details_from_chkpt_path(load_from_chkpt)

    #print(conv_defs.ltype)

    train(dir_raw_record=dir_raw_record,
          batch_size=batch_size,
          num_epochs=num_epochs,
          data_dims_from_ckpt = data_dims_from_ckpt,
          lr=lr,
          load_from_chkpt=load_from_chkpt,
          multi_deconv=multi_deconv,
          mob_depth_multiplier=mob_depth_multiplier,
          conv_def_num=conv_def_num,
          follow_up_convs = follow_up_convs,
          sep_convs = sep_convs,
          depthsep_inter_norm_activn = depthsep_inter_norm_activn)
