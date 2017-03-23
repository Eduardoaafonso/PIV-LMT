%
% Esta fun��o constROR a regi�o de interesse selecionada 
%
% inputs
% ROR_params = 
% Par�metros do ROR 
% 	ROR_params.WSIZEL
% 	ROR_params.WSIZEC
% 	ROR_params.lin0
% 	ROR_params.col0
% 	ROR_params.lin
% 	ROR_params.col
%
% img1= imagem 1; 

% outputs
% ROR =  ROR constru�do, utilizando os par�metros do ROR(ROR_params);
%
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT

function ROR=select_region(ROR_params, img1)

	ROR = zeros(ROR_params.WSIZEL,ROR_params.WSIZEC);

	ROR = img1(ROR_params.lin0+[0:ROR_params.WSIZEL-1],ROR_params.col0+[0:ROR_params.WSIZEC-1]); %region of interesting image 1 (ROR)
end
