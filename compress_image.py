import os, glob, shutil
import sys
import argparse
import cv2

parser = argparse.ArgumentParser()
parser.add_argument('--input_dir', type=str, required=True)
parser.add_argument('--output_dir', type=str, required=True)
parser.add_argument('--quality', type=int, default=None)
parser.add_argument('--ratio', type=int, default=None)
# parser.add_argument('--phase', type=str, required=True, help='encode or decode')
parser.add_argument('--codec', type=str, required=True, help='jpeg, jpeg2000, webp...')

args = parser.parse_args()

input_dir = args.input_dir
output_dir = args.output_dir
quality = args.quality
ratio = args.ratio
codec = args.codec

print "Processing", input_dir
# tmp_dir = './tmp'
if not os.path.isdir(output_dir):
    os.makedirs(output_dir)
# if not os.path.isdir(tmp_dir):
#     os.makedirs(tmp_dir)

if codec=='jpeg':
    if quality is None:
        print "param quality required."
        exit()
    post_fix = 'jpeg'
    ## encode phase
    image_path_list = glob.glob(os.path.join(input_dir, '*.*'))
    ori_extension = '.'+image_path_list[0].split('.')[-1]

    # ori_image = 
    for image_path in image_path_list:
        image_name = os.path.basename(image_path)
        output_path = os.path.join(output_dir, os.path.splitext(image_name)[0]+'_quality_'+str(quality)+'.'+post_fix)
        if os.path.isfile(output_path):
            print output_path, 'exists, pass...'
            continue
        ori_image = cv2.imread(image_path)
        encode_param = [int(cv2.IMWRITE_JPEG_QUALITY), quality]
        # result, encimg = cv2.imencode('.jpeg', ori_image, encode_param)
        ## save image
        cv2.imwrite(output_path, ori_image, encode_param)

        ## do metric
if codec=='jpeg2000':
    if ratio is None:
        print "param ratio required."
        exit()

    stream_format = '.jp2'
    # encode_cmd = 'opj_compress -ImgDir %s -OutFor %s '

    ## encode phase
    image_path_list = glob.glob(os.path.join(input_dir, '*.*'))
    ori_extension = '.'+image_path_list[0].split('.')[-1]
    for image_path in image_path_list:
        image_name = os.path.basename(image_path)
        
        stream_path = os.path.join(output_dir, os.path.splitext(image_name)[0]+'_ratio_'+str(ratio)+stream_format)
        if os.path.isfile(stream_path):
            # print stream_path, 'exists, pass...'
            continue
        print stream_path
        cmd = 'opj_compress -i "%s" -o "%s" -r %d' % (image_path, stream_path, ratio)
        os.system(cmd)
    
    ## decode phase
    # stream_path_list = glob.glob(os.path.join(tmp_dir, '*.*'))
    # for stream_path in stream_path_list:
    #     image_name = os.path.basename(stream_path)
        
    #     output_path = os.path.join(output_dir, image_name.split('.')[0]+ori_extension)
    #     cmd = 'opj_decompress -i %s -o %s' % (stream_path, output_path)
    #     os.system(cmd)


if codec=='webp':
    post_fix = 'webp'
    if quality is None:
        print "param quality required"
        exit()

    ## encode phase
    image_path_list = glob.glob(os.path.join(input_dir, '*.*'))
    ori_extension = '.'+image_path_list[0].split('.')[-1]

    # ori_image = 
    for image_path in image_path_list:
        image_name = os.path.basename(image_path)
        ori_image = cv2.imread(image_path)
        encode_param = [int(cv2.IMWRITE_WEBP_QUALITY ), quality]
        # result, encimg = cv2.imencode('.jpeg', ori_image, encode_param)
        ## save image
        output_path = os.path.join(output_dir, os.path.splitext(image_name)[0]+'_quality_'+str(quality)+'.'+post_fix)
        cv2.imwrite(output_path, ori_image, encode_param)
        
        ## decode image
        # decimg = cv2.imdecode(encimg)

        ## do metric
        