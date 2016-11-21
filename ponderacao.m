function [imgpond] = ponderacao (img);

%img = imread ('/media/eduardo/6A2EBBE72EBBAA89/IC-UFLA/PIV-LMT/cofre/mini3/gray/teste-300-430/300.jpg');

H = size(img,1);
W = size(img,2);
[X, Y] = meshgrid (0:(H-1), 0:(W-1));
N=3;
sigmax=H/3;
sigmay=W/3;

normal = exp(   -abs(X-(H/2)).^N/sigmax^N  -abs(Y-(W/2)).^N/sigmay^N  );
normal=normal/max(max(normal));

%surf(normal);
%size(img)
%size(normal)

imgpond=img.*(sqrt(normal)');
