function [IW,distances]=somTrain(patterns)

global IW distances maxNeighborDist tuneND orderLR orderSteps tuneLR;

NeighborDist=maxNeighborDist;
LR=orderLR;
t2=1000;
%maxNeighborDist, tuneND,orderLR,orderSteps,tuneLR

%ordering
for j=1:orderSteps
    
  for i=1:size(patterns,1)
    somUpdate(patterns(i,:),LR,NeighborDist);

  end
    if (mod(j,100)==0)
      fprintf('eimai stin %d epoxi tou ordering\n', j)
    end 
  LR=orderLR*exp(-j/t2);

  if LR<tuneLR
   LR=tuneLR;
 end
 

 NeighborDist=maxNeighborDist-maxNeighborDist*j/1000;

 if NeighborDist<1
    NeighborDist=1;
end

end
%tuning
for j=1:2*orderSteps
  
    for i=1:size(patterns,1)
    somUpdate(patterns(i,:),tuneLR,tuneND);   

    end
    if (mod(j,100)==0)
      fprintf('eimai stin %d epoxi tou tuning\n', j)
    end 
    
end
%figure;
%plot2DSomData(IW,distances,patterns);


