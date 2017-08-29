import os

import matplotlib.pyplot as plt
import numpy as np
import tensorflow as tf
from segmentation_python.data_utils import labels_list, DataSet
from segmentation_python.initialize import _CHKPT_PATH, _RESULT_PATH, _TINY
import dateutil.tz
import datetime

# _CHKPT_PATH = _MAIN_PATH + 'chkpt/'
# _RESULT_PATH = _MAIN_PATH + 'result/'
# _TINY = 1e-8

def get_timestamp():
    now = datetime.datetime.now(dateutil.tz.tzlocal())
    timestamp = now.strftime('%Y_%m_%d_%H_%M')
    print (timestamp)
    return timestamp

def save_checkpoint(sess, timestamp, checkpoint=0, var_list=None):
    if not os.path.exists(_CHKPT_PATH):
        os.makedirs(_CHKPT_PATH)
        # save model
    fname = _CHKPT_PATH + '%s' % timestamp + '_checkpoint%d.ckpt' % checkpoint
    saver = tf.train.Saver(var_list)
    save_path = saver.save(sess, fname)
    print("Model saved in %s" % save_path)


def load_checkpoint(sess, filename):
    # load model
    fname = filename
    try:
        saver = tf.train.Saver()
        saver.restore(sess, fname)
        print("Model restored from %s" % fname)
    except:
        print("Failed to load model from %s" % fname)

def print_chkpoint_details(batch_size, num_epochs, override_tfrecords, lr, load_from_chkpt, chkpt_details_file_path):
    chkpt_details_file = open(chkpt_details_file_path,'w')
    print('batch_size = '+ str(batch_size), file=chkpt_details_file)
    print('num_epochs = '+ str(num_epochs), file=chkpt_details_file)
    if override_tfrecords:
        print('override_tfrecords = '+ str(override_tfrecords), file=chkpt_details_file)
    if load_from_chkpt:
        print('load_from_chkpt = '+ load_from_chkpt, file=chkpt_details_file)
    print('learning rate = '+ str(lr), file=chkpt_details_file)
    chkpt_details_file.close()

def print_test_details(batch_size, num_epochs, override_tfrecords, load_from_chkpt, test_details_file_path):
    chkpt_details_file = open(test_details_file_path,'w')
    print('batch_size = '+ str(batch_size), file=chkpt_details_file)
    print('num_epochs = '+ str(num_epochs), file=chkpt_details_file)
    if override_tfrecords:
        print('override_tfrecords = '+ str(override_tfrecords), file=chkpt_details_file)
    if load_from_chkpt:
        print('load_from_chkpt = '+ load_from_chkpt, file=chkpt_details_file)
    chkpt_details_file.close()

def print_metrics(loss, accuracy, step, metrics_file_path):
    metrics_file = open(metrics_file_path,'a+')
    print('Step %f: loss = %f acc = %f' % (step, loss, accuracy), file=metrics_file)
    metrics_file.close()

def plot_loss(points, loss_history, timestamp, data_type='train'):
    if not os.path.exists(_RESULT_PATH):
        os.makedirs(_RESULT_PATH)
    plt.title(data_type+" loss")
    plt.plot(points, loss_history)
    plt.xlabel('Iteration')
    plt.ylabel('Loss')
    #plt.show()
    plt.savefig(_RESULT_PATH+'%s' % timestamp+"_"+data_type+"_loss.png")
    #print("loss graph saved at ", path)
    # Clear Plots
    plt.gcf().clear()

def accuracy_per_pixel(preds, labels):
    '''
    Calculates the per_pixel accuracy for predicted and actual label
    :param preds: predicted label in the form (N, H, W)
    :param labels: actual label in the form (N, H, W)
    :return: fraction of correctly labelled pixels
    '''
    bool_per_pixel  = (np.array(preds) - np.array(labels)) == 0
    return np.mean(bool_per_pixel)

def accuracy_IOU(preds, labels):
    '''
    Calculates the intersection over union for predicted and actual label
    :param preds: predicted label in the form (N, H, W)
    :param labels: actual label in the form (N, H, W)
    :return: IOU values
    '''
    np_preds = np.array(preds)
    np_labels = np.array(labels)

    IOU = 0
    for label_template in labels_list:
        np_pred_check = np_preds == np.ones_like(np_preds)*label_template['id']
        np_label_check = np_labels == np.ones_like(np_labels)*label_template['id']
        intersection = np.sum(np.bitwise_and(np_pred_check, np_label_check))
        union = np.sum(np.bitwise_or(np_pred_check, np_label_check))
        IOU += intersection / (union + _TINY)

    return IOU

def visualize_predictions(pred,label,depth,path):
    rgbPred = DataSet.label2rgb(pred)
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
