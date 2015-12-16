% Esta funcao modifica o tamanho de duas imagem;
%
% inputs
% img1 = imagem 1;
% img2 = imagem 2;
% reduction = taxa pela qual quer reduzir a imagem(aproximadamente)
%
% outputs:
% pcc1 = coeficiente de pearson entre as imagens com tamanho normal;
% pcc2 = coeficiente de pearson entre as imagens reduzidas;
% I = imagem 1 reduzida;
% J = imagem 2 reduzida;
%
% Desenvolvedor: Eduardo Afonso
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT

function img2= resize48_image (img1)%FILENAME) 

    %img1=imread(FILENAME);
    WSIZEC=size(img1,2);
    max_value = WSIZEC;
      
    %a taxa de reducao
    reduction = (max_value/48); 

    img2 = imresize(img1, 1/reduction);
end