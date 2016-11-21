function TEMPROI=resizeminus(ROI,TEMPROI)

  TEMPROI = imresize(TEMPROI, size(ROI));
    
  end