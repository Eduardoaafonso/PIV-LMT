jpgFiles = dir('D:\Prof arthur miranda\Testes\DARPA RaceDay\*.jpg');
filename = jpgFiles(1).name;
for k = 1:1:length(jpgFiles)-1
filename1 = jpgFiles(k).name;
I = imread(filename);
K = imread(filename1);
%X = rgb2gray(a);
%Y = rgb2gray(b);

X=imread(filename);
figure(1);
image(X);
colormap(gray);

Y=imread(filename1);
figure(2);
image(Y);
colormap(gray);

X=double(X);
Y=double(Y);

% Define regiao de comparaçao 
if ~exist('row', 'var') row=[1:min(size(X,1),size(Y,1))]; end
if ~exist('col', 'var') col=[1:min(size(X,2),size(Y,2))]; end

X=X(row,col);
Y=Y(row,col);

% Calcula as medias das imagens e gera matrizes com estes valores medios
Xm=mean(mean(X)).*ones(size(X));
Ym=mean(mean(Y)).*ones(size(Y));

% Calcula o coeficiente de Pearson
num=sum(sum((X-Xm).*(Y-Ym)));
den1=sqrt(sum(sum((X-Xm).^2)));
den2=sqrt(sum(sum((Y-Ym).^2)));
den=den1.*den2;
r=num/den;

y(k) = r;
x = 1:k;
end
figure
plot (x, y)
return