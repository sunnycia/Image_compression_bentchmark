#!/bin/bash

CODEC=webp
DSNAME=$1
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME/" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/$CODEC" --quality=100 --codec="$CODEC"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME/" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/$CODEC" --quality=90 --codec="$CODEC"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME/" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/$CODEC" --quality=80 --codec="$CODEC"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME/" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/$CODEC" --quality=70 --codec="$CODEC"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME/" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/$CODEC" --quality=60 --codec="$CODEC"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME/" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/$CODEC" --quality=50 --codec="$CODEC"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME/" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/$CODEC" --quality=40 --codec="$CODEC"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME/" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/$CODEC" --quality=30 --codec="$CODEC"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME/" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/$CODEC" --quality=20 --codec="$CODEC"
python compress_image.py --input_dir="/data/sunnycia/image_compression_challenge/dataset/$DSNAME/" --output_dir="/data/sunnycia/image_compression_challenge/compressed_set/$DSNAME/$CODEC" --quality=10 --codec="$CODEC"
