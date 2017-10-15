import os
import matplotlib.pyplot as plt
import numpy as np
import tensorflow as tf
import dateutil.tz
import datetime
from data_utils import labels_list, DataSet
from initialize import _CHKPT_PATH, _RESULT_PATH, _TINY

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

def plot_loss(points, loss_history, loss_path, data_type='train'):
    plt.title(data_type+" loss")
    plt.plot(points, loss_history)
    plt.xlabel('Iteration')
    plt.ylabel('Loss')
    #plt.show()
    plt.savefig(loss_path)
    #print("loss graph saved at ", path)
    # Clear Plots
    plt.gcf().clear()

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

    IOU = np.mean(TP/(TP + FP + FN + _TINY))

    return IOU

def get_confusion_matrix(preds, labels, mask_bkgrnd = True):

    '''
    Calculates True Positives, True Negatives, False Positives, False Negatives for each class
    :param preds: predicted label in the form (N, H, W)
    :param labels: actual label in the form (N, H, W)
    :return: TP, TN, FP, FN, all in the form of (C,N)
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

def visualize_predictions(pred,label,depth,path):

    # predictionlabel2rgb masks out the background
    rgbPred = DataSet.predictionlabel2rgb(pred, label)
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

def get_n_records_from_tf_record(tf_record, n=None):


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
            height = 480
            width = 640
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

    #test : - the min and max values of depth in tfrecord files
    depths_arr, labels_arr = get_n_records_from_tf_record(tf_record = '/home/neha/Documents/TUM_Books/projects/IDP/segmentation/segmentation_python/data/TfRecordFile_train_0.tfrecords', n=10)
    for i in range(len(depths_arr)):
        depth = depths_arr[i]
        #depth[depth == 34464] = 0
        print('min value of depth: ', np.min(depth), ' max value of depth: ', np.max(depth))
