%
D = [1 1 1 1 1 0.948818082919852 0.948818082919852 0.948818082919852 0.9345794392523364 0.9345794392523364 0.889897623494436 0.8414980995094927 0.831772373845084 0.7961028173126276 0.7961028173126276 0.7529087573001881 0.7529087573001881 0.7182694827083022 0.6854652927635529 0.6515784540488859 0.6250945774760277 0.5962528092405807 0.5962528092405807 0.5739433014490868 0.5336537099741283 0.5142010312710467 0.4947207726332165 0.481436207346245 0.4419198983800649 0.4046451535474518 0.3924766778092623 0.3641096998809433 0.3363697167808266 0.3115011196251084 0.2925297963997829 0.2677571947705807 0.2416836539206449 0.2179699929147216 0.1985018741423696 0.1718579322302972];
E = [1:40];
R=linspace(23.5,4,40);

p = polyfit(E,D,4);
Dfit=polyval(p,E);
    figure(1)
	graph = plot(E, D,'-o', E, Dfit,'-.');
	grid;
	hx=xlabel('Analyzed frame');
	hy=ylabel('Departure factor');
	ylim([0 1.2]);
    legend('departure factor','Polynomial fitting')

  
	FONTSIZE=20;
	hf = gcf();%% current figure
	ha = gca();%% current axis object. 
	set(ha,'fontsize',FONTSIZE);%% cambia solamente los ejes
	%set(ht,'fontsize',FONTSIZE);%% cambia solamente el titulo
	set(hx,'fontsize',FONTSIZE);%% cambia solamente el texto de x
	set(hy,'fontsize',FONTSIZE);%% cambia solamente el texto de y

	print (hf ,'grapha_b.eps','-deps','-tight',['-F:',int2str(FONTSIZE)]);
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DERIVADA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  V(1) = 0;
  V(2) = 0;
  for n=3:38
    V(n) = (-D(n+2)+8.*D(n+1)-8.*D(n-1)+D(n-2))/12;
  end
  V(39) = (-D(40)+8.*D(40)-8.*D(38)+D(37))/12;
  V(40) = (-D(40)+8.*D(40)-8.*D(39)+D(38))/12;
  

  Vfit=[Dfit 0]-[0 Dfit];
  Vfit=Vfit(2:(end-1));
  Vfit=[Vfit(1) Vfit];

  figure(2);
  graph = plot (E, V,'-o', E, Vfit,'-.');
  grid;
  hx=xlabel('Analyzed frame');
	hy=ylabel('Velocity of Departure factor');
	ylim([-0.06 0.01]);
    legend('Velocity of departure factor','Velocity of polynomial fitting')
  
  
	FONTSIZE=20;
	hf2 = gcf();%% current figure
	ha = gca();%% current axis object. 
	set(ha,'fontsize',FONTSIZE);%% cambia solamente los ejes
	%set(ht,'fontsize',FONTSIZE);%% cambia solamente el titulo
	set(hx,'fontsize',FONTSIZE);%% cambia solamente el texto de x
	set(hy,'fontsize',FONTSIZE);%% cambia solamente el texto de y
	print (hf2 ,'graphvelocity.eps','-deps','-tight',['-F:',int2str(FONTSIZE)]);
  
