%
% Esta funça carrega:
% ROI = região de interesse;
% Regiao = tamanho compartimentado da imagem2, usado para comparação;
%
% Retorna:
% pcc = a comparação entre o ROI e o pedaço da imagem2 analisada.
%
% recebe como parametros de entrada ROI,Regiao
% e retorna como saida pcc
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT
function pcc=get_pcc(ROI,Regiao);

mediaA = (mean2(ROI)).*ones(size(ROI));
mediaB = (mean2(Regiao)).*ones(size(Regiao));

aux1 = sum (sum((Regiao-mediaB).*(ROI-mediaA))); %PCC
aux3 = sqrt(sum(sum((ROI-mediaA).^2)));
aux4 = sqrt(sum(sum((Regiao-mediaB).^2)));
pcc = aux1/(aux3.*aux4);
