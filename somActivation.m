%% SOM Activation

function a = somActivation (pattern, neighborDist)

    output = somOutput(pattern);
    [~,pos] = find(output == 1);

    a = zeros(N,1);
    for iter = 1:N
        if (distances(pos,iter) <= neighborDist)
            a(iter) = 0.5;
        end
    end
    a(pos) = 1;

end