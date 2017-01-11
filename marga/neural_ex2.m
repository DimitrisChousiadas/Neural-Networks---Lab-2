global distances IW positions;
close all;
clc;
clear;
%load('./SOM-2017/SOM-2017/NIPS500.mat')
EightData
%GroupData
%QuestionData
%Patterns=QuestionPatterns';
Patterns=EightPatterns';
minMax=[min(Patterns)' max(Patterns)'];
gridSize=[6 6]; %gia eight
%gridSize=[6 6]; %gia question
somCreate(minMax,gridSize);%meiwsi diastasewn-hexagonal plegma me 100 neurwnes pou o kathenas exei 8296 xar-vari
orderLR = 0.9; orderSteps = 500; tuneLR = 0.1;
somTrainParameters(orderLR,orderSteps,tuneLR);
somTrain(Patterns)
