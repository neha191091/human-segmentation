import configparser

_CONFIG =configparser.ConfigParser(interpolation=configparser.ExtendedInterpolation(), strict=False)

_PROJECT_PATH = '/home/neha/Documents/repo/segmentation/segmentation_python/'
_CHKPT_PATH = _PROJECT_PATH + 'chkpt/'
_RESULT_PATH = _PROJECT_PATH + 'result/'
_DATA_PATH = _PROJECT_PATH + 'data/'
_TINY = 1e-8

