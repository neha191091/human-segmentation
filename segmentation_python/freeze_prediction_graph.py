import numpy as np
import tensorflow as tf
from segmentation_python.data_utils import DataSet
from segmentation_python.net_main import SegmentationNetwork
import time
import segmentation_python.utils as utils
from segmentation_python.initialize import _RESULT_PATH, _CHKPT_PATH
import os
import math
from tensorflow.python.tools import freeze_graph
from segmentation_python.data_utils import Dataset_Raw_Provide, Dataset_Input_for_Prediction_Provide
from segmentation_python.conv_defs import _CONV_DEFS

'''
Tools to freeze the network graph with trained weights so that it can be loaded without 
knowing the network architecture. Used mostly to import the graph in C++ API
'''

def save_input_graph(input_graph_dir="SaveFiles", load_from_chkpt=None):
    '''
    Saves the input graph
    :param input_graph_dir: directory to save the input graph to
    :param load_from_chkpt: checkpoint file where the needed weights are stored
    :return: complete path for the input graph
    '''
    # data_dim = dataset.data_dim
    # print('Data dimension: ', data_dim)
    # batch_size_tensor = tf.placeholder_with_default(batch_size, shape=[])
    # depths, labels = dataset.get_batch_from_tfrecords_via_queue(batch_size=batch_size_tensor, num_epochs=num_epochs,
    #                                                             type='train', override_tfrecords = override_tfrecords)


    #depths = tf.placeholder(dtype=tf.float32, shape=[None, data_dim[0], data_dim[1], 1], name='depths')
    #model = SegmentationNetwork(depths, data_dim, is_training=False, dropout_keep_prob=1.0)

    multi_deconv = 1
    mob_depth_multiplier = 0.75
    conv_def_num = 1
    data_dims_from_ckpt = None
    follow_up_convs = 0
    sep_convs = False
    depthsep_inter_norm_activn = True

    if load_from_chkpt:
        multi_deconv, conv_def_num, mob_depth_multiplier, data_dims_from_ckpt, follow_up_convs, sep_convs, depthsep_inter_norm_activn = utils.get_model_details_from_chkpt_path(
            load_from_chkpt)

    depths = tf.placeholder(dtype=tf.float32, shape=[None, data_dims_from_ckpt[0], data_dims_from_ckpt[1], 1], name='depths')
    model = SegmentationNetwork(depths,
                                data_dims_from_ckpt,
                                is_training=False,
                                dropout_keep_prob=1.0,
                                multi_deconv=multi_deconv,
                                conv_defs=_CONV_DEFS[conv_def_num],
                                mob_depth_multiplier=mob_depth_multiplier,
                                follow_up_convs=follow_up_convs,
                                sep_convs=sep_convs,
                                depthsep_inter_norm_activn=depthsep_inter_norm_activn)

    print('deconv_logits shape: ', model.net_class.deconv_logits.shape)
    predictions = model.get_predictions()
    print('prediction shape', predictions.shape)

    #cross_entropy_loss = model.loss(labels)

    init_op = tf.group(tf.global_variables_initializer(),
                       tf.local_variables_initializer())

    with tf.Session() as sess:
        sess.run(init_op)
        graph_name = "InputGraph.pb"
        tf.train.write_graph(sess.graph_def, input_graph_dir, graph_name)

        return input_graph_dir + '/' + graph_name

def freeze_pred(input_graph_path, output_graph_path, checkpoint):
    '''
    Freeze the network with weights
    :param input_graph_path: path to the input graph
    :param output_graph_path: path to store the frozen output graph
    :param checkpoint: path to checkpoint file with the needed weights
    :return:
    '''

    # Freeze the graph
    checkpoint_state_name = "checkpoint"
    input_saver_def_path = ""
    input_binary = False
    output_node_names = "SegmentationNet/predictions"
    restore_op_name = "save/restore_all"
    filename_tensor_name = "save/Const:0"
    clear_devices = False
    freeze_graph.freeze_graph(input_graph_path, input_saver_def_path,
                              input_binary, checkpoint,
                              output_node_names, restore_op_name,
                              filename_tensor_name, output_graph_path,
                              clear_devices, "")

def load_graph(frozen_graph_filename):
    '''
    Load the frozen graph into a tensorflow graph def variable
    :param frozen_graph_filename:
    :return:
    '''
    # We load the protobuf file from the disk and parse it to retrieve the
    # unserialized graph_def
    with tf.gfile.GFile(frozen_graph_filename, "rb") as f:
        graph_def = tf.GraphDef()
        graph_def.ParseFromString(f.read())

    # Then, we import the graph_def into a new Graph and returns it
    with tf.Graph().as_default() as graph:
        # The name var will prefix every op/nodes in your graph
        # Since we load everything in a new graph, this is not needed
        tf.import_graph_def(graph_def, name="prefix")
    return graph

