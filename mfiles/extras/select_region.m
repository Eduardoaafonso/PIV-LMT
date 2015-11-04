
% Esta funça carrega  matrizes(ROI e img1) e retorna matriz (ROI).
% recebe como parametros de entrada roi_params, img1
% e retorna como saida ROI
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT
function ROI=select_region(roi_params, img1)

ROI = zeros(roi_params.WSIZEL,roi_params.WSIZEC);

ROI = img1(roi_params.lin0+[0:roi_params.WSIZEL-1],roi_params.col0+[0:roi_params.WSIZEC-1]); %region of interesting image 1 (ROI)

