Segmentation Training
=====================

This project is a consequence of an internal course requirement during my masters. Its goal is to segment human body parts from depth images. I compared my results on several different U-Net based models, with particular focus on high speed and accuracy.  
For further information, read [Semantic_Segmentation_IDP_Report](segmentation_python/Documents/Semantic_Segmentation_IDP_Report.pdf).  
This project obtains and preprocess the training data, trains the segmentation graph, and freezes the graph to a protobuf file for later inference in C++.

Features/Prerequisites
--------
* **Data Gathering** - Done using scans derived from CAESAR dataset (https://graphics.soe.ucsc.edu/data/BodyModels/), coloring script 'color_all_registered_meshes' and blender scripts 'blender_scripts_render_plys'
* **Preprocessing** - make sure to preprocess the data before initiating training/evaluation (FixDepthImages)
* **Preprocessing** - make sure to preprocess the data before initiating training/evaluation (FixDepthImages)
* **Model Definition** - 6 models have been defined in total (see [net_main.py](segmentation_python/net_main.py)), using various different parameters set during training - 
    * **multi_deconv** - defines the kind of upampling operation for deconvolution - 1 - transposed, 2 - resize + convolution, 3 - resize + depthwise convolution, None
    * **conv_def_num** - defines the layer architecture for the encoder, the decoder is defined automatically in accordance. See [conv_defs.py](segmentation_python/conv_defs.py)
    * **mob_depth_multiplier** - depth multiplier for the depthwise sep convolutions
    * **follow_up_convs** - number of follow up convolutions for each upsampling layer in decoder
    * **sep_convs** - whether to use seperable convolutions for the followups or not
    * **depthsep_inter_norm_activn** - whether the intermediate normalization and activation between depthwise and pointwise convolution is present or not
* **Training** - training on models defined in 'net_main.py', run the script [training.py](segmentation_python/training.py)/[training_raw_data.py](segmentation_python/training_raw_data.py) - modfiy hyperparameters in the file itself - to initiate the training process.
* **Evaluation** - evaluate the models on your test set using [evaluation.py](segmentation_python/evaluation.py)/[evaluation_raw_data.py](segmentation_python/evaluation_raw_data.py) 
* **Prediction** - predict from real depth data using [predict_raw_data.py](segmentation_python/predict_raw_data.py)
* **Freezing graphs** - Freeze graphs to protobuf files using [freeze_prediction_graph.py](segmentation_python/freeze_prediction_graph.py), frozen graphs are stored in [SaveFiles](segmentation_python/SaveFiles)

Dependencies
------------
* **For segmentation_python** - Python 3.5, all dependencies in the accompanying requirements.txt - you may change tensorflow to tensorflow-gpu.
* **For FixDepthImages and color_all_meshes** - Opencv 3.2, Boost and C++11
* **For blender_scripts_render_plys** - blender software
