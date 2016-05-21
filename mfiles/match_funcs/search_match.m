% Esta fun��o pesquisa na imagem 2 qual a parte mais parecida com a regi�o de interesse;
%
% inputs
% StepSIZE = dist�ncia percorrida em pixels entre ROIs;
% img2 = imagem 2;
% ROI = regi�o de interesse;
% roi_params = par�metros do roi antigo 
%     roi_params.WSIZEL
%     roi_params.WSIZEC
%     roi_params.lin0     :linha inicial na imagen
%     roi_params.col0
%     roi_params.lin      :linha final na imagen
%     roi_params.col
%
% outputs:
% lin_match = linha do novo ROI;
% col_match = coluna do novo ROI;
% pr = coenficiente de pearson do novo ROI;
%
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT

function [lin_match, col_match, pr, AREA, fator_match]= search_match ( StepSIZE, img2, ROI,roi_params) 
    pr = 0; % inicial pearson

    WSIZEL=size(ROI,1);
    WSIZEC=size(ROI,2);

    LINMAX=size(img2,1);
    COLMAX=size(img2,2);
  
    lin_match= 0;
    col_match= 0;
    pr=-2;
  
    WSIZEL
    WSIZEC
  
  
    for fator=0.8:0.05:1.3;

        % LengthSearch = variavel usada para determinar a regiao que ser� varrida pelo ROI
        LengthSearchL=floor(WSIZEL*fator*1.5);
        LengthSearchC=floor(WSIZEC*fator*1.5); %0.5
  
        l0=roi_params.lin0-LengthSearchL;
        if l0<1
            l0=1;
        end
        c0=roi_params.col0-LengthSearchC;
        if c0<1
            c0=1;
        end

        lf=roi_params.lin0+LengthSearchL;
        if lf>(LINMAX-floor(WSIZEL*fator))
            lf=(LINMAX-floor(WSIZEL*fator));
        end

        if lf<1
            lf=1;
        end
  
        cf=roi_params.col0+LengthSearchC;
        if cf>(COLMAX-floor(WSIZEC*fator))
            cf=(COLMAX-floor(WSIZEC*fator));
        end
        if cf<1
            cf=1;
        end

        for col=c0:StepSIZE:cf;
        fprintf('factor:%4.2f col:%4d/%4d/%4d\r',fator,c0,col,cf); 
        for lin=l0:StepSIZE:lf; 
        %if ((floor(WSIZEL*fator)+lin-1) < LINMAX) && ((floor(WSIZEC*fator)+col-1) < COLMAX)    

            TEMPROI = img2(   lin + [0: (floor(WSIZEL*fator)-1)] , ... % linhas
                    col + [0: (floor(WSIZEC*fator)-1)]);    % colunas
                    
        
            ROI = double(ROI); 
          
            A=size(TEMPROI,1)*size(TEMPROI,2);
        
            TEMPROI=resizeminus(ROI,TEMPROI);
        
            TEMPROI = double(TEMPROI);
        
        
            pcc=get_pcc(ROI,TEMPROI);
                
            if pcc >= pr %the biggest value of PCC
                pr = pcc;
                lin_match =lin; %axis x of vector 
                %MODIFICA��O: +1 para que n�o haja lin_match=0, pois a imagem n�o tem coordenada [0,0].
                col_match =col; %axis y of vector 
                %MODIFICA��O: +1 para que n�o haja col_match=0, pois a imagem n�o tem coordenada [0,0].
                AREA=A;
                fator_match=fator;
            end
        %end
        end
        end
        fprintf('\n');
    end
end
