function somUpdate( patterns, learningRate, neighborDist )
    global IW ;
    a = somActivation( patterns, neighborDist ); %a=1x100
    for i=1:size(IW,1)
        IW(i,:) = IW(i,:) + learningRate*a(i)*(patterns - IW(i,:));
    end 
end