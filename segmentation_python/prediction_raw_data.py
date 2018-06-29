import numpy as np
import tensorflow as tf
from data_utils import Dataset_Input_for_Prediction_Provide
from net_main import SegmentationNetwork
import time
import utils as utils
from initialize import _CHKPT_PATH, _RESULT_PATH, _DATA_PATH
import os
import math
from tensorflow.python.tools import freeze_graph
from conv_defs import _CONV_DEFS
import scipy.misc as misc

def predict(dir_pred_input_record,
          batch_size,
          num_epochs,
          data_dims_from_ckpt = None,
          save_prediction_interval=1,
          show_last_prediction = True,
          load_from_chkpt=None,
          multi_deconv=1,
          conv_defs=_CONV_DEFS[0],
          mob_depth_multiplier=1.0,
          max_depth = 10000,
          min_depth = 0,
          follow_up_convs = 0,
          sep_convs = 0,
          depthsep_inter_norm_activn = True):
    '''
    Predict segmentation maps from depths
    :param dataset: DataSet object
    :param batch_size: batch size
    :param num_epochs: number of epochs
    :param save_prediction_interval: n where per n predictions are saved
    :param load_from_chkpt: file path for the checkpoint to be loaded
    :return:
    '''


    dataset = Dataset_Input_for_Prediction_Provide(dir_pred_input_record, depth_str='depth', max_depth=max_depth, min_depth=min_depth, std_depth=False)
    data_dim = dataset.data_dim
    print('Data dimension: ', data_dim)
    print('Data dims from chkpt ', data_dims_from_ckpt)

    if load_from_chkpt and (not list(data_dims_from_ckpt) == list(data_dim)):
        if data_dims_from_ckpt[0]<data_dim[0]:
            #resize_factor = (data_dims_from_ckpt[0]/data_dim[0])
            #dataset.set_resize_factor(resize_factor)
            dataset.set_resize_factor(data_dims_from_ckpt)
        else:
            print('The data dimensions from chkpt and data do not match')
            return

    depths = tf.placeholder(dtype=tf.float32, shape=[None, data_dims_from_ckpt[0], data_dims_from_ckpt[1], 1])
    #labels = tf.placeholder(dtype=tf.int32, shape=[None, data_dim[0], data_dim[1]])
    #model = SegmentationNetwork(depths, data_dims_from_ckpt, is_training=False, dropout_keep_prob=1.0)
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
    print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    predictions = model.get_predictions()
    print('prediction shape', predictions.shape)

    #cross_entropy_loss = model.loss(labels)

    init_op = tf.group(tf.global_variables_initializer(),
                       tf.local_variables_initializer())

    timestamp = utils.get_timestamp()
    evaluation_result_path = _RESULT_PATH + '_prediction_' + '%s' % timestamp + "_batch_" + str(
        batch_size) + "_ckpt_" + str(load_from_chkpt.split('/')[-1].split('.')[0]) + "/"
    if not os.path.exists(evaluation_result_path):
        os.makedirs(evaluation_result_path)
    test_details_file_path = evaluation_result_path + "test_details.txt"
    utils.print_test_details(batch_size, num_epochs, None, load_from_chkpt,
                                 test_details_file_path)
    metrics_file_path = evaluation_result_path + "test_metrics.txt"
    vis_result_part_path = evaluation_result_path + "vis_image_"
    pred_result_part_path = evaluation_result_path + "human_0_rgb_"
    loss_path = evaluation_result_path + "loss.png"
    with tf.Session() as sess:
        sess.run(init_op)
        step = 0
        step_vector = []
        loss_vector = []
        acc_vector = []

        if load_from_chkpt:
            utils.load_checkpoint(sess, load_from_chkpt)
        else:
            print('Error! Pass a checkpoint to load')
            return

        start_time = time.time()
        try:
            #while not coord.should_stop():
            loopsize = math.floor(len(dataset.fileNames)/batch_size)
            for iter in range(loopsize):
                # Run one step of the model.  The return values are
                # the activations from the `train_op` (which is
                # discarded) and the `loss` op.  To inspect the values
                # of your ops or variables, you may include them in
                # the list passed to sess.run() and the value tensors
                # will be returned in the tuple from the call.
                depths_data, depths_orig_data = dataset.get_batch_from_pred_input_data(batch_size, convert2tensor=False)
                #depths_data = np.repeat(depths_data, 144, axis=0)
                #labels_data = np.repeat(labels_data, 144, axis=0)
                # print('shape depth: ', depths_data.shape, ' shape labels: ', labels_data.shape)
                print('min: ', np.min(depths_data), 'max', np.max(depths_data))
                pred, corr_depth = sess.run(
                    [predictions, depths], feed_dict={depths: depths_data})


                # pred = sess.run(model.get_predictions())
                # last_label = sess.run(labels)

                # print('pred shape: ', pred.shape)
                # print('last label shape: ', last_label.shape)


                # Print an overview fairly often.
                if step % save_prediction_interval == 0:
                    step_vector.append(step)
                    utils.visualize_predictions_no_labels(pred[0],np.squeeze(corr_depth[0]),path = vis_result_part_path + str(step) + '.png',std_depth=False)

                    utils.save_predictions(pred[0], np.squeeze(depths_orig_data),
                                                path=pred_result_part_path + str(step) + '.png',std_depth=False, orig_depth=True) #depths_orig_data

                step += 1
                print('step: ',step)

        except tf.errors.OutOfRangeError:
            print('Done training for %d epochs, %d steps.' % (1, step))
        finally:
            end_time = time.time()
            print('Time taken for training: ', end_time - start_time)

        utils.plot_loss(step_vector, loss_vector, loss_path, 'test')

