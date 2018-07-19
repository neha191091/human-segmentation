node {
  name: "depths"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 120
        }
        dim {
          size: 160
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14213381707668304
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14213381707668304
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_0/weights"
  input: "SegmentationNet/Conv2d_0/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_0/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_0/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_0/Conv2D"
  op: "Conv2D"
  input: "depths"
  input: "SegmentationNet/Conv2d_0/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_0/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_0/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_0/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_0/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_0/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_0/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_0/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_0/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_0/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_0/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_0/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_0/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_0/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_0/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14213381707668304
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14213381707668304
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/SegmentationNet/Conv2d_0/Relu"
  input: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_1_depthwise/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_1_depthwise/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_depthwise/biases"
  input: "SegmentationNet/Conv2d_1_depthwise/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/biases/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_1_depthwise/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/depthwise"
  input: "SegmentationNet/Conv2d_1_depthwise/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.25
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.25
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_pointwise/weights"
  input: "SegmentationNet/Conv2d_1_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_1_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_1_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_1_pointwise/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/BiasAdd"
  input: "SegmentationNet/Conv2d_1_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_1_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_1_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_1_pointwise/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_1_pointwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_1_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_1_pointwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_1_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/SegmentationNet/Conv2d_1_pointwise/Relu"
  input: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_2_depthwise/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_2_depthwise/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_depthwise/biases"
  input: "SegmentationNet/Conv2d_2_depthwise/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/biases/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_2_depthwise/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/depthwise"
  input: "SegmentationNet/Conv2d_2_depthwise/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_pointwise/weights"
  input: "SegmentationNet/Conv2d_2_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_2_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_2_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_2_pointwise/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/BiasAdd"
  input: "SegmentationNet/Conv2d_2_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_2_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_2_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_2_pointwise/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_2_pointwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_2_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_2_pointwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_2_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/SegmentationNet/Conv2d_2_pointwise/Relu"
  input: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_3_depthwise/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_3_depthwise/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_depthwise/biases"
  input: "SegmentationNet/Conv2d_3_depthwise/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/biases/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_3_depthwise/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/depthwise"
  input: "SegmentationNet/Conv2d_3_depthwise/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1767766922712326
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1767766922712326
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_pointwise/weights"
  input: "SegmentationNet/Conv2d_3_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_3_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_3_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_3_pointwise/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/BiasAdd"
  input: "SegmentationNet/Conv2d_3_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_3_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_3_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_3_pointwise/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_3_pointwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_3_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_3_pointwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_3_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0718885138630867
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0718885138630867
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/SegmentationNet/Conv2d_3_pointwise/Relu"
  input: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_4_depthwise/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_4_depthwise/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_depthwise/biases"
  input: "SegmentationNet/Conv2d_4_depthwise/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/biases/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_4_depthwise/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/depthwise"
  input: "SegmentationNet/Conv2d_4_depthwise/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1530931144952774
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1530931144952774
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 128
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_pointwise/weights"
  input: "SegmentationNet/Conv2d_4_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_4_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_4_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_4_pointwise/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/BiasAdd"
  input: "SegmentationNet/Conv2d_4_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_4_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_4_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_4_pointwise/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_4_pointwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_4_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_4_pointwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_4_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0718885138630867
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0718885138630867
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/SegmentationNet/Conv2d_4_pointwise/Relu"
  input: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_5_depthwise/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_5_depthwise/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_depthwise/biases"
  input: "SegmentationNet/Conv2d_5_depthwise/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/biases/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_5_depthwise/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/depthwise"
  input: "SegmentationNet/Conv2d_5_depthwise/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1530931144952774
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1530931144952774
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 128
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_pointwise/weights"
  input: "SegmentationNet/Conv2d_5_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_5_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_5_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_5_pointwise/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/BiasAdd"
  input: "SegmentationNet/Conv2d_5_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_5_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_5_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_5_pointwise/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_5_pointwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_5_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_5_pointwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_5_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0718885138630867
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0718885138630867
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/SegmentationNet/Conv2d_5_pointwise/Relu"
  input: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_6_depthwise/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_6_depthwise/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_depthwise/biases"
  input: "SegmentationNet/Conv2d_6_depthwise/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/biases/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_6_depthwise/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/depthwise"
  input: "SegmentationNet/Conv2d_6_depthwise/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\200\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.125
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.125
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 128
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_pointwise/weights"
  input: "SegmentationNet/Conv2d_6_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_6_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_6_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_6_pointwise/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/BiasAdd"
  input: "SegmentationNet/Conv2d_6_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_6_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_6_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_6_pointwise/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_6_pointwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_6_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_6_pointwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_6_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0509316585958004
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0509316585958004
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/SegmentationNet/Conv2d_6_pointwise/Relu"
  input: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_7_depthwise/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_7_depthwise/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_depthwise/biases"
  input: "SegmentationNet/Conv2d_7_depthwise/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/biases/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_7_depthwise/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/depthwise"
  input: "SegmentationNet/Conv2d_7_depthwise/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10825317353010178
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10825317353010178
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_pointwise/weights"
  input: "SegmentationNet/Conv2d_7_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_7_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_7_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_7_pointwise/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/BiasAdd"
  input: "SegmentationNet/Conv2d_7_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_7_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_7_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_7_pointwise/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_7_pointwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_7_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_7_pointwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_7_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0509316585958004
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0509316585958004
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/SegmentationNet/Conv2d_7_pointwise/Relu"
  input: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_8_depthwise/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_8_depthwise/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_depthwise/biases"
  input: "SegmentationNet/Conv2d_8_depthwise/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/biases/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_8_depthwise/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/depthwise"
  input: "SegmentationNet/Conv2d_8_depthwise/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10825317353010178
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10825317353010178
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_pointwise/weights"
  input: "SegmentationNet/Conv2d_8_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_8_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_8_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_8_pointwise/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/BiasAdd"
  input: "SegmentationNet/Conv2d_8_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_8_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_8_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_8_pointwise/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_8_pointwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_8_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_8_pointwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_8_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0509316585958004
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0509316585958004
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/SegmentationNet/Conv2d_8_pointwise/Relu"
  input: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_9_depthwise/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_9_depthwise/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_depthwise/biases"
  input: "SegmentationNet/Conv2d_9_depthwise/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/biases/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_9_depthwise/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/depthwise"
  input: "SegmentationNet/Conv2d_9_depthwise/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0883883461356163
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0883883461356163
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 256
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_pointwise/weights"
  input: "SegmentationNet/Conv2d_9_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_9_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_9_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_9_pointwise/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/BiasAdd"
  input: "SegmentationNet/Conv2d_9_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_9_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_9_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_9_pointwise/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_9_pointwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_9_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_9_pointwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_9_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03604920580983162
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03604920580983162
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/SegmentationNet/Conv2d_9_pointwise/Relu"
  input: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_10_depthwise/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_10_depthwise/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_depthwise/biases"
  input: "SegmentationNet/Conv2d_10_depthwise/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/biases/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_10_depthwise/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/depthwise"
  input: "SegmentationNet/Conv2d_10_depthwise/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\002\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0765465572476387
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0765465572476387
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 512
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_pointwise/weights"
  input: "SegmentationNet/Conv2d_10_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_10_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_10_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_10_pointwise/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/BiasAdd"
  input: "SegmentationNet/Conv2d_10_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_10_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_10_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_10_pointwise/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_10_pointwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_10_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_10_pointwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_10_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03604920580983162
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03604920580983162
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/SegmentationNet/Conv2d_10_pointwise/Relu"
  input: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_11_depthwise/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_11_depthwise/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_depthwise/biases"
  input: "SegmentationNet/Conv2d_11_depthwise/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/biases/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_11_depthwise/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/depthwise"
  input: "SegmentationNet/Conv2d_11_depthwise/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\002\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0765465572476387
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0765465572476387
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 512
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_pointwise/weights"
  input: "SegmentationNet/Conv2d_11_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_11_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_11_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_11_pointwise/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/BiasAdd"
  input: "SegmentationNet/Conv2d_11_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_11_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_11_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_11_pointwise/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_11_pointwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_11_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_11_pointwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_11_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Dropout_encoder/Identity"
  op: "Identity"
  input: "SegmentationNet/SegmentationNet/Conv2d_11_pointwise/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.025515519082546234
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.025515519082546234
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv/weights"
  input: "SegmentationNet/ImageLogits/Conv/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv/biases"
  input: "SegmentationNet/ImageLogits/Conv/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/biases/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/ImageLogits/Dropout_encoder/Identity"
  input: "SegmentationNet/ImageLogits/Conv/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/ImageLogits/Conv/Conv2D"
  input: "SegmentationNet/ImageLogits/Conv/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\010\000\000\000\013\000\000\000\000\001\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.00942222960293293
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.00942222960293293
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
        dim {
          size: 11
        }
        dim {
          size: 256
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/weights"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/Shape"
  op: "Shape"
  input: "SegmentationNet/ImageLogits/Conv/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice"
  op: "StridedSlice"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/Shape"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice/stack"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice/stack_1"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_1"
  op: "StridedSlice"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/Shape"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_1/stack"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_1/stack_1"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_2"
  op: "StridedSlice"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/Shape"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_2/stack"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_2/stack_1"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_1"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/mul/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/add/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 7
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/add"
  op: "Add"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/mul"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/add/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/mul_1"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice_2"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/add_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/add_1"
  op: "Add"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/mul_1"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/add_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/stack/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/stack"
  op: "Pack"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/strided_slice"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/add"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/add_1"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/stack/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/conv2d_transpose"
  op: "Conv2DBackpropInput"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/stack"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/weights/read"
  input: "SegmentationNet/ImageLogits/Conv/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/conv2d_transpose"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/Const"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta/read"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean/read"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/Relu"
  op: "Relu"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/concat"
  op: "ConcatV2"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_8_pointwise/Relu"
  input: "SegmentationNet/ImageLogits/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03604920580983162
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03604920580983162
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/ImageLogits/concat"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/biases"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/biases/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/depthwise"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\002\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0883883461356163
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0883883461356163
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 512
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_1/weights"
  input: "SegmentationNet/ImageLogits/Conv_1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/ImageLogits/SeparableConv2d/BiasAdd"
  input: "SegmentationNet/ImageLogits/Conv_1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/ImageLogits/Conv_1/Conv2D"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/Const"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta/read"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean/read"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_1/Relu"
  op: "Relu"
  input: "SegmentationNet/ImageLogits/Conv_1/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/resize_images/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\036\000\000\000(\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/resize_images/ResizeNearestNeighbor"
  op: "ResizeNearestNeighbor"
  input: "SegmentationNet/ImageLogits/Conv_1/Relu"
  input: "SegmentationNet/ImageLogits/resize_images/size"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "align_corners"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0509316585958004
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0509316585958004
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/ImageLogits/resize_images/ResizeNearestNeighbor"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/biases"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/biases/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_1/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_1/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.125
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.125
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 256
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_2/weights"
  input: "SegmentationNet/ImageLogits/Conv_2/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_2/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_1/BiasAdd"
  input: "SegmentationNet/ImageLogits/Conv_2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/ImageLogits/Conv_2/Conv2D"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/Const"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta/read"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean/read"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_2/Relu"
  op: "Relu"
  input: "SegmentationNet/ImageLogits/Conv_2/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/concat_1"
  op: "ConcatV2"
  input: "SegmentationNet/ImageLogits/Conv_2/Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_5_pointwise/Relu"
  input: "SegmentationNet/ImageLogits/concat_1/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0509316585958004
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0509316585958004
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/ImageLogits/concat_1"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/biases"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/biases/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_2/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_2/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.125
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.125
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 256
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_3/weights"
  input: "SegmentationNet/ImageLogits/Conv_3/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_3/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_2/BiasAdd"
  input: "SegmentationNet/ImageLogits/Conv_3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/ImageLogits/Conv_3/Conv2D"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/Const"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta/read"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean/read"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_3/Relu"
  op: "Relu"
  input: "SegmentationNet/ImageLogits/Conv_3/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/resize_images_1/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "<\000\000\000P\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/resize_images_1/ResizeNearestNeighbor"
  op: "ResizeNearestNeighbor"
  input: "SegmentationNet/ImageLogits/Conv_3/Relu"
  input: "SegmentationNet/ImageLogits/resize_images_1/size"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "align_corners"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0718885138630867
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0718885138630867
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/ImageLogits/resize_images_1/ResizeNearestNeighbor"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/biases"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/biases/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_3/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_3/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\200\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1767766922712326
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1767766922712326
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 128
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_4/weights"
  input: "SegmentationNet/ImageLogits/Conv_4/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_4/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_3/BiasAdd"
  input: "SegmentationNet/ImageLogits/Conv_4/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/ImageLogits/Conv_4/Conv2D"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/Const"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta/read"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean/read"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_4/Relu"
  op: "Relu"
  input: "SegmentationNet/ImageLogits/Conv_4/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/concat_2/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/concat_2"
  op: "ConcatV2"
  input: "SegmentationNet/ImageLogits/Conv_4/Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_2_pointwise/Relu"
  input: "SegmentationNet/ImageLogits/concat_2/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0718885138630867
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0718885138630867
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/ImageLogits/concat_2"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/biases"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/biases/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_4/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_4/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\200\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1767766922712326
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1767766922712326
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 128
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_5/weights"
  input: "SegmentationNet/ImageLogits/Conv_5/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_5/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_4/BiasAdd"
  input: "SegmentationNet/ImageLogits/Conv_5/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/ImageLogits/Conv_5/Conv2D"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/Const"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta/read"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean/read"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_5/Relu"
  op: "Relu"
  input: "SegmentationNet/ImageLogits/Conv_5/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/resize_images_2/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "x\000\000\000\240\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/resize_images_2/ResizeNearestNeighbor"
  op: "ResizeNearestNeighbor"
  input: "SegmentationNet/ImageLogits/Conv_5/Relu"
  input: "SegmentationNet/ImageLogits/resize_images_2/size"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "align_corners"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/ImageLogits/resize_images_2/ResizeNearestNeighbor"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/biases/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/biases/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/biases/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/biases/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/biases/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/biases"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/biases"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/biases/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/SeparableConv2d_5/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/SeparableConv2d_5/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\013\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.2828427255153656
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.2828427255153656
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 11
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_6/weights"
  input: "SegmentationNet/ImageLogits/Conv_6/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_6/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/ImageLogits/SeparableConv2d_5/BiasAdd"
  input: "SegmentationNet/ImageLogits/Conv_6/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 11
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 11
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 11
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 11
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean/Initializer/zeros"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean/Initializer/zeros/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 11
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 11
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance/Initializer/ones/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance/Initializer/ones"
  op: "Fill"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance/Initializer/ones/shape_as_tensor"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance/Initializer/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 11
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/ImageLogits/Conv_6/Conv2D"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/Const"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta/read"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean/read"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv_6/Relu"
  op: "Relu"
  input: "SegmentationNet/ImageLogits/Conv_6/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/predictions/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "SegmentationNet/predictions"
  op: "ArgMax"
  input: "SegmentationNet/ImageLogits/Conv_6/Relu"
  input: "SegmentationNet/predictions/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "init"
  op: "NoOp"
  input: "^SegmentationNet/Conv2d_0/weights/Assign"
  input: "^SegmentationNet/Conv2d_0/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_0/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_0/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_1_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_1_depthwise/biases/Assign"
  input: "^SegmentationNet/Conv2d_1_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_2_depthwise/biases/Assign"
  input: "^SegmentationNet/Conv2d_2_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_3_depthwise/biases/Assign"
  input: "^SegmentationNet/Conv2d_3_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_4_depthwise/biases/Assign"
  input: "^SegmentationNet/Conv2d_4_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_5_depthwise/biases/Assign"
  input: "^SegmentationNet/Conv2d_5_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_6_depthwise/biases/Assign"
  input: "^SegmentationNet/Conv2d_6_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_7_depthwise/biases/Assign"
  input: "^SegmentationNet/Conv2d_7_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_8_depthwise/biases/Assign"
  input: "^SegmentationNet/Conv2d_8_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_9_depthwise/biases/Assign"
  input: "^SegmentationNet/Conv2d_9_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_10_depthwise/biases/Assign"
  input: "^SegmentationNet/Conv2d_10_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_11_depthwise/biases/Assign"
  input: "^SegmentationNet/Conv2d_11_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/ImageLogits/Conv/weights/Assign"
  input: "^SegmentationNet/ImageLogits/Conv/biases/Assign"
  input: "^SegmentationNet/ImageLogits/Conv2d_transpose/weights/Assign"
  input: "^SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/beta/Assign"
  input: "^SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/ImageLogits/Conv2d_transpose/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/ImageLogits/SeparableConv2d/depthwise_weights/Assign"
  input: "^SegmentationNet/ImageLogits/SeparableConv2d/biases/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_1/weights/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_1/BatchNorm/beta/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_1/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/ImageLogits/SeparableConv2d_1/depthwise_weights/Assign"
  input: "^SegmentationNet/ImageLogits/SeparableConv2d_1/biases/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_2/weights/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_2/BatchNorm/beta/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_2/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/ImageLogits/SeparableConv2d_2/depthwise_weights/Assign"
  input: "^SegmentationNet/ImageLogits/SeparableConv2d_2/biases/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_3/weights/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_3/BatchNorm/beta/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_3/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/ImageLogits/SeparableConv2d_3/depthwise_weights/Assign"
  input: "^SegmentationNet/ImageLogits/SeparableConv2d_3/biases/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_4/weights/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_4/BatchNorm/beta/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_4/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/ImageLogits/SeparableConv2d_4/depthwise_weights/Assign"
  input: "^SegmentationNet/ImageLogits/SeparableConv2d_4/biases/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_5/weights/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_5/BatchNorm/beta/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_5/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/ImageLogits/SeparableConv2d_5/depthwise_weights/Assign"
  input: "^SegmentationNet/ImageLogits/SeparableConv2d_5/biases/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_6/weights/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_6/BatchNorm/beta/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/ImageLogits/Conv_6/BatchNorm/moving_variance/Assign"
}
node {
  name: "init_1"
  op: "NoOp"
}
node {
  name: "group_deps"
  op: "NoOp"
  input: "^init"
  input: "^init_1"
}
versions {
  producer: 26
}
