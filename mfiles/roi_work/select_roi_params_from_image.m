%
% Esta fun��o gera par�metros da regi�o de interesse (ROI); 
%
% input
% img1 = imagem1 
%
% outputs
% Par�metros do ROI (regi�o de interesse):
% roi_params = 
% 	roi_params.WSIZEL= quantidade de linhas;
% 	roi_params.WSIZEC= quantidade de colunas;
% 	roi_params.lin0=linha inicial;
% 	roi_params.col0=coluna inicial;
% 	roi_params.lin= linha final;
% 	roi_params.col= coluna final;
% 
%
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT
function roi_params=select_roi_params_from_image(img1)
    figure;
    imagesc(img1);
    [col,lin]=ginput(2)
    col=sort(col);
    lin=sort(lin);
    
    roi_params.WSIZEL =floor(lin(2)- lin(1)); %window size
    roi_params.WSIZEC =floor(col(2)- col(1)); %window size
    roi_params.lin0=floor(lin(1));
    roi_params.col0=floor(col(1));
    roi_params.lin=floor(lin(2));
    roi_params.col=floor(col(2));
    roi_params.d=1.0;
	rectangle('Position',[roi_params.col0, roi_params.lin0, roi_params.WSIZEC, roi_params.WSIZEL], 'LineWidth',3, 'EdgeColor','r');
  refresh();
	msgbox ("Points selected");
end
