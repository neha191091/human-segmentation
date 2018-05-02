from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import functools
import six

from tensorflow.contrib.framework.python.ops import add_arg_scope
from tensorflow.contrib.framework.python.ops import variables
from tensorflow.contrib.layers.python.layers import initializers
from tensorflow.contrib.layers.python.layers import utils
from tensorflow.contrib.layers.python.layers.utils import collect_named_outputs as util_cno
from tensorflow.python.eager import context
from tensorflow.python.framework import constant_op
from tensorflow.python.framework import dtypes
from tensorflow.python.framework import function
from tensorflow.python.framework import ops
from tensorflow.python.framework import sparse_tensor
from tensorflow.python.framework import tensor_shape
from tensorflow.python.layers import base
from tensorflow.python.layers import convolutional as convolutional_layers
from tensorflow.python.layers import core as core_layers
from tensorflow.python.layers import normalization as normalization_layers
from tensorflow.python.layers import pooling as pooling_layers
from tensorflow.python.ops import array_ops
from tensorflow.python.ops import check_ops
from tensorflow.python.ops import init_ops
from tensorflow.python.ops import linalg_ops
from tensorflow.python.ops import math_ops
from tensorflow.python.ops import nn
from tensorflow.python.ops import sparse_ops
from tensorflow.python.ops import standard_ops
from tensorflow.python.ops import variable_scope
from tensorflow.python.ops import variables as tf_variables
from tensorflow.python.training import moving_averages

from tensorflow.python.eager import context
from tensorflow.python.framework import ops
from tensorflow.python.framework import tensor_shape
from tensorflow.python.keras._impl.keras import layers as keras_layers
from tensorflow.python.layers import base
from tensorflow.python.layers import utils
from tensorflow.python.ops import array_ops
from tensorflow.python.ops import init_ops
from tensorflow.python.ops import nn
from tensorflow.python.ops import nn_ops
from tensorflow.python.util.tf_export import tf_export

from tensorflow.contrib.layers.python.layers.layers import _build_variable_getter, _add_variable_to_collections, DATA_FORMAT_NCDHW, DATA_FORMAT_NCHW, DATA_FORMAT_NDHWC, DATA_FORMAT_NHWC

