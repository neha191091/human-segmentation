import glob
import os

from initialize import _MAIN_PATH
import matplotlib.pyplot as plt
import numpy as np
import tensorflow as tf
from scipy import misc
#TODO: Incorrect Implementation: - either fix or remove!!!!

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

# labels_list = [{"id": -1, "name": "void",           "rgb_values": [0,0,0]},
#                {"id": 1,  "name": "torso",          "rgb_values": [0,255,0]},
#                {"id": 2,  "name": "head",           "rgb_values": [0,0,255]},
#                {"id": 3,  "name": "upper_left_arm", "rgb_values": [255,0,0]},
#                {"id": 4,  "name": "upper_right_arm","rgb_values": [100,0,0]},
#                {"id": 5,  "name": "lower_left_arm", "rgb_values": [255,0,255]},
#                {"id": 6,  "name": "lower_right_arm","rgb_values": [100,0,100]},
#                {"id": 7,  "name": "upper_left_leg", "rgb_values": [255,255,0]},
#                {"id": 8,  "name": "upper_right_leg","rgb_values": [100,100,0]},
#                {"id": 9,  "name": "lower_left_leg", "rgb_values": [0,255,255]},
#                {"id": 0,  "name": "lower_right_leg","rgb_values": [0,100,100]}]


def _bytes_feature(value):
    return tf.train.Feature(bytes_list=tf.train.BytesList(value=[value]))

def _int64_feature(value):
    return tf.train.Feature(int64_list=tf.train.Int64List(value=[value]))

def _float_feature(value):
    return tf.train.Feature(int64_list=tf.train.FloatList(value=[value]))

