% part 2C

clear;
clc;
GroupData;
Patterns = GroupPatterns';

global IW distances;

minimum = min(Patterns);
minimum = minimum';
maximum = max(Patterns);
maximum = maximum';
minMax = [minimum maximum];
gridSize = [15 15];
somCreate(minMax, gridSize);

setOrderLR = 0.9;
setOrderSteps = 500;
setTuneLR = 0.1;
somTrainParameters(setOrderLR, setOrderSteps, setTuneLR);

somTrain(Patterns);

figure; scatter3(Patterns(:,1),Patterns(:,2),Patterns(:,3));
saveas(gcf,'results/group/group_scatter.png');
figure; plot2DSomData(IW, distances, Patterns);
saveas(gcf,'results/group/group_plot.png');
figure;somShow(IW,gridSize);
saveas(gcf,'results/group/group_umatrix.png');

save('results/group/group.mat');
