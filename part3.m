% part 3 - training

clc;
clear;

load('NIPS500.mat');
global IW;

weights = tfidf1(Patterns);
weights = full(weights);

minimum = min(weights);
minimum = minimum';
maximum = max(weights);
maximum = maximum';
minMax = [minimum maximum];
gridSize = [10 10];
somCreate(minMax, gridSize);

setOrderLR = 0.9;
setOrderSteps = 500;
setTuneLR = 0.1;
somTrainParameters(setOrderLR, setOrderSteps, setTuneLR);

somTrain(weights);
IW_toSave = IW;
figure;somShow(IW,gridSize);
saveas(gcf,'results/part3/part3_umatrix.png');

save('results\part3\part3.mat');