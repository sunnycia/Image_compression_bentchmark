% delete(gcp)
% matlabpool 4
clear;
clc;

metric_name = 'ssim';
ori_datfol = 'KODAK_PNG';
datset ='KODAK';
codec = 'jpeg';

save_path = fullfile('./metric_data', strcat(datset,'_',codec,'_',metric_name,'.mat'))


oridat_dir = fullfile('/data/sunnycia/image_compression_challenge/dataset', ori_datfol)
cps_img_base = '/data/sunnycia/image_compression_challenge/compressed_set/';
cps_img_base = fullfile(cps_img_base, datset, codec)

sub_folder = dir(cps_img_base);
name_list = natsort({sub_folder.name});
x=[10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

if exist(save_path) ~= 2
    avg_ssim_list = [];
    max_ssim_list = [];
    min_ssim_list = [];
    std_ssim_list = [];
    for i=3:length(name_list)
        sub_dir = fullfile(cps_img_base, name_list(i))
        % compute ssmi for two folder
        [avg_ssim, max_ssim, min_ssim, std_ssim] = average_ssim(oridat_dir, char(sub_dir));

        avg_ssim_list = [avg_ssim_list avg_ssim];
        max_ssim_list = [max_ssim_list max_ssim];
        min_ssim_list = [min_ssim_list min_ssim];
        std_ssim_list = [std_ssim_list std_ssim];
    end

    save(save_path, 'x', 'avg_ssim_list', 'max_ssim_list', 'min_ssim_list', 'std_ssim_list');
else
    load(save_path);
end


errorbar(x,avg_ssim_list,std_ssim_list,'-s','MarkerSize',2,...
    'MarkerEdgeColor','red','MarkerFaceColor','red')
axis([0,100, 0, 50])
ylabel(strcat(datset, ' ', codec, ' ', metric_name))
xlabel('Quality')

% [avg_, max_, min_, std_] = avg_ssim()

%% Check if there is precomputed metric value