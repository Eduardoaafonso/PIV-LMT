% Esta funça carrega a matrizes (img2, ROI) e números(roi2_params e match_params) e retorna uma matriz (ROI)
% se o PCC for menor que 0,85. 
% recebe como paramettros de entrada img2, roi2_params, ROI, match_params
% e retorna como saida ROI (atualizado)
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT
function [NROI roi2_params]=new_roi( img2, ROI, roi_params,match_params)

	WSIZEL=size(ROI,1);
	WSIZEC=size(ROI,2);

    if match_params.pr <0.85
        NROI = img2(    match_params.lin0_match+[0:WSIZEL-1], ...
                        match_params.col0_match+[0:WSIZEC-1]); % new region of interesting image 1 (NROI)

        NROI = double(NROI);

    	roi2_params.WSIZEL =WSIZEL; %window size
    	roi2_params.WSIZEC =WSIZEC; %window size
    	roi2_params.lin0=match_params.lin0_match;
    	roi2_params.col0=match_params.col0_match;
    	roi2_params.lin =match_params.lin0_match+WSIZEL;
    	roi2_params.col =match_params.col0_match+WSIZEC;
        figure;
        imagesc(NROI)
		refresh 
        disp('Muda roi')
    else
        NROI=ROI;
		roi2_params=roi_params;
        disp('Conserva roi')
    end
end
