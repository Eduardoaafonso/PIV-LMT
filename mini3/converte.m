

for c = 100:455 %length(srcFiles)
    filename = [ num2str(c),'.jpg'];
    img2=imread(filename);
    img2 = rgb2gray(img2);
    
    img3=imresize(img2,[64,size(img2,2)*64/size(img2,1)]);
    
    imwrite(img3,['gray',filesep,filename]);
  end