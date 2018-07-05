import numpy as np
import tensorflow as tf
#import matplotlib.pyplot as plt
from data_utils import Dataset_TF_Provide
from net_main import SegmentationNetwork
import time
import utils as utils
from initialize import _DATA_PATH, _CHKPT_PATH, _RESULT_PATH, _TINY
import os
from conv_defs import _CONV_DEFS

# TODO: Confusion matrix, IOU
def val(dir_tf_record,
          batch_size,
          num_epochs,
          timestamp,
          data_dims_from_ckpt = None,
          show_last_prediction = True,
          override_tfrecords = None,
          load_from_chkpt=None,
          chkpt_iter = 0,
          multi_deconv=1,
          conv_defs=_CONV_DEFS[0],
          mob_depth_multiplier=1.0,
          follow_up_convs = 0,
          sep_convs = False,
          depthsep_inter_norm_activn = True):
    '''
    Evaluate the network from tfRecords.
    :param dir_tf_record: Directory from which the data is produced
    :param batch_size: batch size
    :param num_epochs: number of epochs
    :param show_last_prediction: true if you want to show the last prediction
    :param override_tfrecords: name of the tfRecord file you want to train from. If not supplied, all training data will be used
    :param load_from_chkpt: file path for the checkpoint to be loaded
    :param multi_deconv: Set true to allow multiple layers in deconv network
    :param mob_f_ep: The mobilenet layer upto which the network must be built
    :param mob_depth_multiplier: depth multiplier of mobilenet to reduce the number of parameters
    :return:
    '''
    data_dim = utils.get_img_dim_from_data_dir(dir_tf_record)

    #print('Data dimension: ', data_dim)
    #print('Data dims from chkpt ', data_dims_from_ckpt)

    if load_from_chkpt and (not data_dims_from_ckpt == data_dim):
        print('The data dimensions from chkpt and data do not match')
        return

    default_batch_size = batch_size
    batch_size_tensor = tf.placeholder_with_default(default_batch_size, shape=[])
    depths, labels = Dataset_TF_Provide.get_batch_from_tfrecords_via_queue(dir_tf_record=dir_tf_record,batch_size=batch_size_tensor, num_epochs=num_epochs,
                                                                type='val', override_tfrecords = override_tfrecords)


    chkpt_details_prefix = load_from_chkpt.split('checkpoint')[0]
    chkpt_path = chkpt_details_prefix + 'checkpoint' + str(chkpt_iter) + '.ckpt'

    model = SegmentationNetwork(depths,
                                data_dim,
                                is_training=False,
                                dropout_keep_prob=1.0,
                                multi_deconv=multi_deconv,
                                conv_defs=conv_defs,
                                mob_depth_multiplier=mob_depth_multiplier,
                                follow_up_convs = follow_up_convs,
                                sep_convs = sep_convs,
                                depthsep_inter_norm_activn = depthsep_inter_norm_activn)

    #print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    predictions = model.get_predictions()
    #print('prediction shape', predictions.shape)

    cross_entropy_loss = model.loss(labels)

    coord = tf.train.Coordinator()
    init_op = tf.group(tf.global_variables_initializer(),
                       tf.local_variables_initializer())

    evaluation_result_path = _RESULT_PATH + '_validation_' + '%s' % timestamp + "_batch_" + str(
        batch_size) + "_ckpt_" + str(chkpt_path.split('/')[-1].split('.')[0]) + "/"
    if not os.path.exists(evaluation_result_path):
        os.makedirs(evaluation_result_path)
    # test_details_file_path = evaluation_result_path + "test_details.txt"
    # utils.print_test_details(batch_size, num_epochs, override_tfrecords, load_from_chkpt,
    #                          test_details_file_path)
    metrics_file_path = evaluation_result_path + "val_metrics.txt"
    utils.print_test_details(batch_size, num_epochs, override_tfrecords, load_from_chkpt,
                             metrics_file_path)
    image_result_part_path = evaluation_result_path + "val_image_"
    loss_path = evaluation_result_path + "loss.png"

    with tf.Session() as sess:
        sess.run(init_op)
        threads = tf.train.start_queue_runners(sess=sess, coord=coord)
        step = 0
        step_vector = []
        loss_vector = []
        IOU_vector = []
        acc_vector = []
        TP_sum = np.zeros((10,))
        TN_sum = np.zeros((10,))
        FP_sum = np.zeros((10,))
        FN_sum = np.zeros((10,))


        if chkpt_path:
            utils.load_checkpoint(sess, chkpt_path)
        else:
            print('Error! Pass a checkpoint to load')
            return

        start_time = time.time()
        try:
            while not coord.should_stop():
            #for i in range(100):
                # Run one step of the model.  The return values are
                # the activations from the `train_op` (which is
                # discarded) and the `loss` op.  To inspect the values
                # of your ops or variables, you may include them in
                # the list passed to sess.run() and the value tensors
                # will be returned in the tuple from the call.
                #print(i)
                loss, pred, corr_depth, corr_label = sess.run(
                    [cross_entropy_loss, predictions, depths, labels], feed_dict={batch_size_tensor: batch_size})

                loss_value = np.mean(loss)

                # pred = sess.run(model.get_predictions())
                # last_label = sess.run(labels)

                #print('pred shape: ', pred.shape)
                # print('last label shape: ', last_label.shape)

                TP, TN, FP, FN = utils.get_confusion_matrix(pred, corr_label)
                TP_sum += TP
                TN_sum += TN
                FP_sum += FP
                FN_sum += FN

                IOU = utils.accuracy_IOU(pred, corr_label)
                acc = utils.accuracy_per_pixel(pred, corr_label)

                IOU_vector.append(IOU)
                acc_vector.append(acc)
                step_vector.append(step)
                loss_vector.append(loss_value)

                step += 1

        except tf.errors.OutOfRangeError:
            print('Done evaluation for %d epochs, %d steps.' % (1, step))
        finally:
        # When done, ask the threads to stop.

            # Get IOU over complete data
            IOU_overall = np.mean(TP_sum / (TP_sum + FP_sum + FN_sum + _TINY))
            metrics_file = open(metrics_file_path, 'a+')
            #print('IOU OVER COMPLETE EVALUATION DATA: ' + str(IOU_overall), file=metrics_file)
            #print('Mean accuracy_per_pixel: ' + str(np.mean(np.array(acc_vector))), file = metrics_file)
            #print('Mean IOU: ' + str(np.mean(np.array(IOU_vector))), file = metrics_file)
            metrics_file.close()

            #step_vector.append(step)
            #loss_vector.append(loss_value)

            coord.request_stop()

        end_time = time.time()
        #print('Time taken for evaluation: ', end_time - start_time)

        # Wait for threads to finish.
        coord.join(threads)

        if show_last_prediction:
            #utils.visualize_predictions(pred[0],np.squeeze(corr_label[0]),np.squeeze(corr_depth[0]),path = image_result_part_path + str(step) + '.png')
            pass

        #utils.plot_loss(step_vector, loss_vector, loss_path, 'test')
        return np.mean(np.array(loss_vector)), np.mean(np.array(IOU_vector)), np.mean(np.array(acc_vector))

