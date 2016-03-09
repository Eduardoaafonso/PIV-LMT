% Esta fun�a carrega n�meros (lin0,col0,delta_lin,delta_col) e retorna um
% vetor plotado (quiver).
%
% Usada tamb�m para inverter a rela��o de coluna e linha do quiver
% recebe como parametros de entrada lin0,col0,delta_lin,delta_col
% e retorna como saida h.
% 
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT

function h=plot_vector(P) 

N=length(P)

lin0=P{1}(1,1);
col0=P{1}(1,2);
delta_lin=P{N}(1,1)-P{1}(1,1);
delta_col=P{N}(1,2)-P{1}(1,2);

  for II=1:N
    scatter(P{II}(1,2),P{II}(1,1));
  end
  
	quiver(col0, lin0,delta_col , delta_lin,'k','maxheadsize',0.2,'linewidth',2,'AutoScale','off') %Plot of pcc test
    
end
