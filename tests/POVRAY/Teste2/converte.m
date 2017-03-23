
addpath(genpath('mfiles'));

DIR_IMAGES = '/media/eduardo/6A2EBBE72EBBAA89/IC-UFLA/PIV-LMT/tests/POVRAY/Teste2/';
srcFiles = dir([DIR_IMAGES,'*.png'])
n=1;
resol = 340;

for c = length(srcFiles):-1:1
    filename = [DIR_IMAGES, srcFiles(c).name];
    
    img2=imread(filename);

    img2 = rgb2gray(img2);
 
    filename = [ num2str(n),'.png'];
    n=n+1;
    
    img3=imresize(img2,[size(img2,1)*resol/size(img2,2), resol]);
    
    imwrite(img3,['gray',filesep,filename]);
  end