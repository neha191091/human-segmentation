from segmentation_python.data_utils import DataSet
from segmentation_python.initialize import _MAIN_PATH

dataset = DataSet(num_poses=53, num_angles=360, max_records_in_tfrec_file=3600, val_fraction=0.01, test_fraction=0.01)