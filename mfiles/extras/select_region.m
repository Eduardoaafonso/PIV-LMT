function ROI=select_region(Img1,LINHA_INICIAL,COLUNA_INICIAL,WSIZE)

ROI = zeros(WSIZE,WSIZE);

ROI = Img1(LINHA_INICIAL+[1:WSIZE],COLUNA_INICIAL+[1:WSIZE]); %region of interesting image 1 (ROI)

ROI = double(ROI);

