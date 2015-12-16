% Esta função constrói um novo roi;

% inputs
% img2 = imagem 2;
% ROI = regiao de interesse; 
% match_params = parâmetros da parte da imagem 2 com maior semelhança ao ROI;
% 	match_params.lin0 		= linha inicial do ROI antigo;
% 	match_params.col0 		= coluna inicial do ROI antigo;
% 	match_params.lin0_match = linha inicial do novo ROI;
% 	match_params.col0_match = coluna inicial do novo ROI;
% 	match_params.vector_lin = tamanho da linha do vector de avanço;
% 	match_params.vector_col = tamanho da coluna do vector de avanço;
% 	match_params.pr			= coeficiente de pearson relacionado ao novo ROI;
%
% outputs: 
% roi2_params = parâmetros do novo ROI;
% 	roi2_params.WSIZEL
% 	roi2_params.WSIZEC
% 	roi2_params.lin0
% 	roi2_params.col0
% 	roi2_params.lin
% 	roi2_params.col
% NROI = nova região de interesse;
%
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
