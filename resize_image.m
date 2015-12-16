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

function [pcc_normal, pcc_reduced, I, J]= resize_image (img1, img2, reduction) 

addpath(genpath('mfiles'));

img1=imread('Mini/0000000000.png');
img2=imread('Mini/0000000001.png');

%seleciona qual e maior entre a coluna e a linha para calcular o reduction

    WSIZEC=size(img2,2);
      max_value = WSIZEC;
      
 %a taxa de reducao
 reduction = (max_value/32); 

II = imresize(img1, 1/reduction);
JJ = imresize(img2, 1/reduction);

pcc_normal = get_pcc(img1, img2)
pcc_reduced = get_pcc(II, JJ)

size(II)
figure;
imagesc(img1)
figure;
imagesc(II)
hold on
