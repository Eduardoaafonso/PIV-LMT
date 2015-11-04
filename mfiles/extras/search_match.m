% Esta funça carrega números (lin_steps, col_steps,  StepSIZE) e matrizes
% (img2, ROI) e retorna números (lin_match, col_match, pr)
% recebe como parametros de entrada lin_steps, col_steps,  StepSIZE, img2, ROI
% e retorna como saida lin_match, col_match, pr
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT

function [lin_match, col_match, pr]= search_match ( StepSIZE, img2, ROI,roi_params) 
    pr = 0; % inicial pearson
    
	

    WSIZEL=size(ROI,1);
    WSIZEC=size(ROI,2);

	LINMAX=size(img2,1);
	COLMAX=size(img2,2);

	LengthSearch=floor(WSIZEL*1.5);

	
	l0=roi_params.lin0-LengthSearch;
	if l0<1
		l0=1;
	end
	c0=roi_params.col0-LengthSearch;
	if c0<1
		c0=1;
	end

	lf=roi_params.lin0+LengthSearch;
	if lf>(LINMAX-WSIZEL)
		lf=(LINMAX-WSIZEL);
	end
	cf=roi_params.col0+LengthSearch;
	if cf>(COLMAX-WSIZEC)
		cf=(COLMAX-WSIZEC);
	end
    
	for col=c0:StepSIZE:cf;
	for lin=l0:StepSIZE:lf;
        
        L = img2(   lin + [0:WSIZEL-1] , ... % linhas
                    col + [0:WSIZEC-1] );    % colunas
        
        pcc=get_pcc(ROI,L);
                
        if pcc >= pr %the biggest value of PCC
        	pr = pcc;
        	lin_match =lin; %axis x of vector 
            %MODIFICAÇÃO: +1 para que não haja lin_match=0, pois a imagem não tem coordenada [0,0].
        	col_match =col; %axis y of vector 
            %MODIFICAÇÃO: +1 para que não haja col_match=0, pois a imagem não tem coordenada [0,0].
        end
    end
    end
end
