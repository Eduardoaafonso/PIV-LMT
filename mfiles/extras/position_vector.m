function [vx1, vy1, pr]= position_vector (lin_steps, col_steps, WSIZE, StepSIZE, img2, ROI)
pr = 0; % inicial pearson
 for c=0:col_steps;
            for d=0:lin_steps;
                L=0;
                for k=1:WSIZE
                for l=1:WSIZE
                L(l, k) = img2(l + d*StepSIZE, k + c*StepSIZE); %piece of image 2 (WSIZExWSIZE)
                end
                end
                [pcc]=get_pcc(ROI,L);
                
                if pcc >= pr %the biggest value of PCC
                    pr = pcc;
                    vx1 =d*StepSIZE; %axis x of vector
                    vy1 =c*StepSIZE; %axis y of vector
                end
            end
 end
end