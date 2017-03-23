%
% Esta fun��o gera par�metros da regi�o de interesse (ROR); 
%
% input
% img1 = imagem1 
%
% outputs
% Par�metros do ROR (regi�o de interesse):
% ROR_params = 
% 	ROR_params.WSIZEL= quantidade de linhas;
% 	ROR_params.WSIZEC= quantidade de colunas;
% 	ROR_params.lin0=linha inicial;
% 	ROR_params.col0=coluna inicial;
% 	ROR_params.lin= linha final;
% 	ROR_params.col= coluna final;
% 
%
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT
function ROR_params=select_ROR_params_from_image(img1)
    figure;
    imagesc(img1);
    [col,lin]=ginput(2)
    col=sort(col);
    lin=sort(lin);
    
    ROR_params.WSIZEL =floor(lin(2)- lin(1)); %window size
    ROR_params.WSIZEC =floor(col(2)- col(1)); %window size
    ROR_params.lin0=floor(lin(1));
    ROR_params.col0=floor(col(1));
    ROR_params.lin=floor(lin(2));
    ROR_params.col=floor(col(2));
    ROR_params.d=1.0;
	rectangle('Position',[ROR_params.col0, ROR_params.lin0, ROR_params.WSIZEC, ROR_params.WSIZEL], 'LineWidth',3, 'EdgeColor','r');
  refresh();
	msgbox ("Points selected");
end
