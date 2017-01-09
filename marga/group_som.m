tic;
global IW distances positions ;
GroupData;

patterns=GroupPatterns';
%patterns=QuestionPatterns';     %Uncomment gia na trexei me ta stoixeia
                                 % tou erwthmatikou
minMax=[min(patterns)' max(patterns)'];
%epilogh grid size

gridSize=[8 8];
somCreate(minMax,gridSize);

orderLR = 0.9; orderSteps = 500; tuneLR = 0.1;
somTrainParameters(orderLR,orderSteps,tuneLR);

somTrain(patterns);

figure();
scatter3(patterns(:,1),patterns(:,2),patterns(:,3));
figure();
plot2DSomData(IW,distances,patterns);
figure();
somShow(IW,gridSize);
dist_group=distances;
toc;