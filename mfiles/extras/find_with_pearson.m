% Descrever parâmetros input e output;
% input: 
% ROI = DESCREVER O QUE É!
% roi_params = 
% img1
% img2
% ouput:
% roi2_params:
% match_params: 
% recebe como parametros de entrada ROI,roi_params, img1, img2
% e retorna como saida roi2_params, match_params
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT
function [match_params] = find_with_pearson(ROI,roi_params, search_params, img1, img2)
%setting parameters 
px = 0; %xcorr2


[lin_match, col_match, pr]= search_match (search_params.StepSIZE, img2, ROI,roi_params);


% vector de avanço
match_params.lin0       = roi_params.lin0;
match_params.col0       = roi_params.col0;
match_params.lin0_match = lin_match;
match_params.col0_match = col_match;
match_params.vector_lin = match_params.lin0_match - match_params.lin0;
match_params.vector_col = match_params.lin0_match - match_params.lin0;
match_params.pr=pr;
end
