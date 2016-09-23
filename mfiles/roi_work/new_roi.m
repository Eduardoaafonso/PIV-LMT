% Esta fun��o constr�i um novo roi;

% inputs
% img2 = imagem 2;
% ROI = regiao de interesse; 
% match_params = par�metros da parte da imagem 2 com maior semelhan�a ao ROI;
% 	match_params.lin0 		= linha inicial do ROI antigo;
% 	match_params.col0 		= coluna inicial do ROI antigo;
% 	match_params.lin0_match = linha inicial do novo ROI;
% 	match_params.col0_match = coluna inicial do novo ROI;
% 	match_params.vector_lin = tamanho da linha do vector de avan�o;
% 	match_params.vector_col = tamanho da coluna do vector de avan�o;
% 	match_params.pr			= coeficiente de pearson relacionado ao novo ROI;
%
% outputs: 
% nroi_params = par�metros do novo ROI;
% 	nroi_params.WSIZEL
% 	nroi_params.WSIZEC
% 	nroi_params.lin0
% 	nroi_params.col0
% 	nroi_params.lin
% 	nroi_params.col
% NROI = nova regi�o de interesse;
%
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT

function [NROI nroi_params]=new_roi( img2, ROI, roi_params,match_params, fator_match)
  
	LINMAX=size(img2,1);
	COLMAX=size(img2,2);
  
	WSIZEL=size(ROI,1);
	WSIZEC=size(ROI,2);
  
  %match_params.lin0_match = match_params.lin0_match -floor(WSIZEL*1.5*fator);
  %match_params.col0_match = match_params.col0_match -floor(WSIZEC*1.5*fator);
  
     if((match_params.lin0_match+floor(match_params.WSIZEL)-1)<LINMAX) && ((match_params.col0_match+floor(match_params.WSIZEC)-1)<COLMAX) && (match_params.pr <0.925) %%%%MUDANÇA ADICIONEI (WSIZEL*fator<LINMAX) && (WSIZEC*fator<COLMAX)
        NROI = img2(    match_params.lin0_match+[0:floor(match_params.WSIZEL)-1] , ...
                        match_params.col0_match+[0:floor(match_params.WSIZEC)-1] ); % new region of interesting image 1 (NROI)
        
        %MUDANÇA de WSIZEL+fator para floor(WSIZEL*fator)-1
        %Adicionei o fator como parametro
        
        NROI = double(NROI); %alteracao feita para que o codigo funcione com reducao de imagem.

    	nroi_params.WSIZEL =match_params.WSIZEL; %window size
    	nroi_params.WSIZEC =match_params.WSIZEC; %window size
    	nroi_params.lin0=match_params.lin0_match;
    	nroi_params.col0=match_params.col0_match;
        nroi_params.d=roi_params.d/match_params.fator;
    	nroi_params.lin =match_params.lin0_match+floor(match_params.WSIZEL)-1;
    	nroi_params.col =match_params.col0_match+floor(match_params.WSIZEC)-1;
        figure;
        imagesc(NROI)
		    refresh
        disp('>>>>>>>>>>>>>>>>Muda roi<<<<<<<<<<<<<<<<<<')
    else
        NROI=ROI;
		    nroi_params=roi_params;
        disp('Conserva roi')
    end
 end