if __name__ == '__main__':

    max_depth = 10000
    min_depth = 0

    #dir_pred_input_record = '/home/neha/Documents/repo/InSeg_3/Data/bodyMay_7_18'
    #dir_pred_input_record = '/media/neha/ubuntu/data/segmentation/christian_dataset/source/yunus2'
    #max_depth = 1600 #yunus_data
    #dir_pred_input_record = '/media/neha/ubuntu/data/segmentation/neha_11_5_2_refined'
    #dir_pred_input_record = '/media/neha/ubuntu/data/segmentation/sumit_11_5_2_refined'
    dir_pred_input_record = '/media/neha/ubuntu/data/segmentation/neha_11_5_2_sequence'
    #dir_pred_input_record = _DATA_PATH + 'raw_data_render_example_by_4'

    batch_size = 1
    num_epochs = 1
    save_prediction_interval = 1
    # load_from_chkpt = _CHKPT_PATH + 'REMOTE_2018_03_31_23_58_checkpoint-1.ckpt'
    # load_from_chkpt = _CHKPT_PATH + '2018_04_05_08_53_checkpoint-1.ckpt'
    # load_from_chkpt = _CHKPT_PATH + '2018_05_03_09_24_checkpoint-1.ckpt' #batch_of_100_multi-deconv=1
    # load_from_chkpt = _CHKPT_PATH + '2018_05_03_11_52_checkpoint-1.ckpt' #batch_of_50_multi-deconv=1
    # load_from_chkpt = _CHKPT_PATH + '2018_05_03_16_26_checkpoint-1.ckpt' #batch_of_10_multi-deconv=1
    # load_from_chkpt = _CHKPT_PATH + '2018_05_03_22_56_checkpoint-1.ckpt' #batch_of_50_multi-deconv=2

    #load_from_chkpt = _CHKPT_PATH + 'REMOTE_b_50_md_1_total_300_2018_05_03_11_52_checkpoint-1.ckpt'  # batch_of_50_multi-deconv=1
    #load_from_chkpt = _CHKPT_PATH + '2018_05_16_07_55_checkpoint-1.ckpt'  # batch_of_50_multi-deconv=1, corrected, 300, REMOTE
    #load_from_chkpt = _CHKPT_PATH + '2018_05_17_08_46_checkpoint-1.ckpt'  # batch_of_50_multi-deconv=1, corrected, 300, standardized, REMOTE

    #load_from_chkpt = _CHKPT_PATH + '2018_06_14_09_12_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_1_convdef_5_followup_2_sepconv_0_intermediateActvnNorm_1_mobdepth=1
    #load_from_chkpt = _CHKPT_PATH + '2018_06_20_22_22_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_2_convdef_5_followup_1_sepconv_0_intermediateActvnNorm_1_mobdepth=1
    #load_from_chkpt = _CHKPT_PATH + '2018_06_26_05_53_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_1_convdef_6_followup_2_sepconv_1_intermediateActvnNorm_1_mobdepth=1
    #load_from_chkpt = _CHKPT_PATH + '2018_06_21_01_52_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_3_convdef_6_followup_1_sepconv_1_intermediateActvnNorm_1_mobdepth=1
    #load_from_chkpt = _CHKPT_PATH + '2018_06_25_20_18_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_1_convdef_6_followup_2_sepconv_1_intermediateActvnNorm_0_mobdepth=1
    load_from_chkpt = _CHKPT_PATH + '2018_06_25_06_56_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_3_convdef_6_followup_1_sepconv_1_intermediateActvnNorm_0_mobdepth=1

    multi_deconv = 1
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
        print('You must provide a checkpoint to get predictions')
        exit()

    predict(dir_pred_input_record=dir_pred_input_record,
         batch_size=batch_size,
         num_epochs=num_epochs,
         data_dims_from_ckpt=data_dims_from_ckpt,
         save_prediction_interval=save_prediction_interval,
         load_from_chkpt=load_from_chkpt,
         multi_deconv=multi_deconv,
         conv_defs=conv_defs,
         mob_depth_multiplier=mob_depth_multiplier,
         max_depth=max_depth,
         min_depth=min_depth,
         follow_up_convs = follow_up_convs,
         sep_convs = sep_convs,
         depthsep_inter_norm_activn = depthsep_inter_norm_activn)
