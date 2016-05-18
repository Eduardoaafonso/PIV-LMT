%
close all
clc
clear

addpath(genpath('mfiles'));

%img1=load_image_from_filename('Mini/0000000000.png');
img1=load_image_from_filename('tests/test1/0000000000.png');


%Setting
roi_params=select_roi_params_from_image(img1);

%Region of interesting
%figure;
%imagesc(img1);
[ROI]=select_region(roi_params, img1);
%show_roi(img1,lin0,col0,WSIZE);

search_params.StepSIZE=1; %observacao: se colocar o stepsize em funcao do tamanho do ROI

%srcFiles  = dir('Mini/*.png');
srcFiles  = dir('tests/test1/*.png');


P{1}=[roi_params.lin0 roi_params.col0 roi_params.d ];
KK=2;

tic
for c = 1:8 %length(srcFiles)
    filename = ['tests/test1/', srcFiles(c).name];
    img2=load_image_from_filename(filename);
    %size(img2)
    [match_params, AREA, LOST] = find_with_pearson(ROI,roi_params,search_params,img2); %pr = PCC maior
    
    pearson=match_params.pr
    
    if LOST==1
      break;
    end
    
    AROI=(size(ROI,1)*size(ROI,2))
    AREA
    FATD = aprox(ROI, AREA)
    d=FATD*roi_params.d %alterado de d=FATD*roi_params.d
    vc(c) = c;
    vd(c) = d;
    
	P{KK}=[match_params.lin0_match match_params.col0_match  d];
	KK=KK+1;

    %ROI=new_roi(
    disp(num2str(c));
    
    [ROI roi_params]=new_roi( img2, ROI,roi_params,match_params);
    %points_pr.pr modificar para fazer sentido
    
    disp(' ');
end
toc


save('data_TEsteDarpa2.dat','vc','vd');

plot_TesteDarpa2

rmpath(genpath('mfiles'));
