addpath(genpath('mfiles'));
img1=imread('DARPA RaceDay/019.jpg');
img2=imread('DARPA RaceDay/030-1.jpg');

%setting parameters 
px = 0; %xcorr2

%ROI
%% 
WSIZE = 35; %window size
col0=143;
lin0=15;
StepSIZE=1;

img1 = rgb2gray(img1);
img2 = rgb2gray(img2);

img1 = double(img1);
img2 = double(img2);

%Region of interesting
%figure;
%imagesc(img1);
[ROI]=select_region(img1,lin0,col0,WSIZE);
%show_roi(img1,lin0,col0,WSIZE);

[lin_steps,col_steps]=number_of_steps(img1,WSIZE, StepSIZE);

[vx1, vy1]= position_vector (lin_steps, col_steps, WSIZE, StepSIZE, img2, ROI);

figure;
imagesc(img2)
hold on
plot_vector(lin0,col0, vx1-lin0,vy1-col0);
hold off
