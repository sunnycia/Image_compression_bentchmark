import os, glob
import sys

import argparse
parser = argparse.ArgumentParser()
parser.add_argument('--yuv_dir', type=str, required=True)
parser.add_argument('--hm_dir', type=str, default='/data/sunnycia/image_compression_challenge/_Train/HM-16.9')
parser.add_argument('--cfg_path', type=str, default='cfg/encoder_lowdelay_main_rext.cfg')
parser.add_argument('--qp', type=int, required=True)
parser.add_argument('--result_dir', type=str, required=True)

args = parser.parse_args()
yuv_dir = args.yuv_dir
hm_dir = args.hm_dir
result_dir = args.result_dir
qp = args.qp
cfg_path = args.cfg_path

if not os.path.isdir(result_dir):
    os.makedirs(result_dir)

os.chdir(hm_dir)
# ./bin/TAppEncoderStatic -c cfg/encoder_lowdelay_main_rext.cfg -i /data/sunnycia/image_compression_challenge/dataset/KODAK_YUV/kodim24_768_512_444.yuv  --InputChromaFormat=444 --ConformanceWindowMode=1 -wdt 768  -hgt 512  -f 1 -q 15 -fr 1
yuv_path_list = glob.glob(os.path.join(yuv_dir, '*.*'))
for yuv_path in yuv_path_list:
    yuv_name = os.path.basename(yuv_path)
    height = int(yuv_path.split('_')[-2])
    width = int(yuv_path.split('_')[-3])

    result_name = os.path.splitext(yuv_name)[0] + '_qp_' + str(qp)+'.txt'

    result_path = os.path.join(result_dir, result_name)
    # print result_path;exit()
    cmd = './bin/TAppEncoderStatic -c "%s" -i "%s" --InputChromaFormat=444 --ConformanceWindowMode=1 -wdt %d -hgt %d -f 1 -fr 1 -q %d >> "%s"' %(cfg_path, yuv_path, width, height, qp, result_path)
    os.system(cmd)
