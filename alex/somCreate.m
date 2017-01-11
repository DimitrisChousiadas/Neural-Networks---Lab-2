function somCreate(minMax,gridSize)

global neuronsPerRow neuronsPerColumn N IW distances dimensions positions;

neuronsPerRow = gridSize(1,1);
neuronsPerColumn = gridSize(1,2);
N = neuronsPerRow*neuronsPerColumn;
minFeatureValues = minMax(:,1)'; 
maxFeatureValues = minMax(:,2)';
dimensions = size(minMax,1); 
IW = zeros(N,dimensions);
%Initial Weights
for i = 1:N,
    IW(i,:) = rand(1,dimensions).*(maxFeatureValues-minFeatureValues)+minFeatureValues;
end
%positions=gridtop(neuronsPerRow,neuronsPerColumn);
positions = hexagonalTopology(neuronsPerRow,neuronsPerColumn);
%plotsom(positions)
%positions = gridtop(neuronsPerRow,neuronsPerColumn);
%positions=hextop(neuronsPerRow,neuronsPerColumn);
distances = boxdist(positions);
%distances = mandist(positions);
end
%%%%%%%%%%%%
%distances = ring_distances(N);