pngFiles = dir('D:\Base de dados KITTI\2011_09_26\2011_09_26_drive_0001_extract\image_00\data\*.png');
%pngFiles = dir('D:\Base de dados KITTI\2011_09_26_drive_0048\2011_09_26_drive_0048_extract\image_00\data\*.png');
for k = 1:1:length(pngFiles)-1
filename = pngFiles(1).name;
filename1 = pngFiles(k).name;
a = imread(filename);
b = imread(filename1);
a = double(a);
b = double(b);
mediaA = (mean2(a)).*ones(size(a));
mediaB = (mean2(b)).*ones(size(b));
aux1 = sum (sum((b-mediaB).*(a-mediaA)));
aux3 = sqrt(sum(sum((b-mediaA).^2)));
aux4 = sqrt(sum(sum((b-mediaB).^2)));
pearson = aux1/(aux3.*aux4);

z(k) = pearson;
%c(k) = pearson;
d = 1:k;
end
figure
plot (d, z)

