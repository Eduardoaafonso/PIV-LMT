%
function h=plot_TesteDarpa2()
	DATA=load('data_TEsteDarpa2.dat');

	graph = plot(DATA.vc,DATA.vd);
	ylim([0 1.3]);
	saveas (gcf ,'graph.eps');

	figure;
	imagesc(DATA.img2)
	hold on
	plot_vector(DATA.P);
	hold off
	saveas (gcf ,'graph2.png');
	h=0;
end

function h=plot_vector(P) 

	N=length(P)

	lin0=P{1}(1,1);
	col0=P{1}(1,2);
	delta_lin=P{N}(1,1)-P{1}(1,1);
	delta_col=P{N}(1,2)-P{1}(1,2);

	for II=1:N
		scatter(P{II}(1,2),P{II}(1,1));
	end
  
	quiver(col0, lin0,delta_col , delta_lin,'k','maxheadsize',0.1,'linewidth',5,'AutoScale','off') %Plot of pcc test
    
end
