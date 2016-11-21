function [imgpond] = ponderacao1 (img);

%img = imread ('/media/eduardo/6A2EBBE72EBBAA89/IC-UFLA/PIV-LMT/cofre/mini3/gray/teste-300-430/300.jpg');

H = size(img,1);
W = size(img,2);
%[X, Y] = meshgrid (0:(H-1), 0:(W-1));

X = [0:W-1];
Y = [0:H-1];

mediax = mean2(X);
mediay  = mean2(Y);

varx = std2(X);
vary = std2(Y);

normalx = exp(-abs(X-(mediax)).^2/(2*varx^2));
normalx = normalx/max(max(normalx));

normaly = exp(-abs(Y-(mediay)).^2/(2*vary^2));
normaly = normaly/max(max(normaly));

img = sqrt(normalx).*img;
imgpond = sqrt(normaly').*img;
%surf(normal);
%size(img)
%size(normal)
 
%imagesc(img)