def run_graph(dir_record, graph_path, chkpt):
    '''
    Run a graph.
    :param dir_record: Path to records
    :param graph_path: Path to the saved(frozen) graph
    :param chkpt: checkpoint from which the weights were taken(for logging purposes)
    :return:
    '''
    #dataset = Dataset_Raw_Provide(dir_raw_record, type='test', val_fraction=0.1, test_fraction=0.1)
    dataset = Dataset_Input_for_Prediction_Provide(dir_record)#, depth_str='depth', max_depth=max_depth, min_depth=min_depth, std_depth=False)
    graph = load_graph(graph_path)

    # We can verify that we can access the list of operations in the graph
    for op in graph.get_operations():
        print(op.name)
        # prefix/Placeholder/inputs_placeholder
        # ...
        # prefix/Accuracy/predictions

    # We access the input and output nodes
    depths = graph.get_tensor_by_name('prefix/depths:0')
    predictions = graph.get_tensor_by_name('prefix/SegmentationNet/predictions:0')

    timestamp = utils.get_timestamp()
    start_time = timestamp
    evaluation_result_path = _RESULT_PATH + '_evaluation_' + '%s' % timestamp + "/"
    if not os.path.exists(evaluation_result_path):
        os.makedirs(evaluation_result_path)
    test_details_file_path = evaluation_result_path + "test_details.txt"
    utils.print_test_details(batch_size, num_epochs, None, chkpt,
                             test_details_file_path)
    metrics_file_path = evaluation_result_path + "test_metrics.txt"
    image_result_part_path = evaluation_result_path + "test_image_"
    pred_result_part_path = evaluation_result_path + "human_0_rgb_"
    loss_path = evaluation_result_path + "loss.png"

    step = 0

    with tf.Session(graph=graph) as sess:
        #dataset.initialize_epoch_for_raw_data(permutate=False)
        loopsize = math.floor(len(dataset.fileNames)/batch_size)
        try:
            for iter in range(loopsize):
                # Run one step of the model.  The return values are
                # the activations from the `train_op` (which is
                # discarded) and the `loss` op.  To inspect the values
                # of your ops or variables, you may include them in
                # the list passed to sess.run() and the value tensors
                # will be returned in the tuple from the call.
                depths_data, _ = dataset.get_batch_from_pred_input_data(batch_size, convert2tensor=False)
                # depths_data = np.repeat(depths_data, 144, axis=0)
                # labels_data = np.repeat(labels_data, 144, axis=0)
                # print('shape depth: ', depths_data.shape, ' shape labels: ', labels_data.shape)
                pred, corr_depth = sess.run(
                    [predictions, depths], feed_dict={depths: depths_data})

                if iter == 0:
                    print('depth values', depths_data[0])
                    print('pred values' , pred[0])

                # pred = sess.run(model.get_predictions())
                # last_label = sess.run(labels)

                # print('pred shape: ', pred.shape)
                # print('last label shape: ', last_label.shape)



                # utils.visualize_predictions(pred[0],np.squeeze(corr_label[0]),np.squeeze(corr_depth[0]),path = image_result_part_path + str(step) + '.png')
                utils.save_predictions(pred[0], np.squeeze(corr_depth[0]),
                                       path=pred_result_part_path + str(step) + '.png')

                step += 1
                print('step: ', step)

        except tf.errors.OutOfRangeError:
            print('Done training for %d epochs, %d steps.' % (1, step))
        finally:
            end_time = time.time()
            print('Time taken for training: ', end_time - start_time)

if __name__ == '__main__':
    # dataset = DataSet(num_poses=53, num_angles=360, max_records_in_tfrec_file=3600, val_fraction=0.01,
    #                   test_fraction=0.01)
    #dataset = DataSet(num_poses=1, num_angles=360, max_records_in_tfrec_file=360, val_fraction=0.1, test_fraction=0.1)

    dir_record = '/media/neha/ubuntu/data/segmentation/render_data_corrected_TWO'

    batch_size = 1
    num_epochs = 1
    #override_tfrecords = ['/home/neha/Documents/repo/segmentation/segmentation_python/data/data_single_model_by_4/TfRecordFile_train_0.tfrecords']
    #chkpt = '/home/neha/Documents/repo/segmentation/segmentation_python/chkpt/2017_09_25_06_36_checkpoint-1.ckpt'

    #load_from_chkpt = _CHKPT_PATH + '2018_06_14_09_12_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_1_convdef_5_followup_2_sepconv_0_intermediateActvnNorm_1_mobdepth=1
    #load_from_chkpt = _CHKPT_PATH + '2018_06_20_22_22_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_2_convdef_5_followup_1_sepconv_0_intermediateActvnNorm_1_mobdepth=1
    #load_from_chkpt = _CHKPT_PATH + '2018_06_26_05_53_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_1_convdef_6_followup_2_sepconv_1_intermediateActvnNorm_1_mobdepth=1
    #load_from_chkpt = _CHKPT_PATH + '2018_06_21_01_52_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_3_convdef_6_followup_1_sepconv_1_intermediateActvnNorm_1_mobdepth=1
    #load_from_chkpt = _CHKPT_PATH + '2018_06_25_20_18_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_1_convdef_6_followup_2_sepconv_1_intermediateActvnNorm_0_mobdepth=1
    load_from_chkpt = _CHKPT_PATH + '2018_06_25_06_56_checkpoint-1.ckpt'  # batch_50_trainedon_300-CORRECTED_multideconv_3_convdef_6_followup_1_sepconv_1_intermediateActvnNorm_0_mobdepth=1

    dir = '/home/neha/Documents/repo/segmentation/segmentation_python/SaveFiles/'
    #frozen_graph_name = 'unet_transposed'
    #frozen_graph_name = 'unet_resized'
    #frozen_graph_name = 'unet_depthSep_transposed'
    #frozen_graph_name = 'unet_depthSep_resized'
    #frozen_graph_name = 'unet_depthSep_transposed_noLayers'
    frozen_graph_name = 'unet_depthSep_resized_noLayers'

    output_graph_path = dir + frozen_graph_name + '.pb'

    #TODO: Uncomment when you want to freeze the graph
    input_graph_path = save_input_graph(input_graph_dir=dir, load_from_chkpt = load_from_chkpt)
    freeze_pred(input_graph_path,output_graph_path,load_from_chkpt)

    #run_graph(dir_record,output_graph_path,chkpt)



