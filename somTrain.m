%% SOM Train

function somTrain (patterns)

    global maxNeighborDist tuneND orderLR orderSteps tuneLR;

    P = size(patterns,1);

    %% ordering
    
    neighborDistSpace = exp(linspace(log(tuneND), log(maxNeighborDist), orderSteps));
    learningRateSpace = exp(linspace(log(tuneLR), log(orderLR), orderSteps));
    for epoch = 1:orderSteps
        neighborDist = neighborDistSpace(orderSteps - epoch + 1);
        learningRate = learningRateSpace(orderSteps - epoch + 1);
        for iter = 1:P
            pattern = patterns(iter,:);
            somUpdate(pattern, learningRate, neighborDist);
        end
        if (mod(epoch,100)==0)
            fprintf('Ordering: %d\n', epoch)
        end 
    end
    
    %% tuning
    
    tuningSteps = 3*orderSteps;
    neighborDist = tuneND;
    learningRate = tuneLR;
    for epoch = 1:tuningSteps
        for iter = 1:P
            pattern = patterns(iter,:);
            somUpdate(pattern, learningRate, neighborDist);
        end
        if (mod(epoch,100)==0)
            fprintf('Tuning: %d\n', epoch)
        end 
    end

end
