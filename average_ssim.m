function [avg_ssim, max_ssim, min_ssim, std_ssim] = average_ssim(ori_fol, cps_fol)
    ori_img_list = dir(ori_fol);
    cps_img_list = dir(cps_fol);
    
    ssim_array = [];
    for i=3:length(ori_img_list)
        ori_img_name = ori_img_list(i).name;
        cps_img_name = cps_img_list(i).name;
        fprintf('Processing %s\n', ori_img_name);

        ori_img_path = fullfile(ori_fol, ori_img_name);
        cps_img_path=  fullfile(cps_fol, cps_img_name);

        ori_img = imread(ori_img_path);
        cps_img = imread(cps_img_path);

        s_sim=ssim(ori_img, cps_img);
        ssim_array = [ssim_array, s_sim];
        % return
    end

    avg_ssim = mean(ssim_array);
    max_ssim = max(ssim_array);
    min_ssim = min(ssim_array);
    std_ssim = std(ssim_array);

    % return avg_ssim, max_ssim, min_ssim, std_ssim