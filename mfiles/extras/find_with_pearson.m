function [lin0, col0, point_lin, point_col, pr] = find_with_pearson(ROI, img1, img2)
%setting parameters 
px = 0; %xcorr2

%ROI
WSIZE = 35; %window size
col0=143;
lin0=15;
StepSIZE=4;

[lin_steps,col_steps]=number_of_steps(img1,WSIZE, StepSIZE);

[vx1, vy1, pr]= position_vector (lin_steps, col_steps, WSIZE, StepSIZE, img2, ROI);

%figure;
%imagesc(img2)
%hold on
%plot_vector(lin0,col0, vx1-lin0,vy1-col0);
%hold off

%coordenadas do vector que será plotado
point_lin = vx1-lin0;
point_col = vy1-col0;

end