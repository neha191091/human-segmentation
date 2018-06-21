import numpy as np
import tensorflow as tf
import time
import utils as utils
import os
from tensorflow.contrib import slim
from initialize import _DATA_PATH, _CHKPT_PATH ,_RESULT_PATH
from data_utils import DataSet, Dataset_TF_Provide
from net_main import SegmentationNetwork
from conv_defs import _CONV_DEFS

'''
This script contains modules that can be called to train from the tfRecord data.
'''

def train(dir_tf_record,
          batch_size,
          num_epochs,
          data_dims_from_ckpt = None,
          chckpt_interval = 10000,
          lr=1e-4,
          show_last_prediction = True,
          override_tfrecords = None,
          load_from_chkpt=None,
          multi_deconv=1,
          conv_def_num = 0,
          mob_depth_multiplier=1.0,
          follow_up_convs = 0,
          sep_convs = False):
    '''
    Train the network using TfRecords
    :param dir_tf_record: Directory from which the data is produced
    :param batch_size: batch size for training
    :param num_epochs: numbe of epochs you want to run the training for
    :param chckpt_interval: number of epochs after which you want save a checkpoint
    :param lr: initial learning rate
    :param show_last_prediction: Do you want to see the last prediction after training
    :param override_tfrecords: name of the tfRecord file you want to train from. If not supplied, all training data will be used
    :param load_from_chkpt: Load the checkpoint from which you want to commence training
    :param multi_deconv: Set true to allow multiple layers in deconv network
    :param mob_f_ep: The mobilenet layer upto which the network must be built
    :param mob_depth_multiplier: depth multiplier of mobilenet to reduce the number of parameters
    :return: N/A
    '''

    data_dim = utils.get_img_dim_from_data_dir(dir_tf_record)

    print('Data dimension: ', data_dim)
    print('Data dims from chkpt ', data_dims_from_ckpt)

    if load_from_chkpt and (not data_dims_from_ckpt == data_dim):
        print('The data dimensions from chkpt and data do not match')
        return

    conv_defs = _CONV_DEFS[conv_def_num]
    batch_size_tensor = tf.placeholder_with_default(batch_size, shape=[])

    depths, labels = Dataset_TF_Provide.get_batch_from_tfrecords_via_queue(dir_tf_record=dir_tf_record,
                                                                           batch_size=batch_size_tensor,
                                                                           num_epochs=num_epochs,
                                                                           type='train',
                                                                           override_tfrecords = override_tfrecords)
    print('depths: ', depths, ' labels: ', labels)

    model = SegmentationNetwork(depths,
                                data_dim,
                                is_training=True,
                                multi_deconv=multi_deconv,
                                conv_defs=conv_defs,
                                mob_depth_multiplier=mob_depth_multiplier,
                                follow_up_convs = follow_up_convs,
                                sep_convs = sep_convs)



    print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    predictions = model.get_predictions()
    print('prediction shape', predictions.shape)

    cross_entropy_loss = model.loss(labels)

    train_op = slim.learning.create_train_op(cross_entropy_loss,tf.train.AdamOptimizer(learning_rate=lr))

    coord = tf.train.Coordinator()
    init_op = tf.group(tf.global_variables_initializer(),
                       tf.local_variables_initializer())

    timestamp = utils.get_timestamp()


    chkpt_details_file_path = _CHKPT_PATH + '%s' % timestamp + "_ckpt_details.txt"
    utils.print_chkpoint_details(batch_size= batch_size,
                                 num_epochs= num_epochs,
                                 override_tfrecords= override_tfrecords,
                                 lr= lr,
                                 load_from_chkpt= load_from_chkpt,
                                 chkpt_details_file_path= chkpt_details_file_path,
                                 multi_deconv=multi_deconv,
                                 conv_def_num=conv_def_num,
                                 mob_depth_multiplier=mob_depth_multiplier,
                                 data_dims=data_dim,
                                 follow_up_convs = follow_up_convs,
                                 sep_convs = sep_convs)

    if load_from_chkpt:
        chkpt_text = str(load_from_chkpt.split('/')[-1].split('.')[0])
    else:
        chkpt_text = str(None)

    training_result_path = _RESULT_PATH + '_training_tf_' + '%s' % timestamp + "_lr_" + str(lr) + "_batch_" + str(
        batch_size) + "_ckpt_" + chkpt_text + "/"
    if not os.path.exists(training_result_path):
        os.makedirs(training_result_path)

    metrics_file_path = training_result_path + "train_metrics.txt"
    utils.print_chkpoint_details(batch_size= batch_size,
                                 num_epochs= num_epochs,
                                 override_tfrecords= override_tfrecords,
                                 lr= lr,
                                 load_from_chkpt= load_from_chkpt,
                                 chkpt_details_file_path= metrics_file_path,
                                 multi_deconv=multi_deconv,
                                 conv_def_num=conv_def_num,
                                 mob_depth_multiplier=mob_depth_multiplier,
                                 data_dims=data_dim,
                                 follow_up_convs = follow_up_convs,
                                 sep_convs = sep_convs)

    image_result_part_path = training_result_path + "train_img_"
    loss_path = training_result_path + "loss.png"
    loss_npy_path = training_result_path + "loss_npy.npy"

    network_endpoints = model.net_class.end_points
    print('\nModel Endpoints with Output Shape')
    for key in network_endpoints:
        print(key, ", ",network_endpoints[key].shape)
    print('\n')

    utils.print_model_details(model, metrics_file_path)

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
                #print('Step ',step)
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
                    #utils.plot_loss(step_vector, loss_vector, loss_path)
                    utils.save_loss(loss_vector, loss_npy_path)
                    print('Step ',step)

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
        #utils.plot_loss(step_vector, loss_vector, loss_path)
        utils.save_loss(loss_vector, loss_npy_path)

        if show_last_prediction:
            for j in range(batch_size):

                utils.visualize_predictions(pred[j],np.squeeze(corr_label[j]),np.squeeze(corr_depth[j]),
                                            path = image_result_part_path + str(step) + '_' + str(j) + '.png')

