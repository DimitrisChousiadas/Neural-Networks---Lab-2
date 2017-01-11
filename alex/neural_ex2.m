global distances IW positions;
clc;
clear;
%load('C:\Users\Dell Inspiron\Documents\9Ô ≈Œ¡Ã«Õœ\ÕÂıÒ˘ÌÈÍ‹\Askisi2\SOM-2017\NIPS500.mat')
%EightData
%GroupData
QuestionData
%me question me randtop best to dist
%me gridtop best to boxdist i linkdist
%me hextop best to boxdist
% me hex best to linkdist

%me eight me randtop best to dist
%me gridtop best to linkdist
%me hextop best to dist
%me hex best to linkdist

Patterns=QuestionPatterns';
%Patterns=EightPatterns';
minMax=[min(Patterns)' max(Patterns)'];
%gridSize=[6 6]; %gia eight
gridSize=[10 10]; %gia question
somCreate(minMax,gridSize);%meiwsi diastasewn-hexagonal plegma me 100 neurwnes pou o kathenas exei 8296 xar-vari
orderLR = 0.9; orderSteps = 500; tuneLR = 0.1;
somTrainParameters(orderLR,orderSteps,tuneLR);
[IW,distances]=somTrain(Patterns);
a=figure;
plot2DSomData(IW,distances,Patterns);
%linkdist=akeraies times apostasewn strogulopoihsh 
saveas(a,'question_gridtop_boxdist.jpg');
%gridtop, hextop, randtop, hexagonaltopology
%boxdist, dist, linkdist, mandist
