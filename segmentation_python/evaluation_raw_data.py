import numpy as np
import tensorflow as tf
from segmentation_python.data_utils import DataSet
from segmentation_python.networks import SegmentationNetwork
import time
import utils
import _RESULT_PATH
import os
import math

def eval(dataset, batch_size, num_epochs, show_last_prediction = True, chkpt_interval = 1, override_tfrecords = None, load_from_chkpt=None):
    data_dim = dataset.data_dim
    print('Data dimension: ', data_dim)
    # batch_size_tensor = tf.placeholder_with_default(batch_size, shape=[])
    # depths, labels = dataset.get_batch_from_tfrecords_via_queue(batch_size=batch_size_tensor, num_epochs=num_epochs,
    #                                                             type='train', override_tfrecords = override_tfrecords)


    num_its = math.ceil(dataset.total_samples / batch_size)

    depths = tf.placeholder(dtype=tf.float32, shape=[None, data_dim[0], data_dim[1], 1])
    labels = tf.placeholder(dtype=tf.int32, shape=[None, data_dim[0], data_dim[1]])
    model = SegmentationNetwork(depths, data_dim, is_training=False, dropout_keep_prob=1.0)
    print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    predictions = model.get_predictions()
    print('prediction shape', predictions.shape)

    cross_entropy_loss = model.loss(labels)

    init_op = tf.group(tf.global_variables_initializer(),
                       tf.local_variables_initializer())

    timestamp = utils.get_timestamp()
    evaluation_result_path = _RESULT_PATH + '_evaluation_' + '%s' % timestamp + "/"
    if not os.path.exists(evaluation_result_path):
        os.makedirs(evaluation_result_path)
    test_details_file_path = evaluation_result_path + "test_details.txt"
    utils.print_test_details(batch_size, num_epochs, override_tfrecords, load_from_chkpt,
                                 test_details_file_path)
    metrics_file_path = evaluation_result_path + "test_metrics.txt"
    image_result_part_path = evaluation_result_path + "test_image_"
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
            dataset.initialize_epoch_for_raw_data(permutate=True)
            for iter in range(10):
                # Run one step of the model.  The return values are
                # the activations from the `train_op` (which is
                # discarded) and the `loss` op.  To inspect the values
                # of your ops or variables, you may include them in
                # the list passed to sess.run() and the value tensors
                # will be returned in the tuple from the call.
                depths_data, labels_data = dataset.get_batch_from_raw_data(batch_size, convert2tensor=False)
                depths_data = np.repeat(depths_data, 144, axis=0)
                labels_data = np.repeat(labels_data, 144, axis=0)
                print('shape depth: ', depths_data.shape, ' shape labels: ', labels_data.shape)
                loss, pred, corr_depth, corr_label = sess.run(
                    [cross_entropy_loss, predictions, depths, labels], feed_dict={depths: depths_data, labels: labels_data})

                loss_value = np.mean(loss)

                # pred = sess.run(model.get_predictions())
                # last_label = sess.run(labels)

                # print('pred shape: ', pred.shape)
                # print('last label shape: ', last_label.shape)


                # Print an overview fairly often.
                if step % chkpt_interval == 0:
                    acc = utils.accuracy_per_pixel(pred, corr_label)
                    utils.print_metrics(loss=loss_value,accuracy=acc,step=step,metrics_file_path=metrics_file_path)
                    step_vector.append(step)
                    loss_vector.append(loss_value)
                    utils.visualize_predictions(pred[0],np.squeeze(corr_label[0]),np.squeeze(corr_depth[0]),path = image_result_part_path + str(step) + '.png')


                step += 1

        except tf.errors.OutOfRangeError:
            print('Done training for %d epochs, %d steps.' % (1, step))
        finally:
            end_time = time.time()
            print('Time taken for training: ', end_time - start_time)

        utils.plot_loss(step_vector, loss_vector, loss_path, 'test')

if __name__ == '__main__':
    # dataset = DataSet(num_poses=53, num_angles=360, max_records_in_tfrec_file=3600, val_fraction=0.01,
    #                   test_fraction=0.01)
    dataset = DataSet(num_poses=1, num_angles=360, max_records_in_tfrec_file=360, val_fraction=0.1, test_fraction=0.1)
    batch_size = 1
    num_epochs = 1
    override_tfrecords = ['/home/neha/Documents/TUM_Books/projects/IDP/segmentation/segmentation_python/data_single_model_by_4/TfRecordFile_train_0.tfrecords']
    chkpt = '/home/neha/Documents/TUM_Books/projects/IDP/segmentation/segmentation_python/chkpt/2017_09_22_11_09_checkpoint299.ckpt'

    eval(dataset=dataset,batch_size=batch_size,num_epochs=num_epochs, override_tfrecords=override_tfrecords, load_from_chkpt = chkpt)

