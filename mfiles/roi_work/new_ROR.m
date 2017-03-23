% Esta fun��o constr�i um novo ROR;

% inputs
% img2 = imagem 2;
% ROR = regiao de interesse; 
% match_params = par�metros da parte da imagem 2 com maior semelhan�a ao ROR;
% 	match_params.lin0 		= linha inicial do ROR antigo;
% 	match_params.col0 		= coluna inicial do ROR antigo;
% 	match_params.lin0_match = linha inicial do novo ROR;
% 	match_params.col0_match = coluna inicial do novo ROR;
% 	match_params.vector_lin = tamanho da linha do vector de avan�o;
% 	match_params.vector_col = tamanho da coluna do vector de avan�o;
% 	match_params.pr			= coeficiente de pearson relacionado ao novo ROR;
%
% outputs: 
% nROR_params = par�metros do novo ROR;
% 	nROR_params.WSIZEL
% 	nROR_params.WSIZEC
% 	nROR_params.lin0
% 	nROR_params.col0
% 	nROR_params.lin
% 	nROR_params.col
% NROR = nova regi�o de interesse;
%
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT

function [NROR nROR_params]=new_ROR( img2, ROR, ROR_params,match_params, fator_match)
  
	LINMAX=size(img2,1);
	COLMAX=size(img2,2);
  
	WSIZEL=size(ROR,1);
	WSIZEC=size(ROR,2);
  
  %match_params.lin0_match = match_params.lin0_match -floor(WSIZEL*1.5*fator);
  %match_params.col0_match = match_params.col0_match -floor(WSIZEC*1.5*fator);
  TROCAROR=false;
  
     if((match_params.lin0_match+floor(match_params.WSIZEL)-1)<LINMAX) && ((match_params.col0_match+floor(match_params.WSIZEC)-1)<COLMAX) && (match_params.pr <0.925) %%%%MUDANÇA ADICIONEI (WSIZEL*fator<LINMAX) && (WSIZEC*fator<COLMAX)
        TROCAROR=true;
     end
     
    AROR=WSIZEL*WSIZEC;
    AROR =match_params.WSIZEL*match_params.WSIZEC;
    
     if(sqrt(AROR/AROR)>1.3)
        TROCAROR=true;
     end
     if(sqrt(AROR/AROR)>1.3)
        TROCAROR=true;
     end      
     
     if(TROCAROR==true)     
        NROR = img2(    match_params.lin0_match+[0:floor(match_params.WSIZEL)-1] , ...
                        match_params.col0_match+[0:floor(match_params.WSIZEC)-1] ); % new region of interesting image 1 (NROR)
        
        %MUDANÇA de WSIZEL+fator para floor(WSIZEL*fator)-1
        %Adicionei o fator como parametro
        
        NROR = double(NROR); %alteracao feita para que o codigo funcione com reducao de imagem.

    	nROR_params.WSIZEL =match_params.WSIZEL; %window size
    	nROR_params.WSIZEC =match_params.WSIZEC; %window size
    	nROR_params.lin0=match_params.lin0_match;
    	nROR_params.col0=match_params.col0_match;
        nROR_params.d=ROR_params.d/match_params.fator;
    	nROR_params.lin =match_params.lin0_match+floor(match_params.WSIZEL)-1;
    	nROR_params.col =match_params.col0_match+floor(match_params.WSIZEC)-1;
        figure;
        imagesc(NROR)
		    refresh
        disp('>>>>>>>>>>>>>>>>Muda ROR<<<<<<<<<<<<<<<<<<')
    else
        NROR=ROR;
		    nROR_params=ROR_params;
        disp('Conserva ROR')
    end
 end
