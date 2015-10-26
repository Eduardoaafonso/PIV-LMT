   %Objetivo: Utilizando VISION.ALPHABLENDER para misturar duas imagens e traças os
   %vetores;
   %A FAZER: Isolar somente a região de movimento da imagem para análise!
   img1 = im2double(rgb2gray(imread('D:\IC - UFLA\Testes\DARPA RaceDay\440.jpg')));
   img2 = im2double(rgb2gray(imread('D:\IC - UFLA\Testes\DARPA RaceDay\460.jpg')));
   
   %Bordas do objeto em movimento
   %[img2] = find (1);
   %BW1 = edge(img1,'prewitt');
   %imshow(BW1)
    
   halphablend = vision.AlphaBlender;
   img12 = step(halphablend, img2, img1);

   [X Y] = meshgrid(1:35:size(img1, 2), 1:35:size(img1, 1));
   imshow(img12); 
   hold on;
   quiver(X(:), Y(:), real(motion(:)), imag(motion(:)), 0); 
   hold off;