if __name__ == '__main__':

    #dataset = DataSet(num_poses=53, num_angles=360, max_records_in_tfrec_file=3600, val_fraction=0.01, test_fraction=0.01)
    #dataset = DataSet(num_poses=1, num_angles=360, max_records_in_tfrec_file=360, val_fraction=0.1, test_fraction=0.1)

    #dir_tf_record = _DATA_PATH+'data_single_model'#_by_4'
    dir_tf_record = '/home/neha/segmentation/' + 'data/blender_data/render_data_corrected_TWO_tf_300'
    #dir_tf_record = '/media/neha/ubuntu/data/segmentation/render_data_corrected_TWO_tf_300'
    batch_size = 50
    num_epochs = 100
    lr = 1e-3
    override_tfrecords = None #['train_0']
    load_from_chkpt = None #_CHKPT_PATH+'2018_04_01_15_38_checkpoint-1.ckpt'
    multi_deconv = 3
    mob_depth_multiplier = 1
    conv_def_num = 6
    data_dims_from_ckpt = None
    follow_up_convs = 1
    sep_convs = True

    if load_from_chkpt:
        multi_deconv, conv_def_num, mob_depth_multiplier, data_dims_from_ckpt, follow_up_convs, sep_convs = utils.get_model_details_from_chkpt_path(load_from_chkpt)

    train(dir_tf_record=dir_tf_record,
          batch_size=batch_size,
          num_epochs=num_epochs,
          data_dims_from_ckpt = data_dims_from_ckpt,
          lr=lr,
          override_tfrecords=override_tfrecords,
          load_from_chkpt = load_from_chkpt,
          multi_deconv=multi_deconv,
          conv_def_num=conv_def_num,
          mob_depth_multiplier=mob_depth_multiplier,
          follow_up_convs = follow_up_convs,
          sep_convs = sep_convs)
