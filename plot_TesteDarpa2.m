load('data_TEsteDarpa2.dat')


graph = plot(vc,vd);
ylim([0 1.3]);
saveas (gcf ,'graph.eps');

figure;
imagesc(img2)
hold on
plot_vector(P);%roi2_params.point_col-roi_params.col0);     % vetor coluna
hold off
saveas (gcf ,'graph2.eps');

