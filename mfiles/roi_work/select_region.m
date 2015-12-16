%
% Esta função constroi a região de interesse selecionada 
%
% inputs
% roi_params = 
% Parâmetros do ROI 
% 	roi_params.WSIZEL
% 	roi_params.WSIZEC
% 	roi_params.lin0
% 	roi_params.col0
% 	roi_params.lin
% 	roi_params.col
%
% img1= imagem 1; 

% outputs
% ROI =  ROI construído, utilizando os parâmetros do ROI(roi_params);
%
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT

function ROI=select_region(roi_params, img1)

	ROI = zeros(roi_params.WSIZEL,roi_params.WSIZEC);

	ROI = img1(roi_params.lin0+[0:roi_params.WSIZEL-1],roi_params.col0+[0:roi_params.WSIZEC-1]); %region of interesting image 1 (ROI)
end
