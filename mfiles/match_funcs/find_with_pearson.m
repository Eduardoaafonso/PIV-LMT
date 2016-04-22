% Esta fun��o gera par�metros para a parte da imagem mais semelhante � regi�o de interesse
%
% inputs
% ROI = Regi�o de interesse;
% roi_params = 
% 	roi_params.WSIZEL
% 	roi_params.WSIZEC
% 	roi_params.lin0
% 	roi_params.col0
% 	roi_params.lin
% 	roi_params.col
%
% img2 = imagem 2;
%
% outputs: 
% match_params: par�metros encontrados que relaciona o antigo ROI com o novo ROI para gerar o tamanho do vetor;
% 	match_params.lin0 		= linha inicial do ROI antigo;
% 	match_params.col0 		= coluna inicial do ROI antigo;
% 	match_params.lin0_match = linha inicial do novo ROI;
% 	match_params.col0_match = coluna inicial do novo ROI;
% 	match_params.vector_lin = tamanho da linha do vector de avan�o;
% 	match_params.vector_col = tamanho da coluna do vector de avan�o;
% 	match_params.pr			= coeficiente de pearson relacionado ao novo ROI;
%
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT

function [match_params, AREA,LOST] = find_with_pearson(ROI,roi_params, search_params, img2)
	%setting parameters 

	[lin_match, col_match, pr, AREA, fator_match]= search_match (search_params.StepSIZE, img2, ROI,roi_params);

	% vector de avan�o
	match_params.lin0       = roi_params.lin0;
	match_params.col0       = roi_params.col0;
	match_params.lin0_match = lin_match;
	match_params.col0_match = col_match;
  match_params.fator = fator_match;
	match_params.vector_lin = match_params.lin0_match - match_params.lin0;
	match_params.vector_col = match_params.lin0_match - match_params.lin0;
	match_params.pr=pr;
  
  if pr < 0.75
    LOST=1;
  else
    LOST=0;
  end
end
