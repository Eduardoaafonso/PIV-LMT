%
close all
clc
clear

addpath(genpath('mfiles'));

%DIR_IMAGES='tests/test1/';
%srcFiles  = dir([DIR_IMAGES,'*.png']);
%DIR_IMAGES='tests/test2/'
%srcFiles  = dir([DIR_IMAGES,'*.jpg']);
%DIR_IMAGES = '/media/eduardo/6A2EBBE72EBBAA89/IC-UFLA/PIV-LMT/cofre/mini3/gray/teste-300-430/';
DIR_IMAGES = '/media/eduardo/6A2EBBE72EBBAA89/IC-UFLA/PIV-LMT/tests/400-430/';
%DIR_IMAGES = '/home/eduardo/Projetos/ProjPiv/PIV-LMT/cofre/test6/';
srcFiles = dir([DIR_IMAGES,'*.jpg']);


img1=load_image_from_filename([DIR_IMAGES,srcFiles(1).name]);

%Setting
roi_params=select_roi_params_from_image(img1);

%Region of interesting
[ROI]=select_region(roi_params, img1);

search_params.StepSIZE=1; %observacao: se colocar o stepsize em funcao do tamanho do ROI



KK=1;
P{KK}=[roi_params.lin0 roi_params.col0 roi_params.d ];


WSIZEL0=roi_params.WSIZEL;
WSIZEC0=roi_params.WSIZEC;
area=zeros(1,length(srcFiles));

tic
for c = 1:length(srcFiles)
    filename = [DIR_IMAGES, srcFiles(c).name];
    img2=load_image_from_filename(filename);
    %size(img2)
    [match_params, AREA, LOST, WSIZEC_match, WSIZEL_match] = find_with_pearson(ROI,roi_params,search_params,img2); %pr = PCC maior
	  WSIZELF=sqrt(AREA*WSIZEL0/WSIZEC0);
	  WSIZECF=sqrt(AREA*WSIZEC0/WSIZEL0);
    fprintf('pearson:%d',match_params.pr);
    
    if LOST==1
      break;
    end
 
    MAIOR_ROI = plot_square(img2, match_params, c, DIR_IMAGES);
    AROI=(size(ROI,1)*size(ROI,2))
    area(c)=AREA;
    FATD = aprox(ROI, AREA)
    %roi_params.d : distancia  do ROI usado
    % d: distancia atual da regiao de analisis. imagen atual.
    d=sqrt(FATD)*roi_params.d %alterado de d=FATD*roi_params.d
    vc(c) = c-1;
    vd(c) = d;
    
    fator_total(c)=d;
    fator_total1(c)=roi_params.d;
    

	KK=KK+1;    
	P{KK}=[match_params.lin0_match match_params.col0_match  d];


    %ROI=new_roi(
    disp(num2str(c));
    
    [ROI roi_params]=new_roi( img2, ROI,roi_params,match_params);
    %points_pr.pr modificar para fazer sentido
    
    disp(' ');
end
toc

FmedioRoiParamsD = sum(fator_total)/length(srcFiles)
Fmediod = sum(fator_total1)/length(srcFiles)


arquivo = fopen('dados_teste1.dat','w');
fprintf(arquivo,'%f',fator_total);
save('dados_teste1.dat', 'FmedioRoiParamsD', 'Fmediod');
fclose(arquivo);


save('data_TEsteDarpa2.dat','vc','vd','img2','P','WSIZEL0','WSIZEC0','WSIZELF','WSIZECF','area');
rmpath(genpath('mfiles'));

plot_TesteDarpa2();


