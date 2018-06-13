import os
import numpy as np
import tensorflow as tf
import dateutil.tz
import datetime
from data_utils import labels_list, DataSet
from initialize import _CONFIG, _PROJECT_PATH, _CHKPT_PATH, _RESULT_PATH, _TINY
from scipy import misc
from scipy import ndimage
import configparser

'''

This script contains several utility functions that may be re-used in different workflows.

'''

def get_img_dim_from_data_dir(data_dir):
    config_file = os.path.join(data_dir, 'config.ini')
    if not os.path.exists(config_file):
        print("Config File ", config_file, " does not exist")
        return

    _CONFIG.read(config_file)

    height = int(_CONFIG.get(section='image_dim', option='height'))
    width = int(_CONFIG.get(section='image_dim', option='width'))

    data_dim = [height, width]
    return data_dim

def get_model_details_from_chkpt_path(chkpt_path):
    chkpt_details_prefix = chkpt_path.split('checkpoint')[0]
    chkpt_details_path = chkpt_details_prefix + 'ckpt_details.txt'
    if not os.path.exists(chkpt_details_path):
        print("Checkpoint details File ", chkpt_details_path, " does not exist")
        return

    _CONFIG.read(chkpt_details_path)

    try:
        multi_deconv = int(_CONFIG.get(section='model_details', option='multi_deconv'))
    except:
        multi_deconv = 1
    try:
        conv_def_num = int(_CONFIG.get(section='model_details', option='conv_def_num'))
    except:
        conv_def_num = 0
    try:
        mob_depth_multiplier = float(_CONFIG.get(section='model_details', option='mob_depth_multiplier'))
    except:
        mob_depth_multiplier = 1.0
    data_dims = _CONFIG.get(section='model_details', option='data_dims')
    data_dims = data_dims.split(',')
    data_dims = list(map(int, data_dims))
    print(data_dims)

    try:
        follow_up_convs = int(_CONFIG.get(section='model_details', option='follow_up_convs'))
    except:
        follow_up_convs = 0

    if follow_up_convs:
        try:
            sep_convs = bool(int(_CONFIG.get(section='model_details', option='sep_convs')))
        except:
            sep_convs = False
    else:
        sep_convs = False
    model_details = [multi_deconv, conv_def_num, mob_depth_multiplier, data_dims, follow_up_convs, sep_convs]
    return model_details

def get_timestamp():
    '''
    Gets the current timestamp
    :return: Current Time in a string format
    '''
    now = datetime.datetime.now(dateutil.tz.tzlocal())
    timestamp = now.strftime('%Y_%m_%d_%H_%M')
    return timestamp

def save_checkpoint(sess, timestamp, checkpoint=0, var_list=None):
    '''
    Saves checkpoint in the chkpt folder
    :param sess: tf.session to be saved
    :param timestamp: timestamp associated with the session
    :param checkpoint: checkpoint number for the session
    :param var_list: variables to be saved in the checkpoint
    :return: N/A
    '''
    if not os.path.exists(_CHKPT_PATH):
        os.makedirs(_CHKPT_PATH)
        # save model
    fname = _CHKPT_PATH + '%s' % timestamp + '_checkpoint%d.ckpt' % checkpoint
    saver = tf.train.Saver(var_list)
    save_path = saver.save(sess, fname)
    print("Model saved in %s" % save_path)


def load_checkpoint(sess, filename):
    '''
    Loads a checkpoint to the given session
    :param sess: tf.session to which checkpoint has to be loaded to
    :param filename: checkpoint filename
    :return: N/A
    '''
    fname = filename
    try:
        saver = tf.train.Saver()
        saver.restore(sess, fname)
        print("Model restored from %s" % fname)
    except:
        print("Failed to load model from %s" % fname)

