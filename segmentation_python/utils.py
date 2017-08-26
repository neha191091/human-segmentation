import tensorflow as tf
import os

_CHKPT_PATH = '/home/neha/Documents/TUM_Books/projects/IDP/segmentation/segmentation_python/chkpt/'

def save_checkpoint(sess, checkpoint=1, var_list=None):
    if not os.path.exists(_CHKPT_PATH):
        os.makedirs(_CHKPT_PATH)
        # save model
    fname = _CHKPT_PATH + 'checkpoint%d.ckpt' % checkpoint
    saver = tf.train.Saver(var_list)
    save_path = saver.save(sess, fname)
    print("Model saved in %s" % save_path)


def load_checkpoint(sess, checkpoint=1):
    # load model
    fname = _CHKPT_PATH + 'checkpoint%d.ckpt' % checkpoint
    try:
        saver = tf.train.Saver()
        saver.restore(sess, fname)
        print("Model restored from %s" % fname)
    except:
        print("Failed to load model from %s" % fname)