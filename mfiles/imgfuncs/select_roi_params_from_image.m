% Esta funça carrega matriz (img1) e retorna números da img1 (WSIZEL, WSIZEC, LIN0 e COL0)
% recebe como parametros de entrada img1
% e retorna como saida roi_params
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT
function roi_params=select_roi_params_from_image(img1)
    figure;
    imagesc(img1);
    [col,lin]=ginput(2);
    col=sort(col);
    lin=sort(lin);
    
    roi_params.WSIZEL =floor(lin(2)- lin(1)); %window size
    roi_params.WSIZEC =floor(col(2)- col(1)); %window size
    roi_params.lin0=floor(lin(1));
    roi_params.col0=floor(col(1));
    roi_params.lin=floor(lin(2));
    roi_params.col=floor(col(2));
	rectangle('Position',[roi_params.col0, roi_params.lin0, roi_params.WSIZEC, roi_params.WSIZEL], 'LineWidth',3, 'EdgeColor','b');
	msgbox ("Points selected");
end
