import os, glob
import csv
import plotly.plotly as py
import plotly.graph_objs as go

import argparse
parser = argparse.ArgumentParser()
parser.add_argument('--dataset', type=str, required=True)
parser.add_argument('--ref_image_dir', type=str, required=True)
parser.add_argument('--metric_dir', type=str, default='./')
parser.add_argument('--metric_name', type=str, default='psnr')
parser.add_argument('--output_dir', type=str, default='metric_data')
args = parser.parse_args()

psnr_index=5
ssim_index=6
if args.metric_name=='psnr':
    index = psnr_index

dataset=args.dataset
ref_image_dir = args.ref_image_dir
metric_dir= args.metric_dir
output_dir=args.output_dir
if not os.path.isdir(output_dir):
    os.makedirs(output_dir)

metric_path_list = glob.glob(os.path.join(metric_dir, dataset+'*.csv'))
refimg_path_list = glob.glob(os.path.join(ref_image_dir, '*.*'))


for refimg_path in refimg_path_list:
    refimg_name = os.path.basename(refimg_path)
    refimg_prefix = os.path.splitext(refimg_path)

    print refimg_name
    # ref_dict={}
    data = []

    for metric_path in metric_path_list:
        print metric_path
        codec = os.path.basename(metric_path).split('_')[-1].split('.')[0]
        csv_reader=csv.reader(open(metric_path, 'r'))
        bitrate_list = []
        metric_list = []
        for row in csv_reader:
            if refimg_name in row:
                bitrate_list.append(int(row[4]))
                metric_list.append(float(row[5]))

        bitrate_list.sort()
        metric_list.sort()
        trace = go.Scatter(
            x=bitrate_list, 
            y=metric_list, 
            mode='lines+markers',
            name=codec
            )
        data.append(trace)

    layout=go.Layout(
        title=refimg_name, width=800, height=640, 
        xaxis = dict(
            nticks = 10,
            title = "Bitrate(kb)"),
        yaxis = dict(
            range=[0, 200], 
            title = args.metric_name
        ),
        )
    fig=go.Figure(data=data, layout=layout)
    output_path = os.path.join(output_dir, refimg_name)
    py.image.save_as(fig, filename=output_path)
    # exit()