@add_arg_scope
def convolution2d_transpose(
    inputs,
    num_outputs,
    kernel_size,
    stride=1,
    padding='SAME',
    data_format=DATA_FORMAT_NHWC,
    activation_fn=nn.relu,
    normalizer_fn=None,
    normalizer_params=None,
    weights_initializer=initializers.xavier_initializer(),
    weights_regularizer=None,
    biases_initializer=init_ops.zeros_initializer(),
    biases_regularizer=None,
    reuse=None,
    variables_collections=None,
    outputs_collections=None,
    trainable=True,
    scope=None):
  """Adds a convolution2d_transpose with an optional batch normalization layer.
  The function creates a variable called `weights`, representing the
  kernel, that is convolved with the input. If `normalizer_fn` is `None`, a
  second variable called 'biases' is added to the result of the operation.
  Args:
    inputs: A 4-D `Tensor` of type `float` and shape
      `[batch, height, width, in_channels]` for `NHWC` data format or
      `[batch, in_channels, height, width]` for `NCHW` data format.
    num_outputs: Integer, the number of output filters.
    kernel_size: A list of length 2 holding the [kernel_height, kernel_width] of
      of the filters. Can be an int if both values are the same.
    stride: A list of length 2: [stride_height, stride_width].
      Can be an int if both strides are the same.  Note that presently
      both strides must have the same value.
    padding: One of 'VALID' or 'SAME'.
    data_format: A string. `NHWC` (default) and `NCHW` are supported.
    activation_fn: Activation function. The default value is a ReLU function.
      Explicitly set it to None to skip it and maintain a linear activation.
    normalizer_fn: Normalization function to use instead of `biases`. If
      `normalizer_fn` is provided then `biases_initializer` and
      `biases_regularizer` are ignored and `biases` are not created nor added.
      default set to None for no normalizer function
    normalizer_params: Normalization function parameters.
    weights_initializer: An initializer for the weights.
    weights_regularizer: Optional regularizer for the weights.
    biases_initializer: An initializer for the biases. If None skip biases.
    biases_regularizer: Optional regularizer for the biases.
    reuse: Whether or not the layer and its variables should be reused. To be
      able to reuse the layer scope must be given.
    variables_collections: Optional list of collections for all the variables or
      a dictionary containing a different list of collection per variable.
    outputs_collections: Collection to add the outputs.
    trainable: Whether or not the variables should be trainable or not.
    scope: Optional scope for variable_scope.
  Returns:
    A tensor representing the output of the operation.
  Raises:
    ValueError: If 'kernel_size' is not a list of length 2.
    ValueError: If `data_format` is neither `NHWC` nor `NCHW`.
    ValueError: If `C` dimension of `inputs` is None.
  """
  layer_variable_getter = _build_variable_getter({
      'bias': 'biases',
      'kernel': 'weights'
  })

  with variable_scope.variable_scope(
      scope,
      'Conv2d_transpose', [inputs],
      reuse=reuse,
      custom_getter=layer_variable_getter) as sc:
    if data_format not in (DATA_FORMAT_NCHW, DATA_FORMAT_NHWC):
      raise ValueError('data_format has to be either NCHW or NHWC.')

    inputs = ops.convert_to_tensor(inputs)

    df = ('channels_first'
          if data_format and data_format.startswith('NC') else 'channels_last')
    layer = Conv2DTranspose(
        filters=num_outputs,
        kernel_size=kernel_size,
        strides=stride,
        padding=padding,
        data_format=df,
        activation=None,
        use_bias=not normalizer_fn and biases_initializer,
        kernel_initializer=weights_initializer,
        bias_initializer=biases_initializer,
        kernel_regularizer=weights_regularizer,
        bias_regularizer=biases_regularizer,
        activity_regularizer=None,
        trainable=trainable,
        name=sc.name,
        dtype=inputs.dtype.base_dtype)#,
        #_scope=sc,
        #_reuse=reuse)
    outputs = layer.apply(inputs)

    # Add variables to collections.
    _add_variable_to_collections(layer.kernel, variables_collections, 'weights')
    if layer.bias is not None:
      _add_variable_to_collections(layer.bias, variables_collections, 'biases')

    if normalizer_fn is not None:
      normalizer_params = normalizer_params or {}
      outputs = normalizer_fn(outputs, **normalizer_params)

    if activation_fn is not None:
      outputs = activation_fn(outputs)
    return util_cno(outputs_collections, sc.name, outputs)


#@tf_export('layers.Conv2DTranspose')
class Conv2DTranspose(keras_layers.Conv2DTranspose, base.Layer):
  """Transposed 2D convolution layer (sometimes called 2D Deconvolution).
  The need for transposed convolutions generally arises
  from the desire to use a transformation going in the opposite direction
  of a normal convolution, i.e., from something that has the shape of the
  output of some convolution to something that has the shape of its input
  while maintaining a connectivity pattern that is compatible with
  said convolution.
  Arguments:
    filters: Integer, the dimensionality of the output space (i.e. the number
      of filters in the convolution).
    kernel_size: A tuple or list of 2 positive integers specifying the spatial
      dimensions of the filters. Can be a single integer to specify the same
      value for all spatial dimensions.
    strides: A tuple or list of 2 positive integers specifying the strides
      of the convolution. Can be a single integer to specify the same value for
      all spatial dimensions.
    padding: one of `"valid"` or `"same"` (case-insensitive).
    data_format: A string, one of `channels_last` (default) or `channels_first`.
      The ordering of the dimensions in the inputs.
      `channels_last` corresponds to inputs with shape
      `(batch, height, width, channels)` while `channels_first` corresponds to
      inputs with shape `(batch, channels, height, width)`.
    activation: Activation function. Set it to None to maintain a
      linear activation.
    use_bias: Boolean, whether the layer uses a bias.
    kernel_initializer: An initializer for the convolution kernel.
    bias_initializer: An initializer for the bias vector. If None, the default
      initializer will be used.
    kernel_regularizer: Optional regularizer for the convolution kernel.
    bias_regularizer: Optional regularizer for the bias vector.
    activity_regularizer: Optional regularizer function for the output.
    kernel_constraint: Optional projection function to be applied to the
        kernel after being updated by an `Optimizer` (e.g. used to implement
        norm constraints or value constraints for layer weights). The function
        must take as input the unprojected variable and must return the
        projected variable (which must have the same shape). Constraints are
        not safe to use when doing asynchronous distributed training.
    bias_constraint: Optional projection function to be applied to the
        bias after being updated by an `Optimizer`.
    trainable: Boolean, if `True` also add variables to the graph collection
      `GraphKeys.TRAINABLE_VARIABLES` (see `tf.Variable`).
    name: A string, the name of the layer.
  """

  def __init__(self, filters,
               kernel_size,
               strides=(1, 1),
               padding='valid',
               data_format='channels_last',
               activation=None,
               use_bias=True,
               kernel_initializer=None,
               bias_initializer=init_ops.zeros_initializer(),
               kernel_regularizer=None,
               bias_regularizer=None,
               activity_regularizer=None,
               kernel_constraint=None,
               bias_constraint=None,
               trainable=True,
               name=None,
               **kwargs):
    super(Conv2DTranspose, self).__init__(
        filters=filters,
        kernel_size=kernel_size,
        strides=strides,
        padding=padding,
        data_format=data_format,
        activation=activation,
        use_bias=use_bias,
        kernel_initializer=kernel_initializer,
        bias_initializer=bias_initializer,
        kernel_regularizer=kernel_regularizer,
        bias_regularizer=bias_regularizer,
        activity_regularizer=activity_regularizer,
        kernel_constraint=kernel_constraint,
        bias_constraint=bias_constraint,
        trainable=trainable,
        name=name,
        **kwargs)

