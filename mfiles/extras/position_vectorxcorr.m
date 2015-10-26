function [vx, vy]= position_vectorxcorr(col_steps, lin_steps)
calculating how many times will be done the loop
%retorn vx,vy        
      for c=0:col_steps;
           for d=0:lin_steps;
               for k=1:WSIZE
                for l=1:WSIZE
                L(l, k) = img2(l + d*StepSIZE, k + c*StepSIZE); %piece of image 2 (ws x ws)
                L = double (L);
                end
               end
                xc = xcorr2 (img2,ROI); %cross-correlation 2D
                if xc >= px
                    px = xc;
                    vx = d*StepSIZE; %axis x of vector
                    vy = c*StepSIZE; %axis y fo vector
                end
            end
       end
end