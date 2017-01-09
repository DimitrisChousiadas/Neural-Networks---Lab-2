function [ a ] = somActivation( pattern, neighborDist )
    global distances;
    a=zeros(1,100);
    ind = find( somOutput( pattern )) ;%briskei to index tou assou-thesi neurwna-nikhth
    for j=1:100
         if distances(ind, j) <= neighborDist
            a(j)=1;
         end
    end
    a = a .* 0.5; %an einai >2 px einai makria-den einai neighbor
    a( ind ) = 1;
    a=a';
end