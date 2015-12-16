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

function h=plot_vector(lin0,col0,delta_lin,delta_col)
	quiver(col0, lin0,delta_col , delta_lin,'k','maxheadsize',4,'linewidth',2,'AutoScale','off') %Plot of pcc test
end
