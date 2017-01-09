% Part 2B - TSP

clear;
foo = importdata('Cities.m');
Cities = foo.data;

global IW distances;

minimum = min(Cities);
minimum = minimum';
maximum = max(Cities);
maximum = maximum';
minMax = [minimum maximum];
P = size(Cities,1);
gridSize = [P 1];
somCreate(minMax, gridSize);

setOrderLR = 0.9;
setOrderSteps = 250;
setTuneLR = 0.1;
somTrainParameters(setOrderLR, setOrderSteps, setTuneLR);

somTrain(Cities);

figure; plot2DSomData(IW, distances, Cities);
figure;somShow(IW,gridSize);