if __name__ == '__main__':
    #dataset = DataSet(num_poses=53, num_angles=360, max_records_in_tfrec_file=3600, val_fraction=0.01,
    #                  test_fraction=0.01)

    #chkpt = _CHKPT_PATH + 'chkpt2cpy_2/'+ '2018_03_31_23_58_checkpoint-1.ckpt'#''2017_09_28_21_32_checkpoint-1.ckpt'

    print('Starting evaluation script....')
    #dir_tf_record = _DATA_PATH + 'data_complete_by_4'
    #dir_tf_record = '/media/neha/ubuntu/data/segmentation/render_data_corrected_TWO_tf_300'
    dir_tf_record = '/home/neha/segmentation/' + 'data/blender_data/render_data_corrected_TWO_tf_300'
    batch_size = 2
    num_epochs = 1
    override_tfrecords = None#['test_0']
    #load_from_chkpt = _CHKPT_PATH + '2017_09_25_06_36_checkpoint-1.ckpt'#'2018_03_31_23_58_checkpoint-1.ckpt'

    #chkpt = '2018_06_14_09_12_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_1_convdef_5_followup_2_sepconv_0_intermediateActvnNorm_1_mobdepth=1
    #chkpt = '2018_06_20_22_22_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_2_convdef_5_followup_1_sepconv_0_intermediateActvnNorm_1_mobdepth=1
    #chkpt = '2018_06_26_05_53_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_1_convdef_6_followup_2_sepconv_1_intermediateActvnNorm_1_mobdepth=1
    chkpt = '2018_06_21_01_52_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_3_convdef_6_followup_1_sepconv_1_intermediateActvnNorm_1_mobdepth=1
    #chkpt = '2018_06_25_20_18_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_1_convdef_6_followup_2_sepconv_1_intermediateActvnNorm_0_mobdepth=1
    #chkpt = '2018_06_25_06_56_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_3_convdef_6_followup_1_sepconv_1_intermediateActvnNorm_0_mobdepth=1
    load_from_chkpt = _CHKPT_PATH + chkpt
    multi_deconv = 1
    mob_f_ep = 9
    mob_depth_multiplier = 0.75
    conv_defs = _CONV_DEFS[1]
    data_dims_from_ckpt = None
    follow_up_convs = 0
    sep_convs = False
    depthsep_inter_norm_activn = True

    if load_from_chkpt:
        multi_deconv, conv_def_num, mob_depth_multiplier, data_dims_from_ckpt, follow_up_convs, sep_convs, depthsep_inter_norm_activn = utils.get_model_details_from_chkpt_path(load_from_chkpt)
        conv_defs = _CONV_DEFS[conv_def_num]
    else:
        print('You must provide a checkpoint to evaluate data')
        exit()

    print('start eval')

    chkpt_iter = 0

    loss_array = []
    IOU_array = []
    acc_array = []

    timestamp = utils.get_timestamp()

    while(chkpt_iter < 40001):

        tf.reset_default_graph()

        loss_val, IOU_val, acc_val = val(dir_tf_record=dir_tf_record,
                  batch_size=batch_size,
                  num_epochs=num_epochs,
                  timestamp = timestamp,
                  data_dims_from_ckpt = data_dims_from_ckpt,
                  override_tfrecords=override_tfrecords,
                  load_from_chkpt=load_from_chkpt,
                  chkpt_iter = chkpt_iter,
                  multi_deconv=multi_deconv,
                  conv_defs=conv_defs,
                  mob_depth_multiplier=mob_depth_multiplier,
                  follow_up_convs = follow_up_convs,
                  sep_convs = sep_convs,
                  depthsep_inter_norm_activn = depthsep_inter_norm_activn)

        loss_array.append(loss_val)
        IOU_array.append(IOU_val)
        acc_array.append(acc_val)

        chkpt_iter += 10000

    tf.reset_default_graph()

    loss_val, IOU_val, acc_val = val(dir_tf_record=dir_tf_record,
              batch_size=batch_size,
              num_epochs=num_epochs,
              timestamp = timestamp,
              data_dims_from_ckpt = data_dims_from_ckpt,
              override_tfrecords=override_tfrecords,
              load_from_chkpt=load_from_chkpt,
              chkpt_iter = -1,
              multi_deconv=multi_deconv,
              conv_defs=conv_defs,
              mob_depth_multiplier=mob_depth_multiplier,
              follow_up_convs = follow_up_convs,
              sep_convs = sep_convs,
              depthsep_inter_norm_activn = depthsep_inter_norm_activn)

    loss_array.append(loss_val)
    IOU_array.append(IOU_val)
    acc_array.append(acc_val)

    utils.save_loss(np.array(loss_array), _RESULT_PATH + chkpt + '_loss_val.npy')
    utils.save_loss(np.array(IOU_array), _RESULT_PATH + chkpt + '_IOU_val.npy')
    utils.save_loss(np.array(acc_array), _RESULT_PATH + chkpt + '_acc_val.npy')

    print('Loss: ', loss_array)
    print('IOU: ', IOU_array)
    print('Acc: ', acc_array)
    print('chkpt: ', chkpt)
