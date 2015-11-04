
% Esta funça carrega uma matriz (img1) e números (roi_params e StepSIZE) e
% retorna números (lin_steps e col_steps).
% recebe como parametros de entrada img1,roi_params, StepSIZE
% e retorna como saida lin_steps,col_steps
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT
function [lin_steps,col_steps]=number_of_steps(img1,roi_params, StepSIZE)

    lin_steps=floor((size(img1,1)-roi_params.WSIZEL)/StepSIZE); 
    %MODIFICAÇÃO: tirei o -2 da conta para que percorra o mais próximo da borda possível!
    
    col_steps=floor((size(img1,2)-roi_params.WSIZEC)/StepSIZE);
end
