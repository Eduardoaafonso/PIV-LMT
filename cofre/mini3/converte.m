
addpath(genpath('mfiles'));

DIR_IMAGES = '/media/eduardo/6A2EBBE72EBBAA89/IC-UFLA/PIV-LMT/cofre/mini3/';
srcFiles = dir([DIR_IMAGES,'*.jpg']);

for c = 1:length(srcFiles)
    filename = [DIR_IMAGES, srcFiles(c).name];
    img2=imread(filename);

    img2 = rgb2gray(img2);
 
    filename = [ num2str(c),'.jpg'];
    
    img3=imresize(img2,[64,size(img2,2)*64/size(img2,1)]);
    
    imwrite(img3,['gray1',filesep,filename]);
  end