% Esta funça carrega uma matriz (img1) e retorna a matriz em double e tons de
% cinza.
% recebe como parametros de entrada filename
% e retorna como saida img1
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT
function img1=load_image_from_filename(filename)
    img1=imread(filename);
    %img1 = rgb2gray(img1);
    img1 = double(img1);
end