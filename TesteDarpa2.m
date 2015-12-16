%
addpath(genpath('mfiles'));

img1=load_image_from_filename('Mini/0000000000.png');

%Setting
roi_params=select_roi_params_from_image(img1);

%Region of interesting
%figure;
%imagesc(img1);
[ROI]=select_region(roi_params, img1);
%show_roi(img1,lin0,col0,WSIZE);

search_params.StepSIZE=4;

srcFiles  = dir('Mini/*.png');

P{1}=[roi_params.lin0 roi_params.col0];
KK=2;

tic
for c = 1:8 %length(srcFiles)
    filename = ['Mini/', srcFiles(c).name];
    img2=load_image_from_filename(filename);
    %size(img2)
    match_params = find_with_pearson(ROI,roi_params,search_params,  img2); %pr = PCC maior

	P{KK}=[match_params.lin0_match match_params.col0_match];
	KK=KK+1;

    %ROI=new_roi(
    disp(num2str(c));
    
    [ROI roi_params]=new_roi( img2, ROI,roi_params,match_params);
    %points_pr.pr modificar para fazer sentido

end
toc

figure;
imagesc(img2)
hold on
plot_vector(    P{1}(1,1), ... % linha
                P{1}(1,2), ... % coluna
                P{KK-1}(1,1)-P{1}(1,1),...%roi2_params.point_lin-roi_params.lin0, ...  % vetor linha
                P{KK-1}(1,2)-P{1}(1,2));%roi2_params.point_col-roi_params.col0);     % vetor coluna
hold off