@add_arg_scope
def upsampling2D(
    inputs,
    size=(2,2),
    data_format="channels_last"):

    """Upsampling layer for 2D inputs.

        Repeats the rows and columns of the data
        by size[0] and size[1] respectively.

        Arguments:
            size: int, or tuple of 2 integers.
                The upsampling factors for rows and columns.
            data_format: A string,
                one of `channels_last` (default) or `channels_first`.
                The ordering of the dimensions in the inputs.
                `channels_last` corresponds to inputs with shape
                `(batch, height, width, channels)` while `channels_first`
                corresponds to inputs with shape
                `(batch, channels, height, width)`.
                It defaults to the `image_data_format` value found in your
                Keras config file at `~/.keras/keras.json`.
                If you never set it, then it will be "channels_last".

        Input shape:
            4D tensor with shape:
            - If `data_format` is `"channels_last"`:
                `(batch, rows, cols, channels)`
            - If `data_format` is `"channels_first"`:
                `(batch, channels, rows, cols)`

        Output shape:
            4D tensor with shape:
            - If `data_format` is `"channels_last"`:
                `(batch, upsampled_rows, upsampled_cols, channels)`
            - If `data_format` is `"channels_first"`:
                `(batch, channels, upsampled_rows, upsampled_cols)`"""

    layer = UpSampling2D(size=size, data_format=data_format)
    outputs = layer.apply(inputs)

    return outputs


class UpSampling2D(keras_layers.UpSampling2D, base.Layer):
    """Upsampling layer for 2D inputs.

      Repeats the rows and columns of the data
      by size[0] and size[1] respectively.

      Arguments:
          size: int, or tuple of 2 integers.
              The upsampling factors for rows and columns.
          data_format: A string,
              one of `channels_last` (default) or `channels_first`.
              The ordering of the dimensions in the inputs.
              `channels_last` corresponds to inputs with shape
              `(batch, height, width, channels)` while `channels_first`
              corresponds to inputs with shape
              `(batch, channels, height, width)`.
              It defaults to the `image_data_format` value found in your
              Keras config file at `~/.keras/keras.json`.
              If you never set it, then it will be "channels_last".

      Input shape:
          4D tensor with shape:
          - If `data_format` is `"channels_last"`:
              `(batch, rows, cols, channels)`
          - If `data_format` is `"channels_first"`:
              `(batch, channels, rows, cols)`

      Output shape:
          4D tensor with shape:
          - If `data_format` is `"channels_last"`:
              `(batch, upsampled_rows, upsampled_cols, channels)`
          - If `data_format` is `"channels_first"`:
              `(batch, channels, upsampled_rows, upsampled_cols)`
      """

    def __init__(self, size=(2, 2), data_format=None):
        super(UpSampling2D, self).__init__(
            size=size,
            data_format=data_format
        )

conv2d_transpose = convolution2d_transpose