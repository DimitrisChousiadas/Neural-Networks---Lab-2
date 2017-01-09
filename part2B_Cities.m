% Part 2B - TSP

clear;
clc;
Cities;
Patterns = CityCoordinates';

global IW distances;

minimum = min(Patterns);
minimum = minimum';
maximum = max(Patterns);
maximum = maximum';
minMax = [minimum maximum];
P = 2*size(Patterns,1);
gridSize = [9 9];
somCreate(minMax, gridSize);

setOrderLR = 0.9;
setOrderSteps = 500;
setTuneLR = 0.1;
somTrainParameters(setOrderLR, setOrderSteps, setTuneLR);

somTrain(Patterns);

figure; plot2DSomData(IW, distances, Patterns);
figure;somShow(IW,gridSize);
