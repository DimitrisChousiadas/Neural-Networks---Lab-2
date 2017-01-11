% part 3 - training

clc;
clear;

load('NIPS500.mat');
load('results\tfidf_weights.mat');

global IW;

Patterns = weights;

minimum = min(Patterns);
minimum = minimum';
maximum = max(Patterns);
maximum = maximum';
minMax = [minimum maximum];
gridSize = [10 10];
somCreate(minMax, gridSize);

setOrderLR = 0.9;
setOrderSteps = 500;
setTuneLR = 0.1;
somTrainParameters(setOrderLR, setOrderSteps, setTuneLR);

%somTrain(Patterns);
IW_toSave = IW;
figure;somShow(IW,gridSize);

save('results\iw_part3.mat');