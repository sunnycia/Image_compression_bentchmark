#!/bin/bash

DSNAME=$1
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/jpeg2000" --ratio=64 --codec="jpeg2000"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/jpeg2000" --ratio=36 --codec="jpeg2000"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/jpeg2000" --ratio=23 --codec="jpeg2000"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/jpeg2000" --ratio=18 --codec="jpeg2000"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/jpeg2000" --ratio=15 --codec="jpeg2000"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/jpeg2000" --ratio=13 --codec="jpeg2000"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/jpeg2000" --ratio=12 --codec="jpeg2000"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/jpeg2000" --ratio=10 --codec="jpeg2000"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/jpeg2000" --ratio=8 --codec="jpeg2000"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/jpeg2000" --ratio=5 --codec="jpeg2000"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/jpeg2000" --ratio=2 --codec="jpeg2000"
