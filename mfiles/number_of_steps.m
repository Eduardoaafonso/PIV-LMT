function [lin_steps,col_steps]=number_of_steps(Img2,WSIZE)

nx = size(Img2,1); %size of axis x and y
ny = size(Img2,2);

%calculating how many times will be done the loop
if rem(nx,WSIZE)~0;
lin_steps = floor (nx/WSIZE)-1;
else 
lin_steps = (nx/WSIZE)-2;
end


if rem (ny,WSIZE)~0;
col_steps = floor(ny/WSIZE)-1;
else
col_steps = (ny/WSIZE)-2;
end
