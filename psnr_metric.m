% clear;
% clc;

metric_name = 'psnr';
ori_datfol = 'KODAK_PNG';
datset ='KODAK';

% ori_datfol = 'CLIC/pro_train';
% datset ='CLIC_PRO';

codec = 'jpeg';

save_path = fullfile('./metric_data', strcat(datset,'_',codec,'_',metric_name,'.mat'))


oridat_dir = fullfile('/data/sunnycia/image_compression_challenge/dataset', ori_datfol)
cps_img_base = '/data/sunnycia/image_compression_challenge/compressed_set/';
cps_img_base = fullfile(cps_img_base, datset, codec)

sub_folder = dir(cps_img_base);
name_list = natsort({sub_folder.name});
x=[10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

if exist(save_path) ~= 2
    avg_psnr_list = [];
    max_psnr_list = [];
    min_psnr_list = [];
    std_psnr_list = [];
    for i=3:length(name_list)
        sub_dir = fullfile(cps_img_base, name_list(i))
        % compute psnr for two folder
        [avg_psnr, max_psnr, min_psnr, std_psnr] = average_psnr(oridat_dir, char(sub_dir));

        avg_psnr_list = [avg_psnr_list avg_psnr];
        max_psnr_list = [max_psnr_list max_psnr];
        min_psnr_list = [min_psnr_list min_psnr];
        std_psnr_list = [std_psnr_list std_psnr];
    end

    save(save_path, 'x', 'avg_psnr_list', 'max_psnr_list', 'min_psnr_list', 'std_psnr_list');
else
    load(save_path);
end


errorbar(x,avg_psnr_list,std_psnr_list,'-s','MarkerSize',3,'MarkerEdgeColor','red','MarkerFaceColor','red')
axis([0,100, 0, 50])
ylabel(strcat(datset, ' ', codec, ' ', metric_name))
xlabel('Quality')

% [avg_, max_, min_, std_] = avg_psnr()

%% Check if there is precomputed metric value