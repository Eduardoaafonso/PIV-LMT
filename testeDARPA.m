% Exemplo1
addpath('mfiles');

E=imread('D:\IC-UFLA\Testes\DARPA RaceDay/014.jpg');
F=imread('D:\IC-UFLA\Testes\DARPA RaceDay/018.jpg');
%setting parameters 
pr = 0; % inicial pearson
WSIZE = 30; %window size
px = 0; %xcorr2
vx=0; %axis x of vector
vy=0; %axis y of vector

Img1 = rgb2gray(E);
Img2 = rgb2gray(F);

Img2 = double(Img2);



LINHA_INICIAL =40;
COLUNA_INICIAL=150;

ROI=select_region(Img1,LINHA_INICIAL,COLUNA_INICIAL,WSIZE);

[x1,y1]=number_of_steps(Img2,WSIZE);


for c=0:y1;
for d=0:x1;

	L=select_region(Img2,d*WSIZE,c*WSIZE,WSIZE);

	pearson = get_pcc(ROI,L); %% Get the Pearson's Correlation Coefficient

	if pearson >= pr %the biggest value of PCC
		pr = pearson;
		vx1 = l + d*WSIZE; %axis x of vector
		vy1 = k + c*WSIZE; %axis y of vector
	end
end
end
        
for c=0:y1;
for d=0:x1;

	L=select_region(Img2,d*WSIZE,c*WSIZE,WSIZE);
        
	xc = xcorr2 (Img2,ROI); %cross-correlation 2D

	if xc >= px
		px = xc;
		vx = l + d*WSIZE; %axis x of vector
		vy = k + c*WSIZE; %axis y fo vector
	end
end
end
        
imagesc(Img2)
hold on
quiver(vy-WSIZE, vx-WSIZE, WSIZE, WSIZE,'k','maxheadsize',5,'linewidth',2)
quiver(vy1-WSIZE, vx1-WSIZE, WSIZE, WSIZE,'k','maxheadsize',5,'linewidth',2)
hold off
colormap gray
