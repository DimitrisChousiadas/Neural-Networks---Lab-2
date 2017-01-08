%% SOM Output

function output = somOutput (pattern)

    negdistArr = negdist(IW, pattern);
    output = compet(negdistArr);

end