def print_chkpoint_details(batch_size,
                           num_epochs,
                           override_tfrecords,
                           lr,
                           load_from_chkpt,
                           chkpt_details_file_path,
                           multi_deconv,
                           conv_def_num,
                           mob_depth_multiplier,
                           data_dims
                          ):
    '''
    Prints details associated with training for debugging and analysis
    :param batch_size: batch size
    :param num_epochs: number of epochs
    :param override_tfrecords: record-ids for the tf_record that is used, instead of running for all tf_records in the data
    :param lr: leaning rate
    :param load_from_chkpt: the checkpoint file from which the training has commenced
    :param chkpt_details_file_path: file to which the details are stored to.
    :param multi_deconv: are there multiple layers of deconv
    :param conv_def_num: mobilenet_encoder_endpoint
    :param mob_depth_multiplier: mobilenet_depth_multiplier
    :return: N/A
    '''
    if not os.path.exists(_CHKPT_PATH):
        os.makedirs(_CHKPT_PATH)

    config = configparser.ConfigParser()

    config['training_details'] = {}
    config['training_details']['batch_size'] =  str(batch_size)
    config['training_details']['num_epochs'] =  str(num_epochs)
    config['training_details']['override_tfrecords'] =  str(override_tfrecords)
    config['training_details']['lr'] =  str(lr)
    config['training_details']['load_from_chkpt'] =  str(load_from_chkpt)

    config['model_details'] = {}
    config['model_details']['multi_deconv'] = str(int(multi_deconv))
    config['model_details']['conv_def_num'] = str(conv_def_num)
    config['model_details']['mob_depth_multiplier'] = str(mob_depth_multiplier)
    if not data_dims:
        data_dims_string = str(data_dims)
    else:
        data_dims_string = str(data_dims[0])
        for i in range(1,len(data_dims)):
            data_dims_string += ','+str(data_dims[i])
    config['model_details']['data_dims'] = data_dims_string

    with open(chkpt_details_file_path, 'w') as configfile:
        config.write(configfile)


    #chkpt_details_file = open(chkpt_details_file_path,'w')
    #print('batch_size = '+ str(batch_size), file=chkpt_details_file)
    #print('num_epochs = '+ str(num_epochs), file=chkpt_details_file)
    #if override_tfrecords:
    #    print('override_tfrecords = '+ str(override_tfrecords), file=chkpt_details_file)
    #if load_from_chkpt:
    #    print('load_from_chkpt = '+ load_from_chkpt, file=chkpt_details_file)
    #print('learning rate = '+ str(lr), file=chkpt_details_file)
    #chkpt_details_file.close()

def print_test_details(batch_size, num_epochs, override_tfrecords, load_from_chkpt, test_details_file_path):
    '''
    Prints details associated with testing for debugging and analysis
    :param batch_size: batch size
    :param num_epochs: number of epochs
    :param override_tfrecords: record-ids for the tf_record that is used, instead of running for all tf_records in the data
    :param load_from_chkpt: the checkpoint file from which the training has commenced
    :param test_details_file_path: file to which the details are stored to.
    :return:
    '''
    chkpt_details_file = open(test_details_file_path,'w')
    print('batch_size = '+ str(batch_size), file=chkpt_details_file)
    print('num_epochs = '+ str(num_epochs), file=chkpt_details_file)
    if override_tfrecords:
        print('override_tfrecords = '+ str(override_tfrecords), file=chkpt_details_file)
    if load_from_chkpt:
        print('load_from_chkpt = '+ load_from_chkpt, file=chkpt_details_file)
    chkpt_details_file.close()

def print_metrics(loss, accuracy, step, metrics_file_path):
    '''
    Prints training/evaluation metrics
    :param loss: loss
    :param accuracy: accuracy
    :param step: training step
    :param metrics_file_path: file to which the metrics are saved
    :return:
    '''
    metrics_file = open(metrics_file_path,'a+')
    print('Step %f: loss = %f acc = %f' % (step, loss, accuracy), file=metrics_file)
    metrics_file.close()

def plot_loss(points, loss_history, loss_path, data_type='train'):
    '''
    Plots the loss graph against training iteration
    :param points: loss points
    :param loss_history: loss history
    :param loss_path: Path to the graph
    :param data_type: train/test
    :return:
    '''

    import matplotlib.pyplot as plt
    plt.title(data_type+" loss")
    plt.plot(points, loss_history)
    plt.xlabel('Iteration')
    plt.ylabel('Loss')
    #plt.show()
    plt.savefig(loss_path)
    #print("loss graph saved at ", path)
    # Clear Plots
    plt.gcf().clear()