_FIRST_LABEL_FILENAME = 'human_0_rgb_0.png'
_DIR_TFRECORDS = _MAIN_PATH+'data_single_model_by_4_v2'
_DIR_RAWDATA = _MAIN_PATH+'raw_data_single_model_by_4'

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
        return np.array(target_labels, dtype=np.uint16)
        #return np.array(target_labels, dtype=np.int32)

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

    @staticmethod
    def predictionlabel2rgb(preds, labels):

        # target shape is expected to be (H, W, 3)
        # labels shape is excpected to be (H, W)
        # We would be assuming that the label will be a numpy array
        # Return rgb mappings with dtype = ubyte

        preds = np.where(labels == 0, 0, preds)

        target_rgb = np.zeros((preds.shape[0], preds.shape[1], 3))

        for label in labels_list:
            mask = preds == label['id']
            target_rgb[mask] = label['rgb_values']
        print('target_rgb shape: ', target_rgb.shape)
        return np.asarray(target_rgb, dtype=np.ubyte)

    def __init__(self, num_poses, num_angles, dim=None, convert_2_TfRecords = True, randomize_TfRecords = False,  max_records_in_tfrec_file = 4, val_fraction = 0.1, test_fraction = 0.1):
        self.num_poses = num_poses
        self.num_angles = num_angles
        self.total_samples = self.num_poses*self.num_angles

        # For accessing raw data
        self.next_index_for_raw_data = 0

        self.index_array = np.arange(self.total_samples)
        self.data_dim = self.get_data_dim(dim=dim)
        self.max_records_in_tfrec_file = max_records_in_tfrec_file
        if not os.path.exists(_DIR_TFRECORDS):
            os.makedirs(_DIR_TFRECORDS)
        if not os.listdir(_DIR_TFRECORDS):
            if convert_2_TfRecords:
                print('Converting Raw Data to TFRecods....')
                self.convert_2_TfRecords(randomize= randomize_TfRecords,  max_records_in_tfrec_file = max_records_in_tfrec_file, val_fraction = val_fraction, test_fraction = test_fraction)

    def get_data_dim(self, dim=None):
        # The depth and the label have the same dimension
        if dim:
            return dim
        first_label_file = _DIR_RAWDATA + "/" + _FIRST_LABEL_FILENAME
        label = misc.imread(first_label_file, mode='RGB')
        return (label.shape[0], label.shape[1])

    def convert_2_TfRecords(self, randomize = True, max_records_in_tfrec_file = 4, val_fraction = 0.1, test_fraction = 0.1):

        def conversion_sub_func(mask_i, mask_j, num_pairs , type='train'):
            count = -1
            for i, j in zip(mask_i, mask_j):

                count += 1

                if (count % max_records_in_tfrec_file == 0):
                    tfRecordsFile = os.path.join(_DIR_TFRECORDS,
                                                 'TfRecordFile_' + type + '_' + str(int(count / max_records_in_tfrec_file)) + '.tfrecords')
                    print('Writing', tfRecordsFile)
                    writer = tf.python_io.TFRecordWriter(tfRecordsFile)
                # depth
                depthpartfilename = 'human_' + str(int(i)) + '_depth_' + str(int(j)) + '_*.png'
                depthpartpath = os.path.join(_DIR_RAWDATA, depthpartfilename)
                depthpath = ''
                print('glob start: ', depthpartpath)
                for file in glob.glob(depthpartpath):
                    depthpath = file
                    print(depthpath)
                    if type=='test':
                        print(depthpath)
                if (depthpath == ''):
                    print('error encountered!!! Could not find depth file')
                    return -1

                depth = misc.imread(depthpath, mode='I')
                depth = depth.astype(np.uint16)




                # label
                labelfilename = 'human_' + str(int(i)) + '_rgb_' + str(int(j)) + '.png'
                labelpath = os.path.join(_DIR_RAWDATA, labelfilename)
                print(depthpath, ' ', labelpath)

                rgb_label = misc.imread(labelpath, mode='RGB')
                label = self.rgb2label(rgb_label)

                if type == 'val' and count == 0:
                    plt.subplot(1, 2, 1)
                    plt.imshow(depth)
                    plt.axis('off')
                    plt.subplot(1, 2, 2)
                    plt.imshow(label)
                    plt.axis('off')
                    plt.show()
                depth = np.reshape(depth, (depth.shape[0], depth.shape[1], -1))
                label = np.reshape(label, (label.shape[0], label.shape[1], -1))
                print('depth shape for step: ', count, ' : ', depth.shape, ' & type: ', depth.dtype)
                print('label shape for step: ', count, ' : ', label.shape, ' & type: ', label.dtype)
                #depth = depth.tostring()
                #label = label.tostring()

                with tf.Graph().as_default():
                    depth_placeholder = tf.placeholder(dtype=tf.uint16)
                    encoded_depth = tf.image.encode_png(depth_placeholder)
                    label_placeholder = tf.placeholder(dtype=tf.uint16)
                    encoded_label = tf.image.encode_png(label_placeholder)

                    with tf.Session('') as sess:

                        depth_png_string = sess.run(encoded_depth,
                                              feed_dict={depth_placeholder: depth})
                        label_png_string = sess.run(encoded_label,
                                                    feed_dict={depth_placeholder: label})

                        example = tf.train.Example(features=tf.train.Features(feature={
                            'label': _bytes_feature(label_png_string),
                            'depth': _bytes_feature(depth_png_string)}))
                        writer.write(example.SerializeToString())

                        if (count % max_records_in_tfrec_file == max_records_in_tfrec_file - 1 or count >= num_pairs - 1):
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

        # Generate val tfrecords
        mask_i = np.floor(mask_val / self.num_angles)
        mask_j = mask_val - mask_i * self.num_angles
        print('converting val....')
        conversion_sub_func(mask_i, mask_j, num_vals, type='val')

        # Generate train tfrecords
        mask_i = np.floor(mask_train / self.num_angles)
        mask_j = mask_train - mask_i * self.num_angles
        print('converting training....')
        conversion_sub_func(mask_i, mask_j, num_train, type='train')

        # Generate test tfrecords
        mask_i = np.floor(mask_test / self.num_angles)
        mask_j = mask_test - mask_i * self.num_angles
        print('converting test....')
        conversion_sub_func(mask_i, mask_j, num_test, type='test')

    def get_batch_from_tfrecords_via_queue(self, batch_size=1,
                                           num_epochs=1,
                                           type='train',
                                           num_threads=2,
                                           capacity=360,
                                           # Ensures a minimum amount of shuffling of examples.
                                           min_after_dequeue=10,
                                           allow_smaller_final_batch=True,
                                           override_tfrecords = None):

        """Reads input data num_epochs times.
        Args:
          batch_size: Number of examples per returned batch.
          num_epochs: Number of times to read the input data, or 0/None to
             train forever.
          type: 'train'/'val'/'test'

        Returns:
          A tuple (images, labels), where:
          * depths is a float tensor with shape [batch_size, self.dim[0], self.dim[1], 1]
          * labels is an int32 tensor with shape [batch_size, self.dim[0], self.dim[1]] with the true label,
            a number in the range [0, 10].
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
            #label = tf.decode_raw(features['label'], tf.uint8)

            tf_label = tf.decode_raw(features['label'], tf.string)
            tf_depth = tf.decode_raw(features['depth'], tf.string)

            tf_label_decoded = tf.image.decode_png(tf_label, channels=1, dtype=tf.uint16)
            tf_depth_decoded = tf.image.decode_png(tf_depth, channels=1, dtype=tf.uint16)

            # label_shape = tf.stack([height, width])
            # depth_shape = tf.stack([height, width, channels])
            height = self.data_dim[0]
            width = self.data_dim[1]
            tf_label_decoded = tf.reshape(tf_label_decoded, [height,width])
            tf_depth_decoded = tf.reshape(tf_depth_decoded, [height,width,1])

            return tf_depth_decoded, tf_label_decoded

        if not num_epochs: num_epochs = None
        filename_pattern = os.path.join(_DIR_TFRECORDS,
                                'TfRecordFile_' + type + '*' + '.tfrecords')

        filenames = glob.glob(filename_pattern)

        if(override_tfrecords):
            filenames = override_tfrecords

        print('file names: ', filenames)


        with tf.name_scope('input'):
            filename_queue = tf.train.string_input_producer(
                filenames, num_epochs=num_epochs)

            # Even when reading in multiple threads, share the filename
            # queue.
            tf_depth, tf_label = read_and_decode(filename_queue)

            # reset out of bound depth values from 34464 to 10000
            # TODO: Remove this code when tfrecords are corrected
            # tf_depth[tf_depth == 34464] = 10000
            # tf_depth = tf.where(tf_depth == 34464.0,tf.zeros_like(tf_depth)+10000,tf_depth)

            # standardization
            # TODO: Move this somewhere else
            # tf_depth = tf_depth/1000

            # Shuffle the examples and collect them into batch_size batches.
            # (Internally uses a RandomShuffleQueue.)
            # We run this in two threads to avoid being a bottleneck.
            print('batch_size: ', batch_size)
            depths, labels = tf.train.shuffle_batch(
                [tf_depth, tf_label], batch_size=batch_size, num_threads=num_threads,
                capacity=capacity,
                # Ensures a minimum amount of shuffling of examples.
                min_after_dequeue=min_after_dequeue,
                allow_smaller_final_batch=allow_smaller_final_batch)

        return depths, labels

    def initialize_epoch_for_raw_data(self, permutate = True):
        self.next_index_for_raw_data = 0
        if permutate:
            self.index_array = np.random.permutation(self.total_samples)


    def get_batch_from_raw_data(self, batch_size, convert2tensor =  False):

        # We return a dictionary of randomly selected depths and labels ...
        # in the form -> {depths: (N,H,W,C), labels: (N,H,W)}
        print('get_raw_data')
        if batch_size > self.total_samples:
            print('error encountered!!! Batch size should be lesser or equal to ', self.total_samples)
            return -1
        mask_1d = self.index_array[self.next_index_for_raw_data: self.next_index_for_raw_data + batch_size]
        self.next_index_for_raw_data = (self.next_index_for_raw_data + batch_size) % self.total_samples
        mask_i = np.floor(mask_1d/self.num_angles)
        mask_j = mask_1d - mask_i*self.num_angles
        depths = []
        labels = []
        for i,j in zip(mask_i, mask_j):
            #label
            labelfilename = 'human_' + str(int(i)) + '_rgb_' +  str(int(j)) +'.png'
            #print(labelfilename)
            labelpath = os.path.join(_DIR_RAWDATA, labelfilename)

            #depth
            depthpartfilename = 'human_' + str(int(i)) + '_depth_' + str(int(j)) + '*.png'
            #print(depthpartfilename)
            depthpartpath = os.path.join(_DIR_RAWDATA, depthpartfilename)
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

    dataset = DataSet(num_poses=1, num_angles=360, max_records_in_tfrec_file=360, val_fraction=0.1, test_fraction=0.1)

    '''
    The following code simply shows the test data in the tfrecords... comment it out if you just need to generate the data
    '''

    # depths, labels = dataset.get_batch_from_tfrecords_via_queue(batch_size=1, num_epochs=1, type='test')
    # coord = tf.train.Coordinator()
    # init_op = tf.group(tf.global_variables_initializer(),
    #                    tf.local_variables_initializer())
    # with tf.Session() as sess:
    #     sess.run(init_op)
    #     threads = tf.train.start_queue_runners(sess=sess, coord=coord)
    #     step = 0
    #     try:
    #         while not coord.should_stop():
    #         #for iter in range(5):
    #             start_time = time.time()
    #
    #             # Run one step of the model.  The return values are
    #             # the activations from the `train_op` (which is
    #             # discarded) and the `loss` op.  To inspect the values
    #             # of your ops or variables, you may include them in
    #             # the list passed to sess.run() and the value tensors
    #             # will be returned in the tuple from the call.
    #             #_, loss_value = sess.run([train_op, loss])
    #             depths_val, labels_val = sess.run([tf.squeeze(depths[0]), labels])
    #             print('Depths size: ', depths_val.shape, ' labels size: ', labels_val.shape)
    #             duration = time.time() - start_time
    #
    #             # Print an overview fairly often.
    #             # if step % 100 == 0:
    #             #     print('Step %d: loss = %.2f (%.3f sec)' % (step, loss_value,
    #             #                                                duration))
    #
    #             print('Step:', step, '; depths shape: ', depths_val.shape, '; label shape: ', labels_val.shape )
    #
    #
    #             # rgb_label = DataSet.label2rgb(labels_val[0])
    #             # plt.subplot(1, 2, 1)
    #             # plt.imshow(depths_val)
    #             # plt.axis('off')
    #             # plt.subplot(1, 2, 2)
    #             # plt.imshow(rgb_label)
    #             # plt.axis('off')
    #             # plt.show()
    #
    #             step += 1
    #     except tf.errors.OutOfRangeError:
    #         print('Done training for %d epochs, %d steps.' % (1, step))
    #     finally:
    #         # When done, ask the threads to stop.
    #         coord.request_stop()
    #
    #
    #     # Wait for threads to finish.
    #     coord.join(threads)

    '''The following code uses a record iterator to check if the .tfrecord files have been generated correctly'''
    # init_op = tf.group(tf.global_variables_initializer(),
    #                    tf.local_variables_initializer())
    # with tf.Session() as sess:
    #     sess.run(init_op)
    #     record_iterator = tf.python_io.tf_record_iterator(path=_DIR_TFRECORDS+'/TfRecordFile_train_0.tfrecords')
    #
    #     count = 0
    #     depths_arr = []
    #     for string_record in record_iterator:
    #         features = tf.parse_single_example(
    #             string_record,
    #             # Defaults are not specified since both keys are required.
    #             features={
    #                 # 'height': tf.FixedLenFeature([], tf.int64),
    #                 # 'width': tf.FixedLenFeature([], tf.int64),
    #                 # 'channels': tf.FixedLenFeature([], tf.int64),
    #                 'label': tf.FixedLenFeature([], tf.string),
    #                 'depth': tf.FixedLenFeature([], tf.string),
    #             })
    #
    #         # height = tf.cast(features['height'], tf.int32)
    #         # width = tf.cast(features['width'], tf.int32)
    #         # channels = tf.cast(features['channels'], tf.int32)
    #         # label = tf.decode_raw(features['label'], tf.uint8)
    #         label = tf.decode_raw(features['label'], tf.int32)
    #         depth1 = tf.decode_raw(features['depth'], tf.float32)
    #
    #         # label_shape = tf.stack([height, width])
    #         # depth_shape = tf.stack([height, width, channels])
    #         height = 120
    #         width = 160
    #         label = tf.reshape(label, [height, width])
    #         depth1 = tf.reshape(depth1, [height, width, 1])
    #
    #         label_val = sess.run(label)
    #
    #         depth_val = sess.run(tf.squeeze(depth1))
    #         depths_arr.append(depth_val)
    #         plt.subplot(1, 2, 1)
    #         plt.imshow(depth_val)
    #         plt.axis('off')
    #         plt.subplot(1, 2, 2)
    #         plt.imshow(label_val)
    #         plt.axis('off')
    #         plt.show()
    #
    #         print('depth shape: ', depth_val.shape,'depth', depth_val)
    #         print('seg shape: ', label_val.shape,'segmentation', label_val)
    #
    #         cur = len(depths_arr) - 1
    #         prev = (cur - 1)*((cur-1)>0)
    #         print(count, ': ', label_val.shape, ' prev: ', prev, ' cur: ', cur,  ' depth difference from last', np.sum(np.abs(depths_arr[cur] - depths_arr[prev])))
    #         count+=1
    #
    #     print("count: ", count)


    ''' The following code is for when the training is ran using the raw data insteaf of the tfrecord files'''


        # dataset.initialize_epoch_for_raw_data()

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

        # print('\nlabel: ', label, '\ntarget rgb: ', target_rgb)