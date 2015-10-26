function  h=show_roi(img1,lin0,col0,wsize)

rectangle('Position',[col0,lin0,wsize,wsize], 'LineWidth',3, 'EdgeColor','b');

figure;
imagesc(img1(lin0+[0:(wsize-1)],col0+[0:(wsize-1)]));
end