def save_loss(loss_history, loss_npy_path):
    np.save(loss_npy_path,loss_history)

def accuracy_per_pixel(preds, labels, mask_bkgrnd = True):
    '''
    Calculates the per_pixel accuracy for predicted and actual label
    :param preds: predicted label in the form (N, H, W)
    :param labels: actual label in the form (N, H, W)
    :return: fraction of correctly labelled pixels
    '''

    bool_per_pixel  = (np.array(preds) - np.array(labels)) == 0
    if mask_bkgrnd:
        return np.mean(bool_per_pixel[labels != 0])
    return np.mean(bool_per_pixel)

def accuracy_IOU(preds, labels, mask_bkgrnd = True):

    '''
    Calculates the intersection over union for predicted and actual label
    :param preds: predicted label in the form (N, H, W)
    :param labels: actual label in the form (N, H, W)
    :return: IOU values
    '''

    TP,TN,FP,FN = get_confusion_matrix(preds,labels,mask_bkgrnd)
    #print('TP shape', TP.shape)

    IOU = np.mean(TP/(TP + FP + FN + _TINY))

    return IOU

def get_confusion_matrix(preds, labels, mask_bkgrnd = True):

    '''
    Calculates True Positives, True Negatives, False Positives, False Negatives for each class
    :param preds: predicted label in the form (N, H, W)
    :param labels: actual label in the form (N, H, W)
    :return: TP, TN, FP, FN, all in the form of (C)
    '''
    np_preds = np.array(preds)
    np_labels = np.array(labels)

    TP = []
    TN = []
    FP = []
    FN = []
    for label_template in labels_list:
        np_pred_check = np_preds == np.ones_like(np_preds)*label_template['id']
        np_label_check = np_labels == np.ones_like(np_labels)*label_template['id']

        truepos = np.logical_and(np_pred_check, np_label_check)                                 #Pred and Label
        falsepos = np.logical_and(np_pred_check, np.logical_not(np_label_check))                #Pred and not(Label)
        trueneg = np.logical_and(np.logical_not(np_pred_check), np.logical_not(np_label_check)) #not(Pred) and not(Label)
        falseneg = np.logical_and(np.logical_not(np_pred_check),np_label_check)                 #not(Pred) and Label

        if mask_bkgrnd:
            if label_template['id'] == 0:
                continue
            else:
                truepos = truepos[np_labels != 0]
                trueneg = trueneg[np_labels != 0]
                falsepos = falsepos[np_labels != 0]
                falseneg = falseneg[np_labels != 0]

        truepos = np.sum(np.sum(truepos, axis=-1), axis=-1)
        trueneg = np.sum(np.sum(trueneg, axis=-1), axis=-1)
        falsepos = np.sum(np.sum(falsepos, axis=-1), axis=-1)
        falseneg = np.sum(np.sum(falseneg, axis=-1), axis=-1)

        TP.append(truepos)
        TN.append(trueneg)
        FP.append(falsepos)
        FN.append(falseneg)

    TP = np.array(TP)
    TN = np.array(TN)
    FP = np.array(FP)
    FN = np.array(FN)

    return TP, TN, FP, FN

def visualize_predictions(pred,label,depth,path,std_depth=False):
    '''
    Visualizes predictions against the ground truth and the input
    :param pred: prediction
    :param label: ground truth
    :param depth: input
    :param path: path to which the visualization is saved
    :return:
    '''

    import matplotlib.pyplot as plt
    # predictionlabel2rgb masks out the background
    rgbPred = DataSet.predictionlabel2rgb(pred, depth, std_depth=std_depth)
    #rgbPred = DataSet.label2rgb(pred)
    plt.subplot(1, 3, 1)
    plt.imshow(rgbPred)
    plt.axis('off')
    plt.subplot(1, 3, 2)
    plt.imshow(DataSet.label2rgb(label))
    plt.axis('off')
    plt.subplot(1, 3, 3)
    plt.imshow(depth)
    plt.axis('off')
    plt.savefig(path)
    # Clear Plots
    plt.gcf().clear()

