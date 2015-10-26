function [NROI]=new_roi(WSIZE, img2, point_lin0, point_col0, pr, ROI)

NROI = zeros(WSIZE,WSIZE);

if pr <0.85

NROI = img2(point_lin0+[1:WSIZE],point_col0+[1:WSIZE]); % new region of interesting image 1 (NROI)

NROI = double(NROI);
figure;
imagesc(NROI)
end

ROI = NROI;
end