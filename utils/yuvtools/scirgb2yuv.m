% function scirgb2yuv(rgb_dir, yuv_dir, ext)
% add variable ( rgb_dir ext yuv_dir)
addpath('yuvtools')
% rgb_dir='';
% yuv_dir='';
if ~isdir(yuv_dir)
    mkdir(yuv_dir)
end

filename=dir(strcat(rgb_dir, '/*', ext));
% dirname='sci_png'
for i=1:numel(filename)
    rgb=imread(sprintf(strcat(rgb_dir, '/',filename(i).name)));
    [height,width,d]=size(rgb);
    [pathstr, name, ext] = fileparts(filename(i).name);

    % [Y,U,V] = yuv_import(filename,dims,frs,i-1);
    YY={};
    UU={};
    VV={};
    [Y,U,V]=rgb2yuv(rgb(:,:,1),rgb(:,:,2),rgb(:,:,3));
    YY{1} = Y;UU{1} = U;VV{1} = V;
    yuvfilename=sprintf('%s/%s_%d_%d_444.yuv',yuv_dir, name,width,height);
    yuv_export(YY,UU,VV,yuvfilename,1,'w')
    
    % rgb=yuv2rgb(Y,U,V,'YUV444_8');
    % imwrite(rgb,sprintf('%s\\%s.png',dirname,name));
end
% end

%%TODO
%1-RGB/YUV bat process
%2-SCI encoding bat genSCIBatFile
%3-run encoding bat file
%4-YUV/RGB convert