def visualize_predictions_no_labels(pred,depth,path, std_depth=False):
    '''
    Visualizes predictions against the  the input
    :param pred: prediction
    :param depth: input
    :param path: path to which the visualization is saved
    :return:
    '''

    import matplotlib.pyplot as plt

    # predictionlabel2rgb masks out the background
    rgbPred = DataSet.predictionlabel2rgb(pred, depth, std_depth=std_depth)
    #rgbPred = DataSet.label2rgb(pred)
    plt.subplot(1, 2, 1)
    plt.imshow(rgbPred)
    plt.axis('off')
    plt.subplot(1, 2, 2)
    plt.imshow(depth)
    plt.axis('off')
    plt.savefig(path)
    # Clear Plots
    plt.gcf().clear()

def save_predictions(pred,depth,path,interpolation = 'nearest', std_depth= False):
    '''
    Saves the predicted segmentation map to an image file
    :param pred: prediction
    :param depth: input
    :param path: prediction image path
    :return:
    '''
    #rgbPred = DataSet.label2rgb(pred)

    # predictionlabel2rgb masks out the background
    rgbPred = DataSet.predictionlabel2rgb(pred, depth, std_depth=std_depth)
    #rgbPred = DataSet.predictionlabel2rgbsinglepart(pred, depth, part=2)

    #rgbPred = ndimage.median_filter(rgbPred,3)
    #rgbPred = ndimage.gaussian_filter(rgbPred,3)
    #rgbPred = DataSet.label2rgb(pred)
    #print(rgbPred.shape)
    rgbPred = misc.imresize(rgbPred, 400, interpolation)
    misc.imsave(path,rgbPred)
    #misc.imshow(rgbPred)


def get_n_records_from_tf_record(tf_record, n=None, height=480, width=640):
    '''
    NOTE: This is mostly a debugging tool to check if the t_records have been correctly created.
    Please change the height and width to whatever you expect from the tf_record before using this #
    function

    Gets n records from the given tf_record file
    :param tf_record: path to the tf_record file
    :param n: number of records to get
    :return: an array of n depth images, an array of n corresponding label images
    '''
    record_iterator = tf.python_io.tf_record_iterator(path = tf_record)

    count = 0
    depths_arr = []
    labels_arr = []

    init_op = tf.group(tf.global_variables_initializer(),
                           tf.local_variables_initializer())

    with tf.Session() as sess:

        sess.run(init_op)

        for string_record in record_iterator:
            features = tf.parse_single_example(
                string_record,
                # Defaults are not specified since both keys are required.
                features={
                    # 'height': tf.FixedLenFeature([], tf.int64),
                    # 'width': tf.FixedLenFeature([], tf.int64),
                    # 'channels': tf.FixedLenFeature([], tf.int64),
                    'label': tf.FixedLenFeature([], tf.string),
                    'depth': tf.FixedLenFeature([], tf.string),
                })

            # height = tf.cast(features['height'], tf.int32)
            # width = tf.cast(features['width'], tf.int32)
            # channels = tf.cast(features['channels'], tf.int32)
            # label = tf.decode_raw(features['label'], tf.uint8)
            label = tf.decode_raw(features['label'], tf.int32)
            depth1 = tf.decode_raw(features['depth'], tf.float32)

            # label_shape = tf.stack([height, width])
            # depth_shape = tf.stack([height, width, channels])
            label = tf.reshape(label, [height, width])
            depth1 = tf.reshape(depth1, [height, width, 1])

            label_val = sess.run(label)
            depth_val = sess.run(depth1)
            depths_arr.append(depth_val)
            labels_arr.append(label_val)

            count+=1

            if n:
                if count == n:
                    break

    print("count: ", count)
    return depths_arr, labels_arr

if __name__ == '__main__':
    '''
    test : - the min and max values of depth in tfrecord files
    '''
    depths_arr, labels_arr = get_n_records_from_tf_record(tf_record = _PROJECT_PATH+'data/data_complete_by_4/TfRecordFile_train_0.tfrecords', n=10, height=120, width=160)
    for i in range(len(depths_arr)):
        depth = depths_arr[i]
        #depth[depth == 34464] = 0
        print('min value of depth: ', np.min(depth), ' max value of depth: ', np.max(depth))
