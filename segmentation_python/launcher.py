from data_utils import DataSet
from initialize import _PROJECT_PATH

dataset = DataSet(num_poses=53, num_angles=360, max_records_in_tfrec_file=3600, val_fraction=0.01, test_fraction=0.01)
