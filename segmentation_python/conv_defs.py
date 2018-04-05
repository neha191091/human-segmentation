from segmentation_python.net_mobilenet_v1 import Conv, DepthSepConv

_CONV_DEFS = [[
                # Original Mobilenet_V1
                Conv(kernel=[3, 3], stride=2, depth=32),  # 0
                DepthSepConv(kernel=[3, 3], stride=1, depth=64), # 1
                DepthSepConv(kernel=[3, 3], stride=2, depth=128), # 2
                DepthSepConv(kernel=[3, 3], stride=1, depth=128), # 3
                DepthSepConv(kernel=[3, 3], stride=2, depth=256), # 4
                DepthSepConv(kernel=[3, 3], stride=1, depth=256), # 5
                DepthSepConv(kernel=[3, 3], stride=2, depth=512), # 6
                DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 7
                DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 8
                DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 9
                DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 10
                DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 11
                DepthSepConv(kernel=[3, 3], stride=2, depth=1024),# 12
                DepthSepConv(kernel=[3, 3], stride=1, depth=1024) # 13
            ],
            [
                # For images that are 120x160 : num parameters - 9923073 for mobile_depth_multiplier = 0.75
                Conv(kernel=[3, 3], stride=2, depth=32),  # 0
                DepthSepConv(kernel=[3, 3], stride=1, depth=64), # 1
                DepthSepConv(kernel=[3, 3], stride=2, depth=128), # 2
                DepthSepConv(kernel=[3, 3], stride=1, depth=128), # 3
                DepthSepConv(kernel=[3, 3], stride=2, depth=256), # 4
                DepthSepConv(kernel=[3, 3], stride=1, depth=256), # 5
                DepthSepConv(kernel=[3, 3], stride=2, depth=512), # 6
                DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 7
                DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 8
                DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 9
            ],
            [
                # For images that are 480x640: num parameters - 11398401 for mobile_depth_multiplier = 0.75
                Conv(kernel=[3, 3], stride=4, depth=32),  # 0
                DepthSepConv(kernel=[3, 3], stride=1, depth=64), # 1
                DepthSepConv(kernel=[3, 3], stride=2, depth=128), # 2
                DepthSepConv(kernel=[3, 3], stride=1, depth=128), # 3
                DepthSepConv(kernel=[3, 3], stride=2, depth=256), # 4
                DepthSepConv(kernel=[3, 3], stride=1, depth=256), # 5
                DepthSepConv(kernel=[3, 3], stride=2, depth=512), # 6
                DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 7
                DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 8
                DepthSepConv(kernel=[3, 3], stride=2, depth=512),# 9
            ],
            [
                # For images that are 480x640: num parameters - 2157057 for mobile_depth_multiplier = 0.75 , 3011233 for mobile_depth_multiplier = 1
                Conv(kernel=[3, 3], stride=4, depth=32),  # 0
                DepthSepConv(kernel=[3, 3], stride=1, depth=64), # 1
                DepthSepConv(kernel=[3, 3], stride=2, depth=128), # 2
                DepthSepConv(kernel=[3, 3], stride=1, depth=128), # 3
                DepthSepConv(kernel=[3, 3], stride=2, depth=256), # 4
                DepthSepConv(kernel=[3, 3], stride=1, depth=256), # 5
                DepthSepConv(kernel=[3, 3], stride=2, depth=512), # 6
                DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 7
                DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 8
                DepthSepConv(kernel=[3, 3], stride=1, depth=512),# 9
            ],
            [
                # For images that are 480x640: num parameters - 11245185 for mobile_depth_multiplier = 0.75
                Conv(kernel=[3, 3], stride=4, depth=32),  # 0
                DepthSepConv(kernel=[3, 3], stride=1, depth=64), # 1
                DepthSepConv(kernel=[3, 3], stride=2, depth=128), # 2
                DepthSepConv(kernel=[3, 3], stride=1, depth=128), # 3
                DepthSepConv(kernel=[3, 3], stride=2, depth=256), # 4
                DepthSepConv(kernel=[3, 3], stride=1, depth=256), # 5
                DepthSepConv(kernel=[3, 3], stride=2, depth=512), # 6
                DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 7
                DepthSepConv(kernel=[3, 3], stride=2, depth=512), # 8
            ]
        ]

class ConvDef:

    def __init__(self):
        # _CONV_DEFS specifies the MobileNet body
        self._CONV_DEFS = [
            Conv(kernel=[3, 3], stride=2, depth=32),  # 0
            DepthSepConv(kernel=[3, 3], stride=1, depth=64), # 1
            DepthSepConv(kernel=[3, 3], stride=2, depth=128), # 2
            DepthSepConv(kernel=[3, 3], stride=1, depth=128), # 3
            DepthSepConv(kernel=[3, 3], stride=2, depth=256), # 4
            DepthSepConv(kernel=[3, 3], stride=1, depth=256), # 5
            DepthSepConv(kernel=[3, 3], stride=2, depth=512), # 6
            DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 7
            DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 8
            DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 9
            DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 10
            DepthSepConv(kernel=[3, 3], stride=1, depth=512), # 11
            DepthSepConv(kernel=[3, 3], stride=2, depth=1024), # 12
            DepthSepConv(kernel=[3, 3], stride=1, depth=1024) # 13
        ]

    def adjust_CONV_DEFS_first_stride(self, new_stride):
        self._CONV_DEFS[0] = Conv(kernel=[3, 3], stride=new_stride, depth=32)

    def delete_layers(self, layer_nums):
        for i in sorted(layer_nums, reverse=True):
            if i < len(self._CONV_DEFS):
                del self._CONV_DEFS[i]

    def get_conv_def_length(self):
        return len(self._CONV_DEFS)

    def get_conv_def(self):
        return self._CONV_DEFS

    def add_layer(self,layer_type='DepthSepConv',kernel=[3, 3],stride=1,depth=1024):
        if layer_type == 'Conv':
            l_type = Conv
        else:
            l_type = DepthSepConv
        self._CONV_DEFS.append(l_type(kernel=kernel,stride=stride,depth=depth))