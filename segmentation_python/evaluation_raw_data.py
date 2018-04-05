import numpy as np
import tensorflow as tf
from segmentation_python.data_utils import Dataset_Raw_Provide
from segmentation_python.net_main import SegmentationNetwork
import time
import segmentation_python.utils as utils
from segmentation_python.initialize import _DATA_PATH, _CHKPT_PATH, _RESULT_PATH, _TINY
import os
import math
from segmentation_python.conv_defs import _CONV_DEFS

'''
Script to evaluate the network by using raw test data
'''

# TODO: Confusion matrix, IOU
def eval(dir_raw_record,
          batch_size,
          num_epochs,
          data_dims_from_ckpt = None,
          save_prediction_interval=1,
          show_last_prediction = True,
          load_from_chkpt=None,
          multi_deconv=True,
          conv_defs=_CONV_DEFS[0],
          mob_depth_multiplier=1.0):
    '''
    Evaluate the network from tfRecords.
    :param dir_raw_record: Directory from which the data is produced
    :param batch_size: batch size
    :param num_epochs: number of epochs
    :param save_prediction_interval: n where per n predictions are saved
    :param show_last_prediction: true if you want to show the last prediction
    :param load_from_chkpt: file path for the checkpoint to be loaded
    :param multi_deconv: Set true to allow multiple layers in deconv network
    :param mob_f_ep: The mobilenet layer upto which the network must be built
    :param mob_depth_multiplier: depth multiplier of mobilenet to reduce the number of parameters
    :return:
    '''
    dataset = Dataset_Raw_Provide(dir_raw_record)
    data_dim = dataset.data_dim
    print('Data dimension: ', data_dim)
    print('Data dims from chkpt ', data_dims_from_ckpt)

    if load_from_chkpt and (not data_dims_from_ckpt == data_dim):
        print('The data dimensions from chkpt and data do not match')
        return

    depths = tf.placeholder(dtype=tf.float32, shape=[None, data_dim[0], data_dim[1], 1])
    labels = tf.placeholder(dtype=tf.int32, shape=[None, data_dim[0], data_dim[1]])

    model = SegmentationNetwork(depths,
                                data_dim,
                                is_training=True,
                                dropout_keep_prob=1.0,
                                multi_deconv=multi_deconv,
                                conv_defs=conv_defs,
                                mob_depth_multiplier=mob_depth_multiplier)

    print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    predictions = model.get_predictions()
    print('prediction shape', predictions.shape)

    cross_entropy_loss = model.loss(labels)

    init_op = tf.group(tf.global_variables_initializer(),
                       tf.local_variables_initializer())

    timestamp = utils.get_timestamp()
    evaluation_result_path = _RESULT_PATH + '_evaluation_raw_' + '%s' % timestamp + "_batch_" + str(
        batch_size) + "_ckpt_" + str(load_from_chkpt.split('/')[-1].split('.')[0]) + "/"
    if not os.path.exists(evaluation_result_path):
        os.makedirs(evaluation_result_path)
    test_details_file_path = evaluation_result_path + "test_details.txt"
    utils.print_test_details(batch_size, num_epochs, None, load_from_chkpt,
                                 test_details_file_path)
    metrics_file_path = evaluation_result_path + "test_metrics.txt"
    image_result_part_path = evaluation_result_path + "test_image_"
    pred_result_part_path = evaluation_result_path + "human_0_rgb_"
    loss_path = evaluation_result_path + "loss.png"
    with tf.Session() as sess:
        sess.run(init_op)
        step = 0
        step_vector = []
        loss_vector = []
        acc_vector = []
        TP_sum = np.zeros((10,))
        TN_sum = np.zeros((10,))
        FP_sum = np.zeros((10,))
        FN_sum = np.zeros((10,))

        if load_from_chkpt:
            utils.load_checkpoint(sess, load_from_chkpt)
        else:
            print('Error! Pass a checkpoint to load')
            return

        start_time = time.time()
        try:
            #while not coord.should_stop():
            dataset.initialize_epoch_for_raw_data(permutate=False)
            loopsize = math.floor(dataset.total_samples/batch_size)
            for iter in range(loopsize):
                # Run one step of the model.  The return values are
                # the activations from the `train_op` (which is
                # discarded) and the `loss` op.  To inspect the values
                # of your ops or variables, you may include them in
                # the list passed to sess.run() and the value tensors
                # will be returned in the tuple from the call.
                depths_data, labels_data = dataset.get_batch_from_raw_data(batch_size, convert2tensor=False)
                #depths_data = np.repeat(depths_data, 144, axis=0)
                #labels_data = np.repeat(labels_data, 144, axis=0)
                # print('shape depth: ', depths_data.shape, ' shape labels: ', labels_data.shape)
                loss, pred, corr_depth, corr_label = sess.run(
                    [cross_entropy_loss, predictions, depths, labels], feed_dict={depths: depths_data, labels: labels_data})

                loss_value = np.mean(loss)

                # pred = sess.run(model.get_predictions())
                # last_label = sess.run(labels)

                # print('pred shape: ', pred.shape)
                # print('last label shape: ', last_label.shape)


                # Print an overview fairly often.
                if step % save_prediction_interval == 0:
                    TP, TN, FP, FN = utils.get_confusion_matrix(pred, corr_label)
                    TP_sum += TP
                    TN_sum += TN
                    FP_sum += FP
                    FN_sum += FN
                    acc = utils.accuracy_per_pixel(pred, corr_label)
                    utils.print_metrics(loss=loss_value,accuracy=acc,step=step,metrics_file_path=metrics_file_path)
                    step_vector.append(step)
                    loss_vector.append(loss_value)
                    #utils.visualize_predictions(pred[0],np.squeeze(corr_label[0]),np.squeeze(corr_depth[0]),path = image_result_part_path + str(step) + '.png')
                    utils.save_predictions(pred[0], np.squeeze(corr_depth[0]),
                                                path=pred_result_part_path + str(step) + '.png', interpolation = 'bilinear')

                step += 1
                print('step: ',step)

        except tf.errors.OutOfRangeError:
            print('Done training for %d epochs, %d steps.' % (1, step))
        finally:
            end_time = time.time()
            print('Time taken for training: ', end_time - start_time)

            # Get IOU over complete data
            IOU = np.mean(TP_sum / (TP_sum + FP_sum + FN_sum + _TINY))
            metrics_file = open(metrics_file_path, 'a+')
            print('IOU OVER COMPLETE EVALUATION DATA: ' + str(IOU), file=metrics_file)
            metrics_file.close()

        utils.plot_loss(step_vector, loss_vector, loss_path, 'test')

