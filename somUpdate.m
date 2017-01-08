%% SOM Update

function somUpdate (pattern, learningRate, neighborDist)

    a = somActivation(pattern,neighborDist);
    for iter = 1:N
        IW(iter,:) = IW(iter,:) + learningRate*a(iter)*(pattern-IW(iter,:));
    end
    
end