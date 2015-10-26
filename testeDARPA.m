%
E=imread('DARPA RaceDay/014.jpg');
F=imread('DARPA RaceDay/018.jpg');
%setting parameters 
pr = 0; % inicial pearson
ws = 30; %window size
px = 0; %xcorr2
vx=0; %axis x of vector
vy=0; %axis y of vector
I = rgb2gray(E);
J = rgb2gray(F);

I = double(I);
J = double(J);

for b=1:ws
for a=1:ws
    K(a, b) = I(a + 40, b + 150); %region of interesting image 1 (ROI)
    K = double(K);
end
end
nx = size(J,1); %size of axis x and y
ny = size(J,2);

%calculating how many times will be done the loop
if rem(nx,ws)~0;
x1 = floor (nx/ws)-1;
else 
x1 = (nx/ws)-2;
end
if rem (ny,ws)~0;
y1 = floor(ny/ws)-1;
else
y1 = (ny/ws)-2;
end
        for c=0:y1;
            for d=0:x1;
                for k=1:ws
                for l=1:ws
                L(l, k) = J(l + d*ws, k + c*ws); %piece of image 2 (wsxws)
                L = double (L);
                end
                end
                mediaA = (mean2(K)).*ones(size(K));
                mediaB = (mean2(L)).*ones(size(L));
                aux1 = sum (sum((L-mediaB).*(K-mediaA))); %PCC
                aux3 = sqrt(sum(sum((K-mediaA).^2)));
                aux4 = sqrt(sum(sum((L-mediaB).^2)));
                pearson = aux1/(aux3.*aux4);
                if pearson >= pr %the biggest value of PCC
                    pr = pearson;
                    vx1 = l + d*ws; %axis x of vector
                    vy1 = k + c*ws; %axis y of vector
                end
            end
        end
        
                for c=0:y1;
                for d=0:x1;
                for k=1:ws
                for l=1:ws
                L(l, k) = J(l + d*ws, k + c*ws); %piece of image 2 (ws x ws)
                L = double (L);
                end
                end
                xc = xcorr2 (J,K); %cross-correlation 2D
                if xc >= px
                    px = xc;
                    vx = l + d*ws; %axis x of vector
                    vy = k + c*ws; %axis y fo vector
                end
            end
        end
        
imagesc(J)
hold on
quiver(vy-ws, vx-ws, ws, ws,'k','maxheadsize',5,'linewidth',2)
quiver(vy1-ws, vx1-ws, ws, ws,'k','maxheadsize',5,'linewidth',2)
hold off
colormap gray
