%% SOM Train

function somTrain (patterns)

    global maxNeighborDist tuneND orderLR orderSteps tuneLR;

    P = size(patterns,1);

    %% ordering
    
    log_nd = log(tuneND/maxNeighborDist);
    log_lr = log(tuneLR/orderLR);
    neighborDistSpace = maxNeighborDist*exp(linspace(log_nd/orderSteps, log_nd, orderSteps));
    learningRateSpace = orderLR*exp(linspace(log_lr/orderSteps, log_lr, orderSteps));
 
    for epoch = 1:orderSteps
        neighborDist = neighborDistSpace(epoch);
        learningRate = learningRateSpace(epoch);
        for iter = 1:P
            pattern = patterns(iter,:);
            somUpdate(pattern, learningRate, neighborDist);
        end
        if (mod(epoch,100)==0)
            fprintf('Ordering: %d\n', epoch)
        end 
    end
    
    %% tuning
    
    tuningSteps = 4*orderSteps;
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