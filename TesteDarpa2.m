%
close all
clc
clear

addpath(genpath('mfiles'));

%DIR_IMAGES='tests/test1/';
%srcFiles  = dir([DIR_IMAGES,'*.png']);
%DIR_IMAGES='tests/test2/'
%srcFiles  = dir([DIR_IMAGES,'*.jpg']);
%DIR_IMAGES = '/media/eduardo/6A2EBBE72EBBAA89/IC-UFLA/PIV-LMT/tests/64xResolution/300-430/';
%DIR_IMAGES = '/media/eduardo/6A2EBBE72EBBAA89/IC-UFLA/PIV-LMT/tests/64xResolution/400-430/';
%DIR_IMAGES = '/media/eduardo/6A2EBBE72EBBAA89/IC-UFLA/PIV-LMT/tests/64xResolution/1-430/';
%DIR_IMAGES = '/media/eduardo/6A2EBBE72EBBAA89/IC-UFLA/PIV-LMT/tests/128xResolution/300-430';
%DIR_IMAGES = '/media/eduardo/6A2EBBE72EBBAA89/IC-UFLA/PIV-LMT/tests/128xResolution/1-430';
DIR_IMAGES = '/media/eduardo/6A2EBBE72EBBAA89/IC-UFLA/PIV-LMT/tests/POVRAY/Teste2/aprox';

srcFiles{1}=0;
JJ=1;
for II=30:41
  srcFiles{JJ} = sprintf(fullfile(DIR_IMAGES,[num2str(II),'.png']));
  JJ=JJ+1;
end

img1=load_image_from_filename(srcFiles{1});

%Setting
ROR_params=select_ROR_params_from_image(img1);

%Region of interesting
[ROR]=select_region(ROR_params, img1);

search_params.StepSIZE=1; %observacao: se colocar o stepsize em funcao do tamanho do ROR



KK=1;
P{KK}=[ROR_params.lin0 ROR_params.col0 ROR_params.d ];


WSIZEL0=ROR_params.WSIZEL;
WSIZEC0=ROR_params.WSIZEC;
area=zeros(1,length(srcFiles));
d=1; %Set of distance
fator_total =d;
fator_total1 =d;
vc=1;
vd=1;

tic
for c = 1:length(srcFiles)
    filename = srcFiles{c};
    img2=load_image_from_filename(filename);
    %size(img2)
    [match_params, AREA, LOST, WSIZEC_match, WSIZEL_match] = find_with_pearson(ROR,ROR_params,search_params,img2); %pr = PCC maior
	  WSIZELF=sqrt(AREA*WSIZEL0/WSIZEC0);
	  WSIZECF=sqrt(AREA*WSIZEC0/WSIZEL0);
    fprintf('pearson:%d',match_params.pr);
    
    if LOST==1
      break;
    end
 
    MAIOR_ROR = plot_square(img2, match_params, c, DIR_IMAGES);
    AROR=(size(ROR,1)*size(ROR,2)) %Area do ROR
    area(c)=AREA; %Area do ROR com maior pearson encontrado
    FATD = aprox(ROR, AREA)
    %ROR_params.d : distancia  do ROR usado
    % d: distancia atual da regiao de analisis. imagen atual.
    d=sqrt(FATD)*ROR_params.d %alterado de d=FATD*ROR_params.d
    vc(c) = c-1;
    vd(c) = d; %vetor de proporcao de distancia
    
    fator_total(c)=d;
    fator_total1(c)=ROR_params.d;
    

	KK=KK+1;    
	P{KK}=[match_params.lin0_match match_params.col0_match  d];


    %ROR=new_ROR(
    disp(num2str(c));
    
    [ROR ROR_params]=new_ROR( img2, ROR,ROR_params,match_params);
    %points_pr.pr modificar para fazer sentido
    
    disp(' ');
end
toc

FmedioRORParamsD = sum(fator_total)/length(srcFiles)
Fmediod = sum(fator_total1)/length(srcFiles)


arquivo = fopen('dados_teste1.dat','w');
fprintf(arquivo,'%f',fator_total);
save('dados_teste1.dat', 'FmedioRORParamsD', 'Fmediod');
fclose(arquivo);


save('data_TEsteDarpa2.dat','vc','vd','img2','P','WSIZEL0','WSIZEC0','WSIZELF','WSIZECF','area');
rmpath(genpath('mfiles'));

plot_TesteDarpa2();


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ROR=Regiao de Referencia (era chamada de ROI)
%ROI = Regiao de interesse 