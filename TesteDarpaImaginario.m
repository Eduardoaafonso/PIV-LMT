%
addpath(genpath('mfiles'));

piv.load_image_from_filename('/Mini/0000000000.png');
roi_object1		= piv.select_roi_from_image(img1); % para selecionar graficamente a ROI

search_params 	= select_search_params(); % para selecionar graficamente os parametros de busca

srcFiles  = dir('/Mini/*.png');

P{1}=roi_object1.get_position();
KK=2;
tic
for c = 1:8 
    filename = ['/Mini/', srcFiles(c).name];
    piv.load_image_from_filename(filename);

    [roi_object2 pr]= piv.match(roi_object1,search_params); %pr = PCC maior

	P{KK}=roi_object2.get_position();
	KK=KK+1;

    roi_object1=piv.new_roi( roi_object2,pr);
	%roi_object deve ter uma imagem grande e pequena e a posição de onde foi tirada.

end
tempo = toc
figure;
imagesc(img2)
hold on
plot_vector(    P{1}(1,1), ... % linha
                P{1}(1,2), ... % coluna
                P{KK-1}(1,1)-P{1}(1,1),...%roi2_params.point_lin-roi_params.lin0, ...  % vetor linha
                P{KK-1}(1,2)-P{1}(1,2));%roi2_params.point_col-roi_params.col0);     % vetor coluna
hold off
