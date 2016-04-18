% Esta fun��o pesquisa na imagem 2 qual a parte mais parecida com a regi�o de interesse;
%
% inputs
% StepSIZE = dist�ncia percorrida em pixels entre ROIs;
% img2 = imagem 2;
% ROI = regi�o de interesse;
% roi_params = par�metros do roi antigo 
% 	roi_params.WSIZEL
% 	roi_params.WSIZEC
% 	roi_params.lin0     :linha inicial na imagen
% 	roi_params.col0
% 	roi_params.lin      :linha final na imagen
% 	roi_params.col
%
% outputs:
% lin_match = linha do novo ROI;
% col_match = coluna do novo ROI;
% pr = coenficiente de pearson do novo ROI;
%
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT

function [lin_match, col_match, pr, AREA, fator]= search_match ( StepSIZE, img2, ROI,roi_params) 
    pr = 0; % inicial pearson

    WSIZEL=size(ROI,1);
    WSIZEC=size(ROI,2);

	LINMAX=size(img2,1);
	COLMAX=size(img2,2);
	% LengthSearch = variavel usada para determinar a regiao que ser� varrida pelo ROI
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
  
  lin_match= 0;
  col_match= 0;
  pr=-2;
  
  WSIZEL
  WSIZEC
  IIII=1;
 for fator=0.8:0.05:1.2;
	for col=c0:StepSIZE:floor(COLMAX-(WSIZEC*fator)); %modificacao cf para COLMAX-WSIZE*fator
  fprintf('%d\r',IIII); IIII=IIII+1;
	for lin=l0:StepSIZE:floor(LINMAX-(WSIZEL*fator));
 
  if ((floor(WSIZEL*fator)+lin-1) < LINMAX) && ((floor(WSIZEC*fator)+col-1) < COLMAX)    
        TEMPROI = img2(   lin + [0: floor(WSIZEL*fator)-1] , ... % linhas
                    col + [0: floor(WSIZEC*fator)] -1 );    % colunas
                    
  %else   {
   %     TEMPROI = img2(   lin + [0:auxMaxLin] , ... % mantem para nao ultrapassar COLMAX e nem LINMAX
    %                col + [0:auxMaxCol] );          % COLMAX e nem LINMAX
     %   }
        %TEMPROI = rgb2gray(TEMPROI);

        %ROI = rgb2gray(ROI);
        ROI = double(ROI); 
        %TEMPROI=resize48_image (TEMPROI);
        %ROI=resize48_image (ROI);
        
        %size(TEMPROI)
        %size(ROI)
        
        A=size(TEMPROI,1)*size(TEMPROI,2);
        
        TEMPROI=resizeminus(ROI,TEMPROI);
        
        TEMPROI = double(TEMPROI);
        %size(TEMPROI)
        
        pcc=get_pcc(ROI,TEMPROI);
                
        if pcc >= pr %the biggest value of PCC
        	pr = pcc;
        	lin_match =lin; %axis x of vector 
            %MODIFICA��O: +1 para que n�o haja lin_match=0, pois a imagem n�o tem coordenada [0,0].
        	col_match =col; %axis y of vector 
            %MODIFICA��O: +1 para que n�o haja col_match=0, pois a imagem n�o tem coordenada [0,0].
          AREA=A;
        end
    end
    end
    end
%COLMAX
%LINMAX
%  lin_match
%  col_match
%  pr
end

disp('');