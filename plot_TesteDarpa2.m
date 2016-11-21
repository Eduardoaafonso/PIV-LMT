%
function h=plot_TesteDarpa2()
	DATA=load('data_TEsteDarpa2.dat');

	graph = plot(DATA.vc,DATA.vd);
	grid;
	hx=xlabel('Analyzed frame');
	hy=ylabel('Departure factor');
	ylim([0.5 1.2]);

	FONTSIZE=20;
	hf = gcf();%% current figure
	ha = gca();%% current axis object. 
	set(ha,'fontsize',FONTSIZE);%% cambia solamente los ejes
	%set(ht,'fontsize',FONTSIZE);%% cambia solamente el titulo
	set(hx,'fontsize',FONTSIZE);%% cambia solamente el texto de x
	set(hy,'fontsize',FONTSIZE);%% cambia solamente el texto de y
	print (hf ,'graph.eps','-deps','-tight',['-F:',int2str(FONTSIZE)]);


	graph = plot(DATA.vc(2:length(DATA.vc)),diff(DATA.vd));
	grid;
	hx=xlabel('Analyzed frame');
	hy=ylabel('Velocity of departure factor');
	%ylim([0.5 1.2]);

	FONTSIZE=20;
	hf = gcf();%% current figure
	ha = gca();%% current axis object. 
	set(ha,'fontsize',FONTSIZE);%% cambia solamente los ejes
	%set(ht,'fontsize',FONTSIZE);%% cambia solamente el titulo
	set(hx,'fontsize',FONTSIZE);%% cambia solamente el texto de x
	set(hy,'fontsize',FONTSIZE);%% cambia solamente el texto de y
	print (hf ,'graphv.eps','-deps','-tight',['-F:',int2str(FONTSIZE)]);



	figure;
	imshow(DATA.img2)
	hold on
	plot_vector(DATA);

	hold off
	print (gcf ,'graph2.eps','-depsc','-tight');
	h=0;
end

function h=plot_vector(DATA) 

	N=length(DATA.P);

	lin0=((DATA.P{1}(1,1))+DATA.WSIZEL0/2); %ADICIONADO DATA.WSIZEL0/2
	col0=((DATA.P{1}(1,2))+DATA.WSIZEC0/2);
	delta_lin=DATA.P{N}(1,1)+DATA.WSIZELF/2-lin0; %Adicionado +DATA.WSIZEL0/2
	delta_col=DATA.P{N}(1,2)+DATA.WSIZECF/2-col0;

	for II=1:N
		scatter(DATA.P{II}(1,2),DATA.P{II}(1,1));
	end

	rectangle('Position',[DATA.P{1}(2),DATA.P{1}(1), DATA.WSIZEC0, DATA.WSIZEL0], 'LineWidth',3, 'EdgeColor','r');
	rectangle('Position',[DATA.P{N}(2),DATA.P{N}(1), DATA.WSIZECF, DATA.WSIZELF], 'LineWidth',3, 'EdgeColor','r');
  
	quiver(col0, lin0,delta_col , delta_lin,'k','maxheadsize',0.1,'linewidth',5,'AutoScale','off','color','blue') %Plot of pcc test
    
end
