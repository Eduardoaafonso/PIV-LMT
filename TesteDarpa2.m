%
addpath(genpath('mfiles'));

img1=imread('DARPA RaceDay/019.jpg');
img1 = rgb2gray(img1);
img1 = double(img1);

%Settings
WSIZE = 35; %window size
col0=143;
lin0=15;

%Region of interesting
[ROI]=select_region(img1,lin0,col0,WSIZE);
%show_roi(img1,lin0,col0,WSIZE);

srcFiles  = dir(['DARPA RaceDay',filesep,'*.jpg']);

for c = 20:80 %length(srcFiles)
	filename = ['DARPA RaceDay',filesep, srcFiles(c).name ];
	rawimage2 = imread (filename);
	img2 = rgb2gray(rawimage2);
	img2 = double(img2);

	[point_lin0, point_col0, point_lin, point_col, pr] = find_with_pearson(ROI, img1, img2); %pr = PCC maior

	[NROI]=new_roi(WSIZE, img2, point_lin0, point_col0, pr, ROI);
end

figure;
imagesc(img2)
hold on
plot_vector(lin0,col0, point_lin,point_col);
hold off
