import cv2
import scipy.misc

import sys
sys.path.append('video-quality')
from psnr import *
from ssim import *


ref_path = '/data/sunnycia/image_compression_challenge/dataset/KODAK/kodim24.png'
cps_path = '/data/sunnycia/image_compression_challenge/compressed_set/KODAK/jpeg/kodim24_quality_80.jpeg'
# cps_path = '/data/sunnycia/image_compression_challenge/compressed_set/KODAK/jpeg2000/kodim24_ratio_8.jp2'

mode='RGB'

ref_img = scipy.misc.imread(ref_path, mode=mode)
cps_img = scipy.misc.imread(cps_path, mode=mode)
# ref_img = cv2.imread(ref_path, 0)
# cps_img = cv2.imread(cps_path, 0)


print psnr(ref_img, cps_img)