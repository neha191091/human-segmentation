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
versions {
  producer: 24
}
