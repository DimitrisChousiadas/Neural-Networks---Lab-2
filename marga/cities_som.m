global distances IW positions N;
clc;
clear;
%load('C:\Users\Dell Inspiron\Documents\9ï ÅÎÁÌÇÍÏ\ÍåõñùíéêÜ\Askisi2\SOM-2017\NIPS500.mat')
Cities
Patterns=CityCoordinates';
minMax=[min(Patterns)' max(Patterns)'];
gridSize=[9 9];
somCreate_tsp(minMax,gridSize);%meiwsi diastasewn-hexagonal plegma me 100 neurwnes pou o kathenas exei 8296 xar-vari
orderLR = 0.9; orderSteps = 500; tuneLR = 0.1;
somTrainParameters(orderLR,orderSteps,tuneLR);
somTrain(Patterns)
