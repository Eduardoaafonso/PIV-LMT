% Esta fun�a carrega n�meros (img1,lin0,col0,wsize) e retorna um ret�ngulo no ROI
% recebe como parametros de entrada img1,lin0,col0,wsize
% e retorna como saida h
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT

function  h=show_roi(img1,lin0,col0,wsize)

rectangle('Position',[col0,lin0,wsize,wsize], 'LineWidth',3, 'EdgeColor','b');

figure;
imagesc(img1(lin0+[0:(wsize-1)],col0+[0:(wsize-1)]));
end