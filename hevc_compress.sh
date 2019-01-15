#!/bin/bash

YUV=$1
OUT=$2

python hevc_compress.py --yuv_dir="$YUV" --result_dir="$OUT" --qp=5
python hevc_compress.py --yuv_dir="$YUV" --result_dir="$OUT" --qp=10
python hevc_compress.py --yuv_dir="$YUV" --result_dir="$OUT" --qp=15
python hevc_compress.py --yuv_dir="$YUV" --result_dir="$OUT" --qp=20
python hevc_compress.py --yuv_dir="$YUV" --result_dir="$OUT" --qp=25
python hevc_compress.py --yuv_dir="$YUV" --result_dir="$OUT" --qp=30
python hevc_compress.py --yuv_dir="$YUV" --result_dir="$OUT" --qp=35
python hevc_compress.py --yuv_dir="$YUV" --result_dir="$OUT" --qp=40
python hevc_compress.py --yuv_dir="$YUV" --result_dir="$OUT" --qp=45
python hevc_compress.py --yuv_dir="$YUV" --result_dir="$OUT" --qp=50
