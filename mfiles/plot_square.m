function  MAIOR_ROI = plot_square(img2, match_params, c, DIR_IMAGES)

   imagesc(img2);
   rectangle('Position',[match_params.col0_match, match_params.lin0_match,...
   match_params.WSIZEC, match_params.WSIZEL], 'LineWidth',3, 'EdgeColor','r');

        
  baseFileName = sprintf('figure_%d.jpg',c); % Specify some particular, specific folder:
  fullFileName = fullfile(DIR_IMAGES, baseFileName);  
  saveas(gca, fullFileName, 'jpeg')
  refresh();

end