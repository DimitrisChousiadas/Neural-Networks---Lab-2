global IW distances positions ;
clc;clear;
%load('NIPS500.mat')
%load('tfidf_data.mat')
tfidf=tfidf1(Patterns);
tfidf=full(tfidf); %kanonikopoiisi -dimiourgoume ta 8296 vari wij ton orwn sta 500 eggrafa
minMax=[min(tfidf)' max(tfidf)'];
gridSize=[10 10];
somCreate(minMax,gridSize)
% epoxes apo 500-1000 paizoume
%plegma exagoniko
orderLR = 0.9; orderSteps = 500; tuneLR = 0.1;
somTrainParameters(orderLR,orderSteps,tuneLR);
[IW,distances]=somTrain(tfidf);
figure();
somShow(IW,gridSize);
%save('tfidf_data.mat','IW','distances');