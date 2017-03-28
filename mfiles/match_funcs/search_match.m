% Esta fun��o pesquisa na imagem 2 qual a parte mais parecida com a regi�o de interesse;
%
% inputs
% StepSIZE = dist�ncia percorrida em pixels entre RORs;
% img2 = imagem 2;
% ROR = regi�o de interesse;
% ROR_params = par�metros do ROR antigo 
%     ROR_params.WSIZEL
%     ROR_params.WSIZEC
%     ROR_params.lin0     :linha inicial na imagen
%     ROR_params.col0
%     ROR_params.lin      :linha final na imagen
%     ROR_params.col
%
% outputs:
% lin_match = linha do novo ROR;
% col_match = coluna do novo ROR;
% pr = coenficiente de pearson do novo ROR;
%
% Desenvolvedor: Eduardo Afonso, Fernando
% Email: eduardoafonsobaixista@gmail.com
% website: github https://github.com/Eduardoaafonso/PIV-LMT

function [lin_match, col_match, pr, AREA, fator_match, WSIZEC_match, WSIZEL_match]= search_match ( StepSIZE, img2, ROR,ROR_params) 

    WSIZEL=size(ROR,1);
    WSIZEC=size(ROR,2);
    
    LINMAX=size(img2,1);
    COLMAX=size(img2,2);
  
    lin_match= 0;
    col_match= 0;
    pr=-2;
  
    WSIZEL
    WSIZEC
   
    n=1;
    %de 0,66:0,01:1,5 
    for fator=0.86:0.01:1.3;

        % LengthSearch = variavel usada para determinar a regiao que ser� varrida pelo ROR
        LengthSearchL=floor(WSIZEL*fator*.5);
        LengthSearchC=floor(WSIZEC*fator*.5); %0.5
  
        l0=ROR_params.lin0-LengthSearchL;
        if l0<1
            l0=1;
        end
        c0=ROR_params.col0-LengthSearchC;
        if c0<1
            c0=1;
        end

        lf=ROR_params.lin0+LengthSearchL;
        if lf>(LINMAX-floor(WSIZEL*fator))
            lf=(LINMAX-floor(WSIZEL*fator));
        end

        if lf<1
            lf=1;
        end
  
        cf=ROR_params.col0+LengthSearchC;
        if cf>(COLMAX-floor(WSIZEC*fator))
            cf=(COLMAX-floor(WSIZEC*fator));
        end
        if cf<1
            cf=1;
        end

        vetor_coluna(n) = c0;
        
  if  n>2 && vetor_coluna(n-1) != vetor_coluna(n) || fator == 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FAZER


        for col=c0:StepSIZE:cf;
        fprintf('factor:%4.2f col:%4d/%4d/%4d',fator,c0,col,cf); 
        for lin=l0:StepSIZE:lf; 
        %if ((floor(WSIZEL*fator)+lin-1) < LINMAX) && ((floor(WSIZEC*fator)+col-1) < COLMAX)    

            TEMPROR = img2(   lin + [0: (floor(WSIZEL*fator)-1)] , ... % linhas
                    col + [0: (floor(WSIZEC*fator)-1)]);    % colunas
                    
        
            ROR = double(ROR); 
          
            A=size(TEMPROR,1)*size(TEMPROR,2);
            
            TEMPROR=resizeminus(ROR,TEMPROR);
        
            TEMPROR = double(TEMPROR);
            
            RORpon = ponderacao(ROR);
            TEMPRORpon = ponderacao(TEMPROR);
            
            pcc=get_pcc(RORpon,TEMPRORpon);
                
            if pcc >= pr %the biggest value of PCC
                pr = pcc;
                lin_match =lin; %axis x of vector 
                %MODIFICA��O: +1 para que n�o haja lin_match=0, pois a imagem n�o tem coordenada [0,0].
                col_match =col; %axis y of vector 
                %MODIFICA��O: +1 para que n�o haja col_match=0, pois a imagem n�o tem coordenada [0,0].
                AREA=A;
                fator_match=fator;
                WSIZEC_match = round(WSIZEC*fator);
                WSIZEL_match = round(WSIZEL*fator);
                
            end
        %end
        end
        fprintf('\n');
        end
    else
    fprintf("nao entrou \n")
      end
    n = n+1;
        
    end

end