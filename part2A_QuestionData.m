% Part 2A - Question Data

clear;
foo = importdata('QuestionData.m');
QuestionPatterns = foo.data;

global IW distances;

minimum = min(QuestionPatterns);
minimum = minimum';
maximum = max(QuestionPatterns);
maximum = maximum';
minMax = [minimum maximum];
gridSize = [10 1];
somCreate(minMax, gridSize);

setOrderLR = 0.9;
setOrderSteps = 500;
setTuneLR = 0.1;
somTrainParameters(setOrderLR, setOrderSteps, setTuneLR);

somTrain(QuestionPatterns);

figure; plot2DSomData(IW, distances, QuestionPatterns);
saveas(gcf,'results/question/question_1D_4_plot.png');
figure;somShow(IW,gridSize);
saveas(gcf,'results/question/question_1D_4_umatrix.png');

save('results/question/question_1D_4.mat');