if __name__ == '__main__':
    # dataset = DataSet(num_poses=53, num_angles=360, max_records_in_tfrec_file=3600, val_fraction=0.01,
    #                   test_fraction=0.01)
    #dataset = DataSet(num_poses=1, num_angles=360, max_records_in_tfrec_file=360, val_fraction=0.1, test_fraction=0.1)

    #chkpt = _CHKPT_PATH + '2017_09_25_06_36_checkpoint-1.ckpt'

    dir_raw_record = _DATA_PATH + 'raw_data_single_model_by_4'
    #dir_raw_record = _DATA_PATH + 'raw_data_single_model'
    batch_size = 2
    num_epochs = 1
    save_prediction_interval = 1
    load_from_chkpt = _CHKPT_PATH + 'REMOTE_2018_03_31_23_58_checkpoint-1.ckpt'
    #load_from_chkpt = _CHKPT_PATH + '2018_04_05_08_53_checkpoint-1.ckpt'
    multi_deconv = True
    mob_depth_multiplier = 0.75
    conv_defs = _CONV_DEFS[1]
    data_dims_from_ckpt = None

    if load_from_chkpt:
        multi_deconv, conv_def_num, mob_depth_multiplier, data_dims_from_ckpt = utils.get_model_details_from_chkpt_path(
            load_from_chkpt)
        conv_defs = _CONV_DEFS[conv_def_num]


    eval(dir_raw_record=dir_raw_record,
         batch_size=batch_size,
         num_epochs=num_epochs,
         data_dims_from_ckpt = data_dims_from_ckpt,
         save_prediction_interval=save_prediction_interval,
         load_from_chkpt=load_from_chkpt,
         multi_deconv=multi_deconv,
         conv_defs=conv_defs,
         mob_depth_multiplier=mob_depth_multiplier)



