close all;
clear all;

%function r=pearson(imagem1,imagem2,row,col)
%pngFiles = dir('D:\Base de dados KITTI\2011_09_26\2011_09_26_drive_0001_extract\image_02\data\*.png')
%pngFiles = dir('D:\Base de dados KITTI\2011_09_26_drive_0048\2011_09_26_drive_0048_extract\image_02\data\*.png');
srcFiles  = dir('D:\Prof arthur miranda\Testes\DARPA RaceDay\*.jpg');
for c = 1:length(srcFiles)
filename = strcat ('D:\Prof arthur miranda\Testes\DARPA RaceDay\', srcFiles (1).name);
filename1 = strcat ('D:\Prof arthur miranda\Testes\DARPA RaceDay\', srcFiles (c).name);

a = imread(filename);
b = imread(filename1);

I = rgb2gray(a);
K = rgb2gray(b);

I = double(I);
K = double(K);

mediaA = (mean2(I)).*ones(size(I));
mediaB = (mean2(K)).*ones(size(K));

aux1 = sum (sum((K-mediaB).*(I-mediaA)));
aux3 = sqrt(sum(sum((I-mediaA).^2)));
aux4 = sqrt(sum(sum((K-mediaB).^2)));

pearson = aux1/(aux3.*aux4);

%l(k) = pearson; % vetor referente à pasta ...\2011_09_26\2011_09_26_drive_0001_extract\image_02\data
%o(k) = pearson; % vetor referente à pasta ...\2011_09_26_drive_0048\2011_09_26_drive_0048_extract\image_02\data
y(c) = pearson;
x = 1:c;
end
figure
plot (x, y)
%return