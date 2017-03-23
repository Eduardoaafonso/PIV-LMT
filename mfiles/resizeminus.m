function TEMPROR=resizeminus(ROR,TEMPROR)

  TEMPROR = imresize(TEMPROR, size(ROR));
    
  end