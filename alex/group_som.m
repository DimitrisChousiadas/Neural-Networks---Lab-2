clc;clear; 
tic;
typou_1=0;
typou_2=0;
patterns_1=0;
patterns_2=0;
global IW distances positions ;
GroupData;

patterns=GroupPatterns';
%patterns=QuestionPatterns';     %Uncomment gia na trexei me ta stoixeia
                                 % tou erwthmatikou

%pattern
minMax=[min(patterns)' max(patterns)'];
%epilogh grid size

gridSize=[20 20];
somCreate(minMax,gridSize);

orderLR = 0.9; orderSteps = 1000; tuneLR = 0.1;
somTrainParameters(orderLR,orderSteps,tuneLR);

[IW,distances]=somTrain(patterns);

figure();
scatter3(patterns(:,1),patterns(:,2),patterns(:,3));
figure();
plot2DSomData(IW,distances,patterns);
figure();
somShow(IW,gridSize);

for i=1:size(distances)
   IW(i,3)=round(IW(i,3));
end
for i=1:size(distances)
   if IW(i,3)>0
       IW(i,3)=1;
    else
        IW(i,3)=0;
   end
end
for i=1:size(patterns,1)
    if patterns(i,3)>0
        patterns(i,3)=1;
    else
        patterns(i,3)=0;
    end
end
%pattern
for i=1:size(patterns)
    if patterns(i,3)==1
        patterns_1=patterns_1+1;
    else
        patterns_2=patterns_2+1;
    end
end

for i=1:size(distances)
    if IW(i,3)==1
        typou_1=typou_1+1;
    else
        typou_2=typou_2+1;
    end
end
%patterns_1=144
%patterns_2=206

%me grid 5x5
%typou_1=10
%typou_2=15

%me grid 8x8
%typou_1=24
%typou_2=40

%me grid 12x12
%typou_1=63
%typou_2=81

%me grid 20x20
%typou_1=159
%typou_2=241

%otan auksisw arketa tous neurwnes blepw oti yparxei megali diafora anamesa
%se autous pou pane stin prwti katigoria k se autous p pane sti deuteri

%pou borei na ofeilontai oi diaforopoiiseis sta sunora diaxwrismou?
%eksartwntai apo thn topologia kai thn arxikopoihsh tou neurwnikou 
toc;