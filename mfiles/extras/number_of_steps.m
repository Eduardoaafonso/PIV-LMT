function [lin_steps,col_steps]=number_of_steps(img1,WSIZE, StepSIZE)

%calculating how many times will be done the loop
%retorn vx1,vy1

%[lin_steps,col_steps]=number_of_steps(img2,WSIZE);
lin_steps=floor((size(img1,1)-WSIZE)/StepSIZE-2);
col_steps=floor((size(img1,2)-WSIZE)/StepSIZE-2);
end
