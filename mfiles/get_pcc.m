%
% Esta fun�a carrega:
% ROR = regi�o de interesse;
% Regiao = tamanho compartimentado da imagem2, usado para compara��o;
%
% Retorna:
% pcc = a compara��o entre o ROR e o peda�o da imagem2 analisada.
%
% recebe como parametros de entrada ROR,Regiao
% e retorna como saida pcc
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT
function pcc=get_pcc(ROR,Regiao);

mediaA = (mean2(ROR)).*ones(size(ROR));
mediaB = (mean2(Regiao)).*ones(size(Regiao));

aux1 = sum (sum((Regiao-mediaB).*(ROR-mediaA))); %PCC
aux3 = sqrt(sum(sum((ROR-mediaA).^2)));
aux4 = sqrt(sum(sum((Regiao-mediaB).^2)));

  if aux3==0
    aux3=1;
  end
  if aux4==0
    aux4=1;
  end
pcc = aux1/(aux3.*aux4);
