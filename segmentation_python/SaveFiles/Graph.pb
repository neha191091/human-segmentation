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
  name: "SegmentationNet/Conv2d_0/BatchNorm/beta/Initializer/zeros"
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
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean/Initializer/zeros"
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
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance/Initializer/ones"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/BatchNorm/Const"
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
  name: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta"
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
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean"
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
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/depthwise"
  input: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
  input: "SegmentationNet/SegmentationNet/Conv2d_1_depthwise/Relu"
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
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta/Initializer/zeros"
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
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
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
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/BatchNorm/Const"
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
  name: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta"
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
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean"
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
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/depthwise"
  input: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\200\000\000\000"
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
        float_val: -0.1767766922712326
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
        float_val: 0.1767766922712326
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
  input: "SegmentationNet/SegmentationNet/Conv2d_2_depthwise/Relu"
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
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta/Initializer/zeros"
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
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
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
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
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
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\001\000\000\000"
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
        float_val: -0.0718885138630867
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
        float_val: 0.0718885138630867
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
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\001\000\000\000"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/BatchNorm/Const"
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
  name: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta"
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
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean"
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
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/depthwise"
  input: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
        tensor_content: "\001\000\000\000\001\000\000\000\200\000\000\000\200\000\000\000"
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
        float_val: -0.1530931144952774
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
        float_val: 0.1530931144952774
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
  input: "SegmentationNet/SegmentationNet/Conv2d_3_depthwise/Relu"
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
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta/Initializer/zeros"
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
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
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
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/BatchNorm/Const"
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
  name: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta"
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
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean"
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
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/depthwise"
  input: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
        tensor_content: "\001\000\000\000\001\000\000\000\200\000\000\000\000\001\000\000"
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
        float_val: -0.125
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
        float_val: 0.125
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
  input: "SegmentationNet/SegmentationNet/Conv2d_4_depthwise/Relu"
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
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta/Initializer/zeros"
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
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
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
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
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
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
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
        float_val: -0.0509316585958004
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
        float_val: 0.0509316585958004
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
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/BatchNorm/Const"
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
  name: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta"
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
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean"
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
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/depthwise"
  input: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\000\001\000\000"
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
        float_val: -0.10825317353010178
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
        float_val: 0.10825317353010178
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
  input: "SegmentationNet/SegmentationNet/Conv2d_5_depthwise/Relu"
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
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta/Initializer/zeros"
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
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
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
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
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
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
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
        float_val: -0.0509316585958004
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
        float_val: 0.0509316585958004
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
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\001\000\000\000"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/BatchNorm/Const"
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
  name: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta"
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
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean"
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
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/depthwise"
  input: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\000\002\000\000"
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
        float_val: -0.0883883461356163
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
        float_val: 0.0883883461356163
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
  input: "SegmentationNet/SegmentationNet/Conv2d_6_depthwise/Relu"
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
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta/Initializer/zeros"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean/Initializer/zeros"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance/Initializer/ones"
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
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\001\000\000\000"
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
        float_val: -0.03604920580983162
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
        float_val: 0.03604920580983162
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
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\001\000\000\000"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/BatchNorm/Const"
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
  name: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/depthwise"
  input: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
        tensor_content: "\001\000\000\000\001\000\000\000\000\002\000\000\000\002\000\000"
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
        float_val: -0.0765465572476387
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
        float_val: 0.0765465572476387
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
  input: "SegmentationNet/SegmentationNet/Conv2d_7_depthwise/Relu"
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
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta/Initializer/zeros"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean/Initializer/zeros"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance/Initializer/ones"
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
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\001\000\000\000"
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
        float_val: -0.03604920580983162
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
        float_val: 0.03604920580983162
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
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\001\000\000\000"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/BatchNorm/Const"
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
  name: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/depthwise"
  input: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
        tensor_content: "\001\000\000\000\001\000\000\000\000\002\000\000\000\002\000\000"
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
        float_val: -0.0765465572476387
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
        float_val: 0.0765465572476387
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
  input: "SegmentationNet/SegmentationNet/Conv2d_8_depthwise/Relu"
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
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta/Initializer/zeros"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean/Initializer/zeros"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance/Initializer/ones"
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
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\001\000\000\000"
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
        float_val: -0.03604920580983162
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
        float_val: 0.03604920580983162
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
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\001\000\000\000"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/BatchNorm/Const"
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
  name: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/depthwise"
  input: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
        tensor_content: "\001\000\000\000\001\000\000\000\000\002\000\000\000\002\000\000"
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
        float_val: -0.0765465572476387
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
        float_val: 0.0765465572476387
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
  input: "SegmentationNet/SegmentationNet/Conv2d_9_depthwise/Relu"
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
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta/Initializer/zeros"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean/Initializer/zeros"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance/Initializer/ones"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/BatchNorm/Const"
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
  name: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/depthwise"
  input: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
  input: "SegmentationNet/SegmentationNet/Conv2d_10_depthwise/Relu"
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
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta/Initializer/zeros"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean/Initializer/zeros"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance/Initializer/ones"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/BatchNorm/Const"
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
  name: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/depthwise"
  input: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
  input: "SegmentationNet/SegmentationNet/Conv2d_11_depthwise/Relu"
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
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta/Initializer/zeros"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean/Initializer/zeros"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
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
  name: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance/Initializer/ones"
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
  name: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
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
  name: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
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
  name: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
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
  name: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform/shape"
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
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
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
  name: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
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
  name: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
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
  name: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_12_depthwise/depthwise/Shape"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_12_depthwise/depthwise/dilation_rate"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_12_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/SegmentationNet/Conv2d_11_pointwise/Relu"
  input: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_12_depthwise/BatchNorm/Const"
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
  name: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean"
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
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_12_depthwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_12_depthwise/depthwise"
  input: "SegmentationNet/SegmentationNet/Conv2d_12_depthwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_12_depthwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_12_depthwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_12_depthwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/weights"
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
        tensor_content: "\001\000\000\000\001\000\000\000\000\002\000\000\000\004\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/weights"
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
        float_val: -0.0625
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/weights"
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
        float_val: 0.0625
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform/shape"
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
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/weights"
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
  name: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/weights"
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
          size: 1024
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
  name: "SegmentationNet/Conv2d_12_pointwise/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_pointwise/weights"
  input: "SegmentationNet/Conv2d_12_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/weights"
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
  name: "SegmentationNet/Conv2d_12_pointwise/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_12_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_12_pointwise/dilation_rate"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_12_pointwise/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_12_depthwise/Relu"
  input: "SegmentationNet/Conv2d_12_pointwise/weights/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_12_pointwise/BatchNorm/Const"
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
            size: 1024
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta"
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
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta"
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
          size: 1024
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
  name: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean"
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
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean"
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
          size: 1024
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
  name: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance"
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
          dim {
            size: 1024
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance"
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
          size: 1024
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
  name: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_12_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_12_pointwise/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_12_pointwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_12_pointwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_12_pointwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_12_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
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
        tensor_content: "\003\000\000\000\003\000\000\000\000\004\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
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
        float_val: -0.025503069162368774
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
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
        float_val: 0.025503069162368774
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform/shape"
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
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
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
  name: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
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
          size: 1024
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
  name: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
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
  name: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_13_depthwise/depthwise/Shape"
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
        tensor_content: "\003\000\000\000\003\000\000\000\000\004\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_13_depthwise/depthwise/dilation_rate"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_13_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "SegmentationNet/SegmentationNet/Conv2d_12_pointwise/Relu"
  input: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_13_depthwise/BatchNorm/Const"
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
            size: 1024
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta"
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
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta"
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
          size: 1024
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
  name: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean"
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
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean"
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
          size: 1024
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
  name: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance"
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
          dim {
            size: 1024
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance"
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
          size: 1024
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
  name: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_13_depthwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_13_depthwise/depthwise"
  input: "SegmentationNet/SegmentationNet/Conv2d_13_depthwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_13_depthwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_13_depthwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_13_depthwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/weights"
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
        tensor_content: "\001\000\000\000\001\000\000\000\000\004\000\000\000\004\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/weights"
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
        float_val: -0.05412658676505089
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/weights"
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
        float_val: 0.05412658676505089
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform/shape"
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
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/weights"
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
  name: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/weights"
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
          size: 1024
        }
        dim {
          size: 1024
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
  name: "SegmentationNet/Conv2d_13_pointwise/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_pointwise/weights"
  input: "SegmentationNet/Conv2d_13_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/weights"
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
  name: "SegmentationNet/Conv2d_13_pointwise/weights/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_13_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_13_pointwise/dilation_rate"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_13_pointwise/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_13_depthwise/Relu"
  input: "SegmentationNet/Conv2d_13_pointwise/weights/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_13_pointwise/BatchNorm/Const"
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
            size: 1024
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta"
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
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta"
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
          size: 1024
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
  name: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta"
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
  name: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean"
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
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean"
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
          size: 1024
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
  name: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean"
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
  name: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance"
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
          dim {
            size: 1024
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance"
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
          size: 1024
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
  name: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance"
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
  name: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "SegmentationNet/SegmentationNet/Conv2d_13_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "SegmentationNet/SegmentationNet/Conv2d_13_pointwise/Conv2D"
  input: "SegmentationNet/SegmentationNet/Conv2d_13_pointwise/BatchNorm/Const"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta/read"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean/read"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance/read"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_13_pointwise/BatchNorm/Const_1"
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
  name: "SegmentationNet/SegmentationNet/Conv2d_13_pointwise/Relu"
  op: "Relu"
  input: "SegmentationNet/SegmentationNet/Conv2d_13_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/AvgPool_1a/AvgPool"
  op: "AvgPool"
  input: "SegmentationNet/SegmentationNet/Conv2d_13_pointwise/Relu"
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
    key: "ksize"
    value {
      list {
        i: 1
        i: 4
        i: 5
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
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Dropout_1b/Identity"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/AvgPool_1a/AvgPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
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
        tensor_content: "\001\000\000\000\001\000\000\000\000\004\000\000\013\000\000\000"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
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
        float_val: -0.0761386975646019
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
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
        float_val: 0.0761386975646019
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform/shape"
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
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
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
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform/max"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform/RandomUniform"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform"
  op: "Add"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform/mul"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
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
          size: 1024
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
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
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
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases"
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
          dim {
            size: 11
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases"
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
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases"
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
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/dilation_rate"
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
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/Conv2D"
  op: "Conv2D"
  input: "SegmentationNet/ImageLogits/Dropout_1b/Identity"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/read"
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
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/Conv2D"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases/read"
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
  name: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/Relu"
  op: "Relu"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
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
        tensor_content: "x\000\000\000\240\000\000\000\013\000\000\000\013\000\000\000"
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
        float_val: -0.0037688917946070433
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
        float_val: 0.0037688917946070433
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
          size: 120
        }
        dim {
          size: 160
        }
        dim {
          size: 11
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
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/biases"
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
          dim {
            size: 11
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/biases"
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
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/biases/Assign"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/biases"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/biases"
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
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/biases/read"
  op: "Identity"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/biases"
      }
    }
  }
}
node {
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/Shape"
  op: "Shape"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/Relu"
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
        int_val: 119
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
        int_val: 159
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
        int_val: 11
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
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/Relu"
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
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/BiasAdd"
  op: "BiasAdd"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/conv2d_transpose"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/biases/read"
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
  name: "SegmentationNet/ImageLogits/Conv2d_transpose/Relu"
  op: "Relu"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/BiasAdd"
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
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/Relu"
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
  input: "^SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_1_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_2_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_2_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_3_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_3_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_4_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_4_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_5_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_5_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_6_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_6_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_7_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_7_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_8_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_8_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_9_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_9_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_10_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_10_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_11_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_11_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_12_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_12_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_13_depthwise/depthwise_weights/Assign"
  input: "^SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/Conv2d_13_pointwise/weights/Assign"
  input: "^SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta/Assign"
  input: "^SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean/Assign"
  input: "^SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance/Assign"
  input: "^SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights/Assign"
  input: "^SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases/Assign"
  input: "^SegmentationNet/ImageLogits/Conv2d_transpose/weights/Assign"
  input: "^SegmentationNet/ImageLogits/Conv2d_transpose/biases/Assign"
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
node {
  name: "save/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 112
          }
        }
        string_val: "SegmentationNet/Conv2d_0/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_0/weights"
        string_val: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
        string_val: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_10_pointwise/weights"
        string_val: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
        string_val: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_11_pointwise/weights"
        string_val: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
        string_val: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_12_pointwise/weights"
        string_val: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
        string_val: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_13_pointwise/weights"
        string_val: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
        string_val: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_1_pointwise/weights"
        string_val: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
        string_val: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_2_pointwise/weights"
        string_val: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
        string_val: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_3_pointwise/weights"
        string_val: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
        string_val: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_4_pointwise/weights"
        string_val: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
        string_val: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_5_pointwise/weights"
        string_val: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
        string_val: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_6_pointwise/weights"
        string_val: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
        string_val: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_7_pointwise/weights"
        string_val: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
        string_val: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_8_pointwise/weights"
        string_val: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
        string_val: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta"
        string_val: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean"
        string_val: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance"
        string_val: "SegmentationNet/Conv2d_9_pointwise/weights"
        string_val: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases"
        string_val: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
        string_val: "SegmentationNet/ImageLogits/Conv2d_transpose/biases"
        string_val: "SegmentationNet/ImageLogits/Conv2d_transpose/weights"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 112
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "SegmentationNet/Conv2d_0/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_0/weights"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_10_pointwise/weights"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_11_pointwise/weights"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_12_pointwise/weights"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_13_pointwise/weights"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_1_pointwise/weights"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_2_pointwise/weights"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_3_pointwise/weights"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_4_pointwise/weights"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_5_pointwise/weights"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_6_pointwise/weights"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_7_pointwise/weights"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_8_pointwise/weights"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance"
  input: "SegmentationNet/Conv2d_9_pointwise/weights"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/biases"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/weights"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_0/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "SegmentationNet/Conv2d_0/BatchNorm/beta"
  input: "save/RestoreV2"
  attr {
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
  name: "save/RestoreV2_1/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_1/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_1"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_1/tensor_names"
  input: "save/RestoreV2_1/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_mean"
  input: "save/RestoreV2_1"
  attr {
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
  name: "save/RestoreV2_2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_2/tensor_names"
  input: "save/RestoreV2_2/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "SegmentationNet/Conv2d_0/BatchNorm/moving_variance"
  input: "save/RestoreV2_2"
  attr {
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
  name: "save/RestoreV2_3/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_0/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_3/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_3"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_3/tensor_names"
  input: "save/RestoreV2_3/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "SegmentationNet/Conv2d_0/weights"
  input: "save/RestoreV2_3"
  attr {
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
  name: "save/RestoreV2_4/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_4/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_4"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_4/tensor_names"
  input: "save/RestoreV2_4/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta"
  input: "save/RestoreV2_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/beta"
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
  name: "save/RestoreV2_5/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_5/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_5"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_5/tensor_names"
  input: "save/RestoreV2_5/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_6/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_6/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_6"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_6/tensor_names"
  input: "save/RestoreV2_6/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_10_depthwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_7/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_7/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_7"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_7/tensor_names"
  input: "save/RestoreV2_7/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_depthwise/depthwise_weights"
  input: "save/RestoreV2_7"
  attr {
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
  name: "save/RestoreV2_8/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_8/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_8"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_8/tensor_names"
  input: "save/RestoreV2_8/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_8"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/beta"
  input: "save/RestoreV2_8"
  attr {
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
  name: "save/RestoreV2_9/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_9/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_9"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_9/tensor_names"
  input: "save/RestoreV2_9/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_9"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_9"
  attr {
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
  name: "save/RestoreV2_10/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_10/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_10"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_10/tensor_names"
  input: "save/RestoreV2_10/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_10"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_pointwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_10"
  attr {
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
  name: "save/RestoreV2_11/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_10_pointwise/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_11/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_11"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_11/tensor_names"
  input: "save/RestoreV2_11/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_11"
  op: "Assign"
  input: "SegmentationNet/Conv2d_10_pointwise/weights"
  input: "save/RestoreV2_11"
  attr {
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
  name: "save/RestoreV2_12/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_12/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_12"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_12/tensor_names"
  input: "save/RestoreV2_12/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_12"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta"
  input: "save/RestoreV2_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/beta"
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
  name: "save/RestoreV2_13/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_13/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_13"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_13/tensor_names"
  input: "save/RestoreV2_13/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_13"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_14/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_14/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_14"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_14/tensor_names"
  input: "save/RestoreV2_14/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_14"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_11_depthwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_15/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_15/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_15"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_15/tensor_names"
  input: "save/RestoreV2_15/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_15"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_depthwise/depthwise_weights"
  input: "save/RestoreV2_15"
  attr {
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
  name: "save/RestoreV2_16/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_16/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_16"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_16/tensor_names"
  input: "save/RestoreV2_16/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_16"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/beta"
  input: "save/RestoreV2_16"
  attr {
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
  name: "save/RestoreV2_17/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_17/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_17"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_17/tensor_names"
  input: "save/RestoreV2_17/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_17"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_17"
  attr {
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
  name: "save/RestoreV2_18/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_18/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_18"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_18/tensor_names"
  input: "save/RestoreV2_18/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_18"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_pointwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_18"
  attr {
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
  name: "save/RestoreV2_19/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_11_pointwise/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_19/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_19"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_19/tensor_names"
  input: "save/RestoreV2_19/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_19"
  op: "Assign"
  input: "SegmentationNet/Conv2d_11_pointwise/weights"
  input: "save/RestoreV2_19"
  attr {
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
  name: "save/RestoreV2_20/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_20/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_20"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_20/tensor_names"
  input: "save/RestoreV2_20/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_20"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta"
  input: "save/RestoreV2_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/beta"
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
  name: "save/RestoreV2_21/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_21/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_21"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_21/tensor_names"
  input: "save/RestoreV2_21/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_21"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_22/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_22/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_22"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_22/tensor_names"
  input: "save/RestoreV2_22/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_22"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_23/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_23/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_23"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_23/tensor_names"
  input: "save/RestoreV2_23/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_23"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
  input: "save/RestoreV2_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_depthwise/depthwise_weights"
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
  name: "save/RestoreV2_24/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_24/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_24"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_24/tensor_names"
  input: "save/RestoreV2_24/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_24"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta"
  input: "save/RestoreV2_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/beta"
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
  name: "save/RestoreV2_25/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_25/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_25"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_25/tensor_names"
  input: "save/RestoreV2_25/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_25"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_26/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_26/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_26"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_26/tensor_names"
  input: "save/RestoreV2_26/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_26"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_27/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_12_pointwise/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_27/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_27"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_27/tensor_names"
  input: "save/RestoreV2_27/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_27"
  op: "Assign"
  input: "SegmentationNet/Conv2d_12_pointwise/weights"
  input: "save/RestoreV2_27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_12_pointwise/weights"
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
  name: "save/RestoreV2_28/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_28/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_28"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_28/tensor_names"
  input: "save/RestoreV2_28/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_28"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta"
  input: "save/RestoreV2_28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/beta"
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
  name: "save/RestoreV2_29/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_29/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_29"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_29/tensor_names"
  input: "save/RestoreV2_29/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_29"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_30/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_30/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_30"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_30/tensor_names"
  input: "save/RestoreV2_30/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_30"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_31/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_31/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_31"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_31/tensor_names"
  input: "save/RestoreV2_31/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_31"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
  input: "save/RestoreV2_31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_depthwise/depthwise_weights"
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
  name: "save/RestoreV2_32/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_32/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_32"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_32/tensor_names"
  input: "save/RestoreV2_32/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_32"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta"
  input: "save/RestoreV2_32"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/beta"
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
  name: "save/RestoreV2_33/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_33/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_33"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_33/tensor_names"
  input: "save/RestoreV2_33/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_33"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_34/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_34/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_34"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_34/tensor_names"
  input: "save/RestoreV2_34/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_34"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_34"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_35/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_13_pointwise/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_35/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_35"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_35/tensor_names"
  input: "save/RestoreV2_35/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_35"
  op: "Assign"
  input: "SegmentationNet/Conv2d_13_pointwise/weights"
  input: "save/RestoreV2_35"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_13_pointwise/weights"
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
  name: "save/RestoreV2_36/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_36/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_36"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_36/tensor_names"
  input: "save/RestoreV2_36/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_36"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta"
  input: "save/RestoreV2_36"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/beta"
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
  name: "save/RestoreV2_37/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_37/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_37"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_37/tensor_names"
  input: "save/RestoreV2_37/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_37"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_37"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_38/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_38/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_38"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_38/tensor_names"
  input: "save/RestoreV2_38/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_38"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_38"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_1_depthwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_39/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_39/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_39"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_39/tensor_names"
  input: "save/RestoreV2_39/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_39"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_depthwise/depthwise_weights"
  input: "save/RestoreV2_39"
  attr {
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
  name: "save/RestoreV2_40/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_40/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_40"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_40/tensor_names"
  input: "save/RestoreV2_40/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_40"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/beta"
  input: "save/RestoreV2_40"
  attr {
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
  name: "save/RestoreV2_41/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_41/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_41"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_41/tensor_names"
  input: "save/RestoreV2_41/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_41"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_41"
  attr {
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
  name: "save/RestoreV2_42/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_42/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_42"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_42/tensor_names"
  input: "save/RestoreV2_42/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_42"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_pointwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_42"
  attr {
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
  name: "save/RestoreV2_43/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_43/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_43"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_43/tensor_names"
  input: "save/RestoreV2_43/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_43"
  op: "Assign"
  input: "SegmentationNet/Conv2d_1_pointwise/weights"
  input: "save/RestoreV2_43"
  attr {
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
  name: "save/RestoreV2_44/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_44/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_44"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_44/tensor_names"
  input: "save/RestoreV2_44/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_44"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta"
  input: "save/RestoreV2_44"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/beta"
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
  name: "save/RestoreV2_45/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_45/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_45"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_45/tensor_names"
  input: "save/RestoreV2_45/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_45"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_45"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_46/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_46/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_46"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_46/tensor_names"
  input: "save/RestoreV2_46/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_46"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_46"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_2_depthwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_47/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_47/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_47"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_47/tensor_names"
  input: "save/RestoreV2_47/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_47"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_depthwise/depthwise_weights"
  input: "save/RestoreV2_47"
  attr {
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
  name: "save/RestoreV2_48/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_48/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_48"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_48/tensor_names"
  input: "save/RestoreV2_48/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_48"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/beta"
  input: "save/RestoreV2_48"
  attr {
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
  name: "save/RestoreV2_49/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_49/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_49"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_49/tensor_names"
  input: "save/RestoreV2_49/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_49"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_49"
  attr {
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
  name: "save/RestoreV2_50/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_50/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_50"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_50/tensor_names"
  input: "save/RestoreV2_50/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_50"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_pointwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_50"
  attr {
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
  name: "save/RestoreV2_51/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_51/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_51"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_51/tensor_names"
  input: "save/RestoreV2_51/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_51"
  op: "Assign"
  input: "SegmentationNet/Conv2d_2_pointwise/weights"
  input: "save/RestoreV2_51"
  attr {
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
  name: "save/RestoreV2_52/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_52/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_52"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_52/tensor_names"
  input: "save/RestoreV2_52/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_52"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta"
  input: "save/RestoreV2_52"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/beta"
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
  name: "save/RestoreV2_53/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_53/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_53"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_53/tensor_names"
  input: "save/RestoreV2_53/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_53"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_53"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_54/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_54/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_54"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_54/tensor_names"
  input: "save/RestoreV2_54/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_54"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_54"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_3_depthwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_55/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_55/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_55"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_55/tensor_names"
  input: "save/RestoreV2_55/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_55"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_depthwise/depthwise_weights"
  input: "save/RestoreV2_55"
  attr {
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
  name: "save/RestoreV2_56/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_56/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_56"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_56/tensor_names"
  input: "save/RestoreV2_56/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_56"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/beta"
  input: "save/RestoreV2_56"
  attr {
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
  name: "save/RestoreV2_57/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_57/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_57"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_57/tensor_names"
  input: "save/RestoreV2_57/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_57"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_57"
  attr {
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
  name: "save/RestoreV2_58/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_58/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_58"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_58/tensor_names"
  input: "save/RestoreV2_58/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_58"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_pointwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_58"
  attr {
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
  name: "save/RestoreV2_59/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_59/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_59"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_59/tensor_names"
  input: "save/RestoreV2_59/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_59"
  op: "Assign"
  input: "SegmentationNet/Conv2d_3_pointwise/weights"
  input: "save/RestoreV2_59"
  attr {
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
  name: "save/RestoreV2_60/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_60/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_60"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_60/tensor_names"
  input: "save/RestoreV2_60/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_60"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta"
  input: "save/RestoreV2_60"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/beta"
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
  name: "save/RestoreV2_61/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_61/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_61"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_61/tensor_names"
  input: "save/RestoreV2_61/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_61"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_61"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_62/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_62/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_62"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_62/tensor_names"
  input: "save/RestoreV2_62/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_62"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_62"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_4_depthwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_63/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_63/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_63"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_63/tensor_names"
  input: "save/RestoreV2_63/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_63"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_depthwise/depthwise_weights"
  input: "save/RestoreV2_63"
  attr {
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
  name: "save/RestoreV2_64/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_64/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_64"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_64/tensor_names"
  input: "save/RestoreV2_64/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_64"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/beta"
  input: "save/RestoreV2_64"
  attr {
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
  name: "save/RestoreV2_65/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_65/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_65"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_65/tensor_names"
  input: "save/RestoreV2_65/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_65"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_65"
  attr {
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
  name: "save/RestoreV2_66/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_66/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_66"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_66/tensor_names"
  input: "save/RestoreV2_66/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_66"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_pointwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_66"
  attr {
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
  name: "save/RestoreV2_67/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_67/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_67"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_67/tensor_names"
  input: "save/RestoreV2_67/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_67"
  op: "Assign"
  input: "SegmentationNet/Conv2d_4_pointwise/weights"
  input: "save/RestoreV2_67"
  attr {
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
  name: "save/RestoreV2_68/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_68/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_68"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_68/tensor_names"
  input: "save/RestoreV2_68/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_68"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta"
  input: "save/RestoreV2_68"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/beta"
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
  name: "save/RestoreV2_69/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_69/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_69"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_69/tensor_names"
  input: "save/RestoreV2_69/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_69"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_69"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_70/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_70/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_70"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_70/tensor_names"
  input: "save/RestoreV2_70/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_70"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_70"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_5_depthwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_71/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_71/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_71"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_71/tensor_names"
  input: "save/RestoreV2_71/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_71"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_depthwise/depthwise_weights"
  input: "save/RestoreV2_71"
  attr {
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
  name: "save/RestoreV2_72/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_72/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_72"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_72/tensor_names"
  input: "save/RestoreV2_72/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_72"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/beta"
  input: "save/RestoreV2_72"
  attr {
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
  name: "save/RestoreV2_73/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_73/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_73"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_73/tensor_names"
  input: "save/RestoreV2_73/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_73"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_73"
  attr {
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
  name: "save/RestoreV2_74/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_74/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_74"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_74/tensor_names"
  input: "save/RestoreV2_74/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_74"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_pointwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_74"
  attr {
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
  name: "save/RestoreV2_75/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_75/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_75"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_75/tensor_names"
  input: "save/RestoreV2_75/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_75"
  op: "Assign"
  input: "SegmentationNet/Conv2d_5_pointwise/weights"
  input: "save/RestoreV2_75"
  attr {
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
  name: "save/RestoreV2_76/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_76/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_76"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_76/tensor_names"
  input: "save/RestoreV2_76/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_76"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta"
  input: "save/RestoreV2_76"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/beta"
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
  name: "save/RestoreV2_77/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_77/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_77"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_77/tensor_names"
  input: "save/RestoreV2_77/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_77"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_77"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_78/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_78/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_78"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_78/tensor_names"
  input: "save/RestoreV2_78/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_78"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_78"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_6_depthwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_79/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_79/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_79"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_79/tensor_names"
  input: "save/RestoreV2_79/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_79"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_depthwise/depthwise_weights"
  input: "save/RestoreV2_79"
  attr {
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
  name: "save/RestoreV2_80/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_80/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_80"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_80/tensor_names"
  input: "save/RestoreV2_80/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_80"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/beta"
  input: "save/RestoreV2_80"
  attr {
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
  name: "save/RestoreV2_81/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_81/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_81"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_81/tensor_names"
  input: "save/RestoreV2_81/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_81"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_81"
  attr {
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
  name: "save/RestoreV2_82/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_82/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_82"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_82/tensor_names"
  input: "save/RestoreV2_82/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_82"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_pointwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_82"
  attr {
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
  name: "save/RestoreV2_83/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_6_pointwise/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_83/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_83"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_83/tensor_names"
  input: "save/RestoreV2_83/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_83"
  op: "Assign"
  input: "SegmentationNet/Conv2d_6_pointwise/weights"
  input: "save/RestoreV2_83"
  attr {
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
  name: "save/RestoreV2_84/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_84/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_84"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_84/tensor_names"
  input: "save/RestoreV2_84/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_84"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta"
  input: "save/RestoreV2_84"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/beta"
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
  name: "save/RestoreV2_85/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_85/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_85"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_85/tensor_names"
  input: "save/RestoreV2_85/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_85"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_85"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_86/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_86/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_86"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_86/tensor_names"
  input: "save/RestoreV2_86/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_86"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_86"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_7_depthwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_87/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_87/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_87"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_87/tensor_names"
  input: "save/RestoreV2_87/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_87"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_depthwise/depthwise_weights"
  input: "save/RestoreV2_87"
  attr {
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
  name: "save/RestoreV2_88/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_88/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_88"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_88/tensor_names"
  input: "save/RestoreV2_88/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_88"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/beta"
  input: "save/RestoreV2_88"
  attr {
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
  name: "save/RestoreV2_89/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_89/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_89"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_89/tensor_names"
  input: "save/RestoreV2_89/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_89"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_89"
  attr {
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
  name: "save/RestoreV2_90/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_90/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_90"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_90/tensor_names"
  input: "save/RestoreV2_90/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_90"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_pointwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_90"
  attr {
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
  name: "save/RestoreV2_91/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_7_pointwise/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_91/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_91"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_91/tensor_names"
  input: "save/RestoreV2_91/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_91"
  op: "Assign"
  input: "SegmentationNet/Conv2d_7_pointwise/weights"
  input: "save/RestoreV2_91"
  attr {
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
  name: "save/RestoreV2_92/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_92/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_92"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_92/tensor_names"
  input: "save/RestoreV2_92/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_92"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta"
  input: "save/RestoreV2_92"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/beta"
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
  name: "save/RestoreV2_93/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_93/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_93"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_93/tensor_names"
  input: "save/RestoreV2_93/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_93"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_93"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_94/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_94/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_94"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_94/tensor_names"
  input: "save/RestoreV2_94/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_94"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_94"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_8_depthwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_95/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_95/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_95"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_95/tensor_names"
  input: "save/RestoreV2_95/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_95"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_depthwise/depthwise_weights"
  input: "save/RestoreV2_95"
  attr {
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
  name: "save/RestoreV2_96/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_96/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_96"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_96/tensor_names"
  input: "save/RestoreV2_96/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_96"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/beta"
  input: "save/RestoreV2_96"
  attr {
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
  name: "save/RestoreV2_97/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_97/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_97"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_97/tensor_names"
  input: "save/RestoreV2_97/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_97"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_97"
  attr {
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
  name: "save/RestoreV2_98/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_98/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_98"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_98/tensor_names"
  input: "save/RestoreV2_98/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_98"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_pointwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_98"
  attr {
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
  name: "save/RestoreV2_99/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_8_pointwise/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_99/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_99"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_99/tensor_names"
  input: "save/RestoreV2_99/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_99"
  op: "Assign"
  input: "SegmentationNet/Conv2d_8_pointwise/weights"
  input: "save/RestoreV2_99"
  attr {
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
  name: "save/RestoreV2_100/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_100/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_100"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_100/tensor_names"
  input: "save/RestoreV2_100/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_100"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta"
  input: "save/RestoreV2_100"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/beta"
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
  name: "save/RestoreV2_101/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_101/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_101"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_101/tensor_names"
  input: "save/RestoreV2_101/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_101"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_101"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_mean"
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
  name: "save/RestoreV2_102/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_102/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_102"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_102/tensor_names"
  input: "save/RestoreV2_102/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_102"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_102"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/Conv2d_9_depthwise/BatchNorm/moving_variance"
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
  name: "save/RestoreV2_103/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_103/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_103"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_103/tensor_names"
  input: "save/RestoreV2_103/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_103"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_depthwise/depthwise_weights"
  input: "save/RestoreV2_103"
  attr {
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
  name: "save/RestoreV2_104/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "save/RestoreV2_104/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_104"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_104/tensor_names"
  input: "save/RestoreV2_104/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_104"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/beta"
  input: "save/RestoreV2_104"
  attr {
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
  name: "save/RestoreV2_105/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "save/RestoreV2_105/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_105"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_105/tensor_names"
  input: "save/RestoreV2_105/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_105"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_mean"
  input: "save/RestoreV2_105"
  attr {
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
  name: "save/RestoreV2_106/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "save/RestoreV2_106/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_106"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_106/tensor_names"
  input: "save/RestoreV2_106/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_106"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_pointwise/BatchNorm/moving_variance"
  input: "save/RestoreV2_106"
  attr {
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
  name: "save/RestoreV2_107/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/Conv2d_9_pointwise/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_107/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_107"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_107/tensor_names"
  input: "save/RestoreV2_107/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_107"
  op: "Assign"
  input: "SegmentationNet/Conv2d_9_pointwise/weights"
  input: "save/RestoreV2_107"
  attr {
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
  name: "save/RestoreV2_108/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases"
      }
    }
  }
}
node {
  name: "save/RestoreV2_108/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_108"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_108/tensor_names"
  input: "save/RestoreV2_108/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_108"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases"
  input: "save/RestoreV2_108"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/biases"
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
  name: "save/RestoreV2_109/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_109/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_109"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_109/tensor_names"
  input: "save/RestoreV2_109/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_109"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
  input: "save/RestoreV2_109"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_1c_1x1/weights"
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
  name: "save/RestoreV2_110/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/ImageLogits/Conv2d_transpose/biases"
      }
    }
  }
}
node {
  name: "save/RestoreV2_110/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_110"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_110/tensor_names"
  input: "save/RestoreV2_110/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_110"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/biases"
  input: "save/RestoreV2_110"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SegmentationNet/ImageLogits/Conv2d_transpose/biases"
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
  name: "save/RestoreV2_111/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "SegmentationNet/ImageLogits/Conv2d_transpose/weights"
      }
    }
  }
}
node {
  name: "save/RestoreV2_111/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_111"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_111/tensor_names"
  input: "save/RestoreV2_111/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_111"
  op: "Assign"
  input: "SegmentationNet/ImageLogits/Conv2d_transpose/weights"
  input: "save/RestoreV2_111"
  attr {
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
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_2"
  input: "^save/Assign_3"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
  input: "^save/Assign_8"
  input: "^save/Assign_9"
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_12"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_17"
  input: "^save/Assign_18"
  input: "^save/Assign_19"
  input: "^save/Assign_20"
  input: "^save/Assign_21"
  input: "^save/Assign_22"
  input: "^save/Assign_23"
  input: "^save/Assign_24"
  input: "^save/Assign_25"
  input: "^save/Assign_26"
  input: "^save/Assign_27"
  input: "^save/Assign_28"
  input: "^save/Assign_29"
  input: "^save/Assign_30"
  input: "^save/Assign_31"
  input: "^save/Assign_32"
  input: "^save/Assign_33"
  input: "^save/Assign_34"
  input: "^save/Assign_35"
  input: "^save/Assign_36"
  input: "^save/Assign_37"
  input: "^save/Assign_38"
  input: "^save/Assign_39"
  input: "^save/Assign_40"
  input: "^save/Assign_41"
  input: "^save/Assign_42"
  input: "^save/Assign_43"
  input: "^save/Assign_44"
  input: "^save/Assign_45"
  input: "^save/Assign_46"
  input: "^save/Assign_47"
  input: "^save/Assign_48"
  input: "^save/Assign_49"
  input: "^save/Assign_50"
  input: "^save/Assign_51"
  input: "^save/Assign_52"
  input: "^save/Assign_53"
  input: "^save/Assign_54"
  input: "^save/Assign_55"
  input: "^save/Assign_56"
  input: "^save/Assign_57"
  input: "^save/Assign_58"
  input: "^save/Assign_59"
  input: "^save/Assign_60"
  input: "^save/Assign_61"
  input: "^save/Assign_62"
  input: "^save/Assign_63"
  input: "^save/Assign_64"
  input: "^save/Assign_65"
  input: "^save/Assign_66"
  input: "^save/Assign_67"
  input: "^save/Assign_68"
  input: "^save/Assign_69"
  input: "^save/Assign_70"
  input: "^save/Assign_71"
  input: "^save/Assign_72"
  input: "^save/Assign_73"
  input: "^save/Assign_74"
  input: "^save/Assign_75"
  input: "^save/Assign_76"
  input: "^save/Assign_77"
  input: "^save/Assign_78"
  input: "^save/Assign_79"
  input: "^save/Assign_80"
  input: "^save/Assign_81"
  input: "^save/Assign_82"
  input: "^save/Assign_83"
  input: "^save/Assign_84"
  input: "^save/Assign_85"
  input: "^save/Assign_86"
  input: "^save/Assign_87"
  input: "^save/Assign_88"
  input: "^save/Assign_89"
  input: "^save/Assign_90"
  input: "^save/Assign_91"
  input: "^save/Assign_92"
  input: "^save/Assign_93"
  input: "^save/Assign_94"
  input: "^save/Assign_95"
  input: "^save/Assign_96"
  input: "^save/Assign_97"
  input: "^save/Assign_98"
  input: "^save/Assign_99"
  input: "^save/Assign_100"
  input: "^save/Assign_101"
  input: "^save/Assign_102"
  input: "^save/Assign_103"
  input: "^save/Assign_104"
  input: "^save/Assign_105"
  input: "^save/Assign_106"
  input: "^save/Assign_107"
  input: "^save/Assign_108"
  input: "^save/Assign_109"
  input: "^save/Assign_110"
  input: "^save/Assign_111"
}
versions {
  producer: 24
}
