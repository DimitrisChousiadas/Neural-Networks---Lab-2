function somTrainParameters(setOrderLR,setOrderSteps,setTuneLR)

global tuneND orderLR maxNeighborDist orderSteps tuneLR distances;

maxNeighborDist = ceil(max(max(distances)));
tuneND = 1; %apostasi neurwnwn sto tuning stadio

orderLR = setOrderLR; 
orderSteps = setOrderSteps;
tuneLR = setTuneLR;
end