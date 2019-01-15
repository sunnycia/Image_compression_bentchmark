function [avg_psnr, max_psnr, min_psnr, std_psnr] = average_psnr(ori_fol, cps_fol)
    ori_img_list = dir(ori_fol);
    cps_img_list = dir(cps_fol);
    
    psnr_array = [];
    for i=3:length(ori_img_list)
        ori_img_name = ori_img_list(i).name;
        cps_img_name = cps_img_list(i).name;

        ori_img_path = fullfile(ori_fol, ori_img_name);
        cps_img_path=  fullfile(cps_fol, cps_img_name);

        ori_img = imread(ori_img_path);
        cps_img = imread(cps_img_path);

        [peaksnr, snr]=psnr(ori_img, cps_img);
        psnr_array = [psnr_array, peaksnr];
        % return
    end

    avg_psnr = mean(psnr_array);
    max_psnr = max(psnr_array);
    min_psnr = min(psnr_array);
    std_psnr = std(psnr_array);

    % return avg_psnr, max_psnr, min_psnr, std_psnr