%% SOM Update

function somUpdate (pattern, learningRate, neighborDist)

    global IW;

    a = somActivation(pattern,neighborDist);
    for iter = 1:size(IW,1)
        IW(iter,:) = IW(iter,:) + learningRate*a(iter)*(pattern-IW(iter,:));
    end
    
end
