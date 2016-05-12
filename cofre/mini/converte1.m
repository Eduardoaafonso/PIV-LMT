

for c = 0:10 %length(srcFiles)
    if c>=10
      filename = ['00000000',num2str(c),'.png'];
    else
    filename = ['000000000',num2str(c),'.png'];
    end
    img2=imread(filename);
    %img2 = rgb2gray(img2);
    
    img3=imresize(img2,[64,size(img2,2)*64/size(img2,1)]);
    
    imwrite(img3,['gray',filesep,filename]);
  end