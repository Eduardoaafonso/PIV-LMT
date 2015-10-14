function pcc=get_pcc(ROI,L);

mediaA = (mean2(ROI)).*ones(size(ROI));
mediaB = (mean2(L)).*ones(size(L));

aux1 = sum (sum((L-mediaB).*(ROI-mediaA))); %PCC
aux3 = sqrt(sum(sum((ROI-mediaA).^2)));
aux4 = sqrt(sum(sum((L-mediaB).^2)));
pcc = aux1/(aux3.*aux4);
