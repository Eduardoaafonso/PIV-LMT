% Esta fun��o gera par�metros para a parte da imagem mais semelhante � regi�o de interesse
%
% inputs
% ROR = Regi�o de interesse;
% ROR_params = 
% 	ROR_params.WSIZEL
% 	ROR_params.WSIZEC
% 	ROR_params.lin0
% 	ROR_params.col0
% 	ROR_params.lin
% 	ROR_params.col
%
% img2 = imagem 2;
%
% outputs: 
% match_params: par�metros encontrados que relaciona o antigo ROR com o novo ROR para gerar o tamanho do vetor;
% 	match_params.lin0 		= linha inicial do ROR antigo;
% 	match_params.col0 		= coluna inicial do ROR antigo;
% 	match_params.lin0_match = linha inicial do novo ROR;
% 	match_params.col0_match = coluna inicial do novo ROR;
% 	match_params.vector_lin = tamanho da linha do vector de avan�o;
% 	match_params.vector_col = tamanho da coluna do vector de avan�o;
% 	match_params.pr			= coeficiente de pearson relacionado ao novo ROR;
%
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT

function [match_params, AREA,LOST, WSIZEC_match, WSIZEL_match] = find_with_pearson(ROR,ROR_params, search_params, img2)
	%setting parameters 

	[lin_match, col_match, pr, AREA, fator_match, WSIZEC_match, WSIZEL_match]= search_match (search_params.StepSIZE, img2, ROR,ROR_params);

	% vector de avan�o
	match_params.lin0       = ROR_params.lin0;
	match_params.col0       = ROR_params.col0;
	match_params.lin0_match = lin_match;
	match_params.col0_match = col_match;
	match_params.fator = fator_match;
	match_params.vector_lin = match_params.lin0_match - match_params.lin0;
	match_params.vector_col = match_params.col0_match - match_params.col0;
	match_params.pr=pr;
  match_params.WSIZEC = WSIZEC_match;
  match_params.WSIZEL = WSIZEL_match;

  
  WSIZEC_match
  WSIZEL_match
  fator_match
  
  if pr < 0.3 %0.75
    LOST=1;
  else
    LOST=0;
  end
end
