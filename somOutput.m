%% SOM Output

function [output] = somOutput (pattern)

    global IW;

    negdistArr = negdist(IW, pattern');
    output = compet(negdistArr);

end