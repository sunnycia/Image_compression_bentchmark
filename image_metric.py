import glob
import cv2
import sys
import csv
import numpy
import re
import sys
import scipy.misc
import subprocess
import os.path
sys.path.append('utils/video-quality')
import vifp
import ssim
import psnr
import niqe
import reco

import matplotlib.pyplot as plt

import argparse
parser = argparse.ArgumentParser()
parser.add_argument('--ref_dir', type=str, required=True)
parser.add_argument('--cps_dir', type=str, required=True)
parser.add_argument('--output_path', type=str, default=None)

args = parser.parse_args()
ref_dir = args.ref_dir
cps_dir = args.cps_dir
if args.output_path is None:
    output_path = os.path.basename(ref_dir)+'_'+os.path.basename(cps_dir)+'.csv'
else:
    output_path = args.output_path

w_f =open(output_path, 'w')
csv_writer = csv.writer(w_f)
csv_writer.writerow(['reference image', 'compress image', 'ref img shape', 'ref image size', 'cps stream size', 'compress ratio', 'psnr', 'ssim'])
ref_path_list = glob.glob(os.path.join(ref_dir, '*.*'))
for ref_path in ref_path_list:
    size_values = []
    # vifp_values = []
    ssim_values = []
    psnr_values = []
    # reco_values = []

    ref_name = os.path.basename(ref_path)

    cps_path_list = glob.glob(os.path.join(cps_dir, ref_name.split('.')[0]+'_*'))
    print ref_path
    ref_img = scipy.misc.imread(ref_path, flatten=False, mode='RGB').astype(numpy.float32)#[:, :, :3]

    print type(ref_img), ref_img.shape, 
    ori_shape = ref_img.shape
    ori_size = 1
    for dim in ori_shape:
        ori_size = ori_size * dim
    ori_size = int(ori_size/1024)
    print cps_path_list
    for cps_path in cps_path_list:
        file_size = os.path.getsize(cps_path)

        cps_img = scipy.misc.imread(cps_path, flatten=False, mode='RGB').astype(numpy.float32)
        print cps_img.shape#exit()
        size_values.append( int(file_size/1024) ) ## kb
        # vifp_values.append( vifp.vifp_mscale(ref_img, cps_img) )
        ssim_values.append( ssim.ssim_exact(ref_img/255, cps_img/255) )
        psnr_values.append( psnr.psnr(ref_img, cps_img) )
        # reco_values.append( reco.reco(ref_img/255, cps_img/255) )
    # print size_values;exit()
    for i in range(len(size_values)):
        csv_writer.writerow
        output_row=[os.path.basename(ref_path), os.path.basename(cps_path_list[i]), str(ori_shape), str(ori_size), str(size_values[i]), str(float(ori_size)/size_values[i]), str(psnr_values[i]), str(ssim_values[i])]
        csv_writer.writerow(output_row)
    # exit()
    # output_row=[]
    # print ssim_values;exit()
    