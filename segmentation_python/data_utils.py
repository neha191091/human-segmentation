import numpy as np
from scipy import misc
import tensorflow as tf
import matplotlib.pyplot as plt
import glob
import os
import time

# labels_list = [{"id": -1, "name": "void",           "rgb_values": [0,0,0]},
#                {"id": 0,  "name": "torso",          "rgb_values": [0,255,0]},
#                {"id": 1,  "name": "head",           "rgb_values": [0,0,255]},
#                {"id": 2,  "name": "upper_left_arm", "rgb_values": [255,0,0]},
#                {"id": 3,  "name": "upper_right_arm","rgb_values": [100,0,0]},
#                {"id": 4,  "name": "lower_left_arm", "rgb_values": [255,0,255]},
#                {"id": 5,  "name": "lower_right_arm","rgb_values": [100,0,100]},
#                {"id": 6,  "name": "upper_left_leg", "rgb_values": [255,255,0]},
#                {"id": 7,  "name": "upper_right_leg","rgb_values": [100,100,0]},
#                {"id": 8,  "name": "lower_left_leg", "rgb_values": [0,255,255]},
#                {"id": 9,  "name": "lower_right_leg","rgb_values": [0,100,100]}]
labels_list = [{"id": 0, "name": "void",           "rgb_values": [0,0,0]},
               {"id": 1,  "name": "torso",          "rgb_values": [0,255,0]},
               {"id": 2,  "name": "head",           "rgb_values": [0,0,255]},
               {"id": 3,  "name": "upper_left_arm", "rgb_values": [255,0,0]},
               {"id": 4,  "name": "upper_right_arm","rgb_values": [100,0,0]},
               {"id": 5,  "name": "lower_left_arm", "rgb_values": [255,0,255]},
               {"id": 6,  "name": "lower_right_arm","rgb_values": [100,0,100]},
               {"id": 7,  "name": "upper_left_leg", "rgb_values": [255,255,0]},
               {"id": 8,  "name": "upper_right_leg","rgb_values": [100,100,0]},
               {"id": 9,  "name": "lower_left_leg", "rgb_values": [0,255,255]},
               {"id": 10,  "name": "lower_right_leg","rgb_values": [0,100,100]}]

def _bytes_feature(value):
    return tf.train.Feature(bytes_list=tf.train.BytesList(value=[value]))

def _int64_feature(value):
    return tf.train.Feature(int64_list=tf.train.Int64List(value=[value]))

def _float_feature(value):
    return tf.train.Feature(int64_list=tf.train.FloatList(value=[value]))

_FIRST_LABEL_FILENAME = 'human_0_rgb_0.png'

class DataSet:

    @staticmethod
    def rgb2label(target):

        # target shape is expected to be (H, W, 3)
        # label shape is excpected to be (H, W)

        target = np.array(target, dtype=np.uint8)
        # print('original target shape', target.shape)

        target_labels = target[..., 0]
        target_labels = np.zeros(target_labels.shape)
        # target_labels -= 1
        # print('original target labels shape', target_labels.shape)

        for label in labels_list:
            mask = np.all(target == label['rgb_values'], axis=2)
            # print('mask shape for label', label, ':  ', mask.shape)
            # print('number of pixels with label ', label, '= ', np.count_nonzero(mask))
            target_labels[mask] = label['id']
        return np.array(target_labels, dtype=np.uint8)

    @staticmethod
    def label2rgb(labels):

        # target shape is expected to be (H, W, 3)
        # labels shape is excpected to be (H, W)
        # We would be assuming that the label will be a numpy array
        # Return rgb mappings with dtype = ubyte

        target_rgb = np.zeros((labels.shape[0], labels.shape[1], 3))

        for label in labels_list:
            mask = labels == label['id']
            target_rgb[mask] = label['rgb_values']
        print('target_rgb shape: ', target_rgb.shape)
        return np.asarray(target_rgb, dtype=np.ubyte)

    def __init__(self, num_poses, num_angles, dir_raw_data = 'raw_data', dir_tfrecords = 'data', convert_2_TfRecords = True, randomize_TfRecords = False,  max_pairs = 4, val_fraction = 0.1, test_fraction = 0.1):
        self.num_poses = num_poses
        self.num_angles = num_angles
        self.total_samples = self.num_poses*self.num_angles
        self.next_index = 0
        self.index_array = np.arange(self.total_samples)
        self.dir_raw_data = dir_raw_data
        self.dir_tfrecords = dir_tfrecords
        self.data_dim = self.get_data_dim()
        if not os.listdir(dir_tfrecords):
            if convert_2_TfRecords:
                print('Converting Raw Data to TFRecods....')
                self.convert_2_TfRecords(randomize= randomize_TfRecords,  max_pairs = max_pairs, val_fraction = val_fraction, test_fraction = test_fraction)

    def get_data_dim(self):
        # The depth and the label have the same dimension
        first_label_file = os.path.join(self.dir_raw_data, _FIRST_LABEL_FILENAME)
        label = misc.imread(first_label_file, mode='RGB')
        return (label.shape[0], label.shape[1])

    def convert_2_TfRecords(self, randomize = True, max_pairs = 4, val_fraction = 0.1, test_fraction = 0.1):

        def conversion_sub_func(mask_i, mask_j, num_pairs , type='train'):
            count = -1
            for i, j in zip(mask_i, mask_j):

                count += 1

                if (count % max_pairs == 0):
                    tfRecordsFile = os.path.join(self.dir_tfrecords,
                                                 'TfRecordFile_' + type + '_' + str(int(count / max_pairs)) + '.tfrecords')
                    print('Writing', tfRecordsFile)
                    writer = tf.python_io.TFRecordWriter(tfRecordsFile)
                # depth
                depthpartfilename = 'human_' + str(int(i)) + '_depth_' + str(int(j)) + '*.png'
                depthpartpath = os.path.join(self.dir_raw_data, depthpartfilename)
                depthpath = ''
                for file in glob.glob(depthpartpath):
                    depthpath = file

                    if type=='test':
                        print(depthpath)
                if (depthpath == ''):
                    # print('error encountered!!! Could not find depth file')
                    return -1

                depth = misc.imread(depthpath, mode='F')
                # depth = np.reshape(depth, (depth.shape[0], depth.shape[1], -1))

                depth = depth.tostring()

                # label
                labelfilename = 'human_' + str(int(i)) + '_rgb_' + str(int(j)) + '.png'
                labelpath = os.path.join(self.dir_raw_data, labelfilename)

                rgb_label = misc.imread(labelpath, mode='RGB')
                label = self.rgb2label(rgb_label)
                print('label shape for step: ', count, ' : ', label.shape, ' & type: ', label.dtype)
                label = label.tostring()

                example = tf.train.Example(features=tf.train.Features(feature={
                    'label': _bytes_feature(label),
                    'depth': _bytes_feature(depth)}))
                writer.write(example.SerializeToString())

                if (count % max_pairs == max_pairs - 1 or count >= num_pairs - 1):
                    writer.close()

        num_samples = self.total_samples
        if randomize:
            index_array = np.random.permutation(num_samples)
        else:
            index_array = np.arange(num_samples)
        num_vals = int(np.floor(num_samples*val_fraction))
        if(num_vals == 0):
            num_vals = 1
        num_test = int(np.floor(num_samples*test_fraction))
        if(num_test == 0):
            num_test = 1
        num_train = int(num_samples-num_test-num_vals)
        print('num train: ',num_train, ' , num val: ', num_vals, ' , num test: ', num_test)
        mask_train = index_array[0: num_train]
        mask_val = index_array[num_train: num_train+num_vals]
        mask_test = index_array[num_train+num_vals:num_train+num_vals+num_test]

        # Generate train tfrecords
        mask_i = np.floor(mask_train / self.num_angles)
        mask_j = mask_train - mask_i * self.num_angles
        print('converting training....')
        conversion_sub_func(mask_i, mask_j, num_train, type='train')

        # Generate val tfrecords
        mask_i = np.floor(mask_val / self.num_angles)
        mask_j = mask_val - mask_i * self.num_angles
        print('converting val....')
        conversion_sub_func(mask_i, mask_j, num_vals, type='val')

        # Generate test tfrecords
        mask_i = np.floor(mask_test / self.num_angles)
        mask_j = mask_test - mask_i * self.num_angles
        print('converting test....')
        conversion_sub_func(mask_i, mask_j, num_test, type='test')

    def inputs(self, batch_size, num_epochs, type='train'):

        """Reads input data num_epochs times.
        Args:
          train: Selects between the training (True) and validation (False) data.
          batch_size: Number of examples per returned batch.
          num_epochs: Number of times to read the input data, or 0/None to
             train forever.
        Returns:
          A tuple (images, labels), where:
          * images is a float tensor with shape [batch_size, mnist.IMAGE_PIXELS]
            in the range [-0.5, 0.5].
          * labels is an int32 tensor with shape [batch_size] with the true label,
            a number in the range [0, mnist.NUM_CLASSES).
          Note that an tf.train.QueueRunner is added to the graph, which
          must be run using e.g. tf.train.start_queue_runners().
        """

        def read_and_decode(filename_queue):
            reader = tf.TFRecordReader()
            _, serialized_example = reader.read(filename_queue)
            features = tf.parse_single_example(
                serialized_example,
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
            label = tf.decode_raw(features['label'], tf.uint8)
            depth = tf.decode_raw(features['depth'], tf.float32)

            # label_shape = tf.stack([height, width])
            # depth_shape = tf.stack([height, width, channels])
            height = self.data_dim[0]
            width = self.data_dim[1]
            label = tf.reshape(label, [height,width])
            depth = tf.reshape(depth, [height,width,1])

            return depth, label

        if not num_epochs: num_epochs = None
        filename_pattern = os.path.join(self.dir_tfrecords,
                                'TfRecordFile_' + type + '*' + '.tfrecords')

        filenames = glob.glob(filename_pattern)
        print('file names: ', filenames)
        with tf.name_scope('input'):
            filename_queue = tf.train.string_input_producer(
                tf.constant(filenames), num_epochs=num_epochs)

            # Even when reading in multiple threads, share the filename
            # queue.
            depth, label = read_and_decode(filename_queue)

            # Shuffle the examples and collect them into batch_size batches.
            # (Internally uses a RandomShuffleQueue.)
            # We run this in two threads to avoid being a bottleneck.
            depths, labels = tf.train.shuffle_batch(
                [depth, label], batch_size=batch_size, num_threads=1,
                capacity=1000 + 3 * batch_size,
                # Ensures a minimum amount of shuffling of examples.
                min_after_dequeue=1000)

            return depths, labels

    def initialize_epoch(self,permutate = True):
        self.next_index = 0
        if permutate:
            self.index_array = np.random.permutation(self.total_samples)

    def get_permuted_batch_from_raw_data(self, batch_size, convert2tensor =  False):

        # We return a dictionary of randomly selected depths and labels ...
        # in the form -> {depths: (N,H,W,C), labels: (N,H,W)}

        if batch_size > self.total_samples:
            print('error encountered!!! Batch size should be lesser or equal to ', self.total_samples)
            return -1
        mask_1d = self.index_array[self.next_index: self.next_index + batch_size]
        mask_i = np.floor(mask_1d/self.num_angles)
        mask_j = mask_1d - mask_i*self.num_angles
        depths = []
        labels = []
        for i,j in zip(mask_i, mask_j):
            #label
            labelfilename = 'human_' + str(int(i)) + '_rgb_' +  str(int(j)) +'.png'
            #print(labelfilename)
            labelpath = os.path.join(self.dir_raw_data, labelfilename)

            #depth
            depthpartfilename = 'human_' + str(int(i)) + '_depth_' + str(int(j)) + '*.png'
            #print(depthpartfilename)
            depthpartpath = os.path.join(self.dir_raw_data, depthpartfilename)
            depthpath = ''
            for file in glob.glob(depthpartpath):
                depthpath = file
                # print(depthpath)
            if(depthpath==''):
                # print('error encountered!!! Could not find depth file')
                return -1


            depth = misc.imread(depthpath, mode='F')
            #depth = np.array([depth])
            #print('depth size bef: ', depth.shape)
            depth = np.reshape(depth, (depth.shape[0], depth.shape[1],-1))
            #print('depth size af: ', depth.shape)

            rgb_label = misc.imread(labelpath, mode='RGB')

            # print('Count for each label')
            # unique, counts = np.unique(label, return_counts=True)
            # print('unique', unique, 'counts', counts)

            label = self.rgb2label(rgb_label)

            # test
            # print(depthpath,' size: ', depth.shape, ' , max: ', np.max(depth))
            # print(labelpath,' size: ', rgb_label.shape, ' , max: ', np.max(rgb_label))
            # print('Actual label size: ', label.shape, ' , max: ', np.max(label))

            depths.append(depth)
            labels.append(label)
        if convert2tensor == True:
            return tf.stack(np.array(depths)), tf.stack(np.array(labels))
        return np.array(depths),np.array(labels)


if __name__ == '__main__':

    # test data utils

    dataset = DataSet(num_poses=2, num_angles=8, max_pairs=4)
    #dataset.initialize_epoch()

    # dataset.get_permuted_batch_from_raw_data(3)
    # #general_image_test()
    # test_label_path = "RawData/human_1_rgb_3.png"
    # label = misc.imread(test_label_path, mode='RGB')
    # target_label = dataset.rgb2label(label)
    # print('rgb_label shape ', label.shape)
    # print('label is :', target_label)
    # target_rgb = dataset.label2rgb(target_label)
    #
    # plt.subplot(1, 2, 1)
    # plt.imshow(target_rgb)
    # plt.axis('off')
    # plt.subplot(1, 2, 2)
    # plt.imshow(label)
    # plt.axis('off')
    # plt.show()

    #print('\nlabel: ', label, '\ntarget rgb: ', target_rgb)

    depths, labels = dataset.inputs(batch_size=1, num_epochs=1, type='test')
    coord = tf.train.Coordinator()
    init_op = tf.group(tf.global_variables_initializer(),
                       tf.local_variables_initializer())
    with tf.Session() as sess:
        sess.run(init_op)
        threads = tf.train.start_queue_runners(sess=sess, coord=coord)
        step = 0
        try:
            while not coord.should_stop():
                start_time = time.time()

                # Run one step of the model.  The return values are
                # the activations from the `train_op` (which is
                # discarded) and the `loss` op.  To inspect the values
                # of your ops or variables, you may include them in
                # the list passed to sess.run() and the value tensors
                # will be returned in the tuple from the call.
                #_, loss_value = sess.run([train_op, loss])
                depths_val, labels_val = sess.run([tf.squeeze(depths), labels])
                duration = time.time() - start_time

                # Print an overview fairly often.
                # if step % 100 == 0:
                #     print('Step %d: loss = %.2f (%.3f sec)' % (step, loss_value,
                #                                                duration))
                print('Step:', step, '; depths shape: ', depths_val.shape, '; label shape: ', labels_val.shape )

                print(depths_val)

                rgb_label = DataSet.label2rgb(labels_val[0])


                print(labels_val[0])


                plt.subplot(1, 2, 1)
                plt.imshow(depths_val)
                plt.axis('off')
                plt.subplot(1, 2, 2)
                plt.imshow(rgb_label)
                plt.axis('off')
                plt.show()

                step += 1
        except tf.errors.OutOfRangeError:
            print('Done training for %d epochs, %d steps.' % (1, step))
        finally:
            # When done, ask the threads to stop.
            coord.request_stop()

        # Wait for threads to finish.
        coord.join(threads)