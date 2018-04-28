import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt
from segmentation_python.data_utils import Dataset_TF_Provide
from segmentation_python.net_main import SegmentationNetwork
import time
import segmentation_python.utils as utils
from segmentation_python.initialize import _DATA_PATH, _CHKPT_PATH, _RESULT_PATH, _TINY
import os
from segmentation_python.conv_defs import _CONV_DEFS

# TODO: Confusion matrix, IOU
def eval(dir_tf_record,
          batch_size,
          num_epochs,
          save_prediction_interval=1,
          data_dims_from_ckpt = None,
          show_last_prediction = True,
          override_tfrecords = None,
          load_from_chkpt=None,
          multi_deconv=1,
          conv_defs=_CONV_DEFS[0],
          mob_depth_multiplier=1.0):
    '''
    Evaluate the network from tfRecords.
    :param dir_tf_record: Directory from which the data is produced
    :param batch_size: batch size
    :param num_epochs: number of epochs
    :param save_prediction_interval: n where per n predictions are saved
    :param show_last_prediction: true if you want to show the last prediction
    :param override_tfrecords: name of the tfRecord file you want to train from. If not supplied, all training data will be used
    :param load_from_chkpt: file path for the checkpoint to be loaded
    :param multi_deconv: Set true to allow multiple layers in deconv network
    :param mob_f_ep: The mobilenet layer upto which the network must be built
    :param mob_depth_multiplier: depth multiplier of mobilenet to reduce the number of parameters
    :return:
    '''
    data_dim = utils.get_img_dim_from_data_dir(dir_tf_record)

    print('Data dimension: ', data_dim)
    print('Data dims from chkpt ', data_dims_from_ckpt)

    if load_from_chkpt and (not data_dims_from_ckpt == data_dim):
        print('The data dimensions from chkpt and data do not match')
        return

    default_batch_size = batch_size
    batch_size_tensor = tf.placeholder_with_default(default_batch_size, shape=[])
    depths, labels = Dataset_TF_Provide.get_batch_from_tfrecords_via_queue(dir_tf_record=dir_tf_record,batch_size=batch_size_tensor, num_epochs=num_epochs,
                                                                type='test', override_tfrecords = override_tfrecords)

    model = SegmentationNetwork(depths,
                                data_dim,
                                is_training=False,
                                dropout_keep_prob=1.0,
                                multi_deconv=multi_deconv,
                                conv_defs=conv_defs,
                                mob_depth_multiplier=mob_depth_multiplier)

    print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    predictions = model.get_predictions()
    print('prediction shape', predictions.shape)

    cross_entropy_loss = model.loss(labels)

    coord = tf.train.Coordinator()
    init_op = tf.group(tf.global_variables_initializer(),
                       tf.local_variables_initializer())

    timestamp = utils.get_timestamp()
    evaluation_result_path = _RESULT_PATH + '_evaluation_' + '%s' % timestamp + "_batch_" + str(
        batch_size) + "_ckpt_" + str(load_from_chkpt.split('/')[-1].split('.')[0]) + "/"
    if not os.path.exists(evaluation_result_path):
        os.makedirs(evaluation_result_path)
    # test_details_file_path = evaluation_result_path + "test_details.txt"
    # utils.print_test_details(batch_size, num_epochs, override_tfrecords, load_from_chkpt,
    #                          test_details_file_path)
    metrics_file_path = evaluation_result_path + "test_metrics.txt"
    utils.print_test_details(batch_size, num_epochs, override_tfrecords, load_from_chkpt,
                             metrics_file_path)
    image_result_part_path = evaluation_result_path + "test_image_"
    loss_path = evaluation_result_path + "loss.png"

    with tf.Session() as sess:
        sess.run(init_op)
        threads = tf.train.start_queue_runners(sess=sess, coord=coord)
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

                print('pred shape: ', pred.shape)
                # print('last label shape: ', last_label.shape)

                TP, TN, FP, FN = utils.get_confusion_matrix(pred, corr_label)
                TP_sum += TP
                TN_sum += TN
                FP_sum += FP
                FN_sum += FN

                # Print an overview fairly often.
                if step % save_prediction_interval == 0:
                    # mean IOU per batch
                    acc = utils.accuracy_IOU(pred, corr_label)
                    utils.print_metrics(loss=loss_value,accuracy=acc,step=step,metrics_file_path=metrics_file_path)
                    step_vector.append(step)
                    loss_vector.append(loss_value)
                    utils.visualize_predictions(pred[0],np.squeeze(corr_label[0]),np.squeeze(corr_depth[0]),path = image_result_part_path + str(step) + '.png')


                step += 1

        except tf.errors.OutOfRangeError:
            print('Done evaluation for %d epochs, %d steps.' % (1, step))
        finally:
        # When done, ask the threads to stop.

            # Get IOU over complete data
            IOU = np.mean(TP_sum / (TP_sum + FP_sum + FN_sum + _TINY))
            metrics_file = open(metrics_file_path, 'a+')
            print('IOU OVER COMPLETE EVALUATION DATA: ' + str(IOU), file=metrics_file)
            metrics_file.close()

            #step_vector.append(step)
            #loss_vector.append(loss_value)

            coord.request_stop()

        end_time = time.time()
        print('Time taken for evaluation: ', end_time - start_time)

        # Wait for threads to finish.
        coord.join(threads)

        if show_last_prediction:
            utils.visualize_predictions(pred[0],np.squeeze(corr_label[0]),np.squeeze(corr_depth[0]),path = image_result_part_path + str(step) + '.png')

        utils.plot_loss(step_vector, loss_vector, loss_path, 'test')

if __name__ == '__main__':
    #dataset = DataSet(num_poses=53, num_angles=360, max_records_in_tfrec_file=3600, val_fraction=0.01,
    #                  test_fraction=0.01)

    #chkpt = _CHKPT_PATH + 'chkpt2cpy_2/'+ '2018_03_31_23_58_checkpoint-1.ckpt'#''2017_09_28_21_32_checkpoint-1.ckpt'


    dir_tf_record = _DATA_PATH + 'data_complete_by_4'
    batch_size = 2
    num_epochs = 1
    save_prediction_interval = 10
    override_tfrecords = ['test_0']
    load_from_chkpt = _CHKPT_PATH + 'REMOTE_2018_03_31_23_58_checkpoint-1.ckpt'
    multi_deconv = 1
    mob_f_ep = 9
    mob_depth_multiplier = 0.75
    conv_defs = _CONV_DEFS[1]
    data_dims_from_ckpt = None

    if load_from_chkpt:
        multi_deconv, conv_def_num, mob_depth_multiplier, data_dims_from_ckpt = utils.get_model_details_from_chkpt_path(load_from_chkpt)
        conv_defs = _CONV_DEFS[conv_def_num]
    else:
        print('You must provide a checkpoint to evaluate data')
        exit()

    eval(dir_tf_record=dir_tf_record,
          batch_size=batch_size,
          num_epochs=num_epochs,
          save_prediction_interval=save_prediction_interval,
          data_dims_from_ckpt = data_dims_from_ckpt,
          override_tfrecords=override_tfrecords,
          load_from_chkpt=load_from_chkpt,
          multi_deconv=multi_deconv,
          conv_defs=conv_defs,
          mob_depth_multiplier=mob_depth_multiplier)