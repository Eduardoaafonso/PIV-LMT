
addpath(genpath('mfiles'));

DIR_IMAGES = '/home/eduardo/Projetos/ProjPiv/PIV-LMT/tests/POVRAY/2D/';
srcFiles = dir([DIR_IMAGES,'*.png'])

for c = 1:length(srcFiles)
    filename = [DIR_IMAGES, srcFiles(c).name];
    img2=imread(filename);

    img2 = rgb2gray(img2);
 
    filename = [ num2str(c),'.png'];
    
    img3=imresize(img2,[128, size(img2,2)*128/size(img2,1)]);
    
    imwrite(img3,['gray1',filesep,filename]);
  end