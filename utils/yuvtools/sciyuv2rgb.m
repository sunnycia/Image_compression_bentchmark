function sciyuv2rgb
addpath('yuvtools')
[SeqName,width,height]=textread('seqinfoSCI.txt','%s %d %d');
dirname='sci_bmp';
scidirname='D:\\wangx\\SCI\\rec';
QPVecSCC = [47:1:51];        
if ~isdir(dirname)
    mkdir(dirname)
end
for i=1:numel(SeqName)
    for j=1:numel(QPVecSCC)
        filename=sprintf('%s\\%s_scc_qp%d.yuv',scidirname,SeqName{i},QPVecSCC(j));
        dims=[width(i),height(i)];
        [Y,U,V]=yuv_import(filename,dims,1,0,'YUV444_8');
        rgb=yuv2rgb(Y{1},U{1},V{1},'YUV444_8');
        imwrite(rgb,sprintf('%s\\%s_scc_qp%d.bmp',dirname,SeqName{i},QPVecSCC(j)));
    end
end
end

% function sciyuv2rgb
% addpath('yuvtools')
% [SeqName,width,height]=textread('seqinfoSCI.txt','%s %d %d');
% dirname='sci_bmp';
% scidirname='sci_yuv'
% % QPVecSCC = [17:1:46];        
% % if ~isdir(dirname)
% %     mkdir(dirname)
% % end
% for i=1:numel(SeqName)
% %     for j=1%:numel(QPVecSCC)
%         filename=sprintf('%s\\%s.yuv',scidirname,SeqName{i});
%         dims=[width(i),height(i)];
%         [Y,U,V]=yuv_import(filename,dims,1,0,'YUV444_8');
%         rgb=yuv2rgb(Y{1},U{1},V{1},'YUV444_8');
%         imwrite(rgb,sprintf('%s\\%s.bmp',dirname,SeqName{i}));
% %     end
% end
% end
