% Esta fun�oa carrega a imagem 1 e gera uma imagem 1 em tons de cinzas e em double;
%
% input
% img1 = imagem 1
%
% output
% img1 = imagem 1 modificada.
%
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT
function img1=load_image_from_filename(filename)
    img1=imread(filename);
    %img1 = rgb2gray(img1);
    %img1 = double(img1);
end
