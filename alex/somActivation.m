function [a] = somActivation(patterns,neighborDist)

global  distances;

%distances=πίνακας NxN που περιέχει την απόσταση κάθε νευρώνα από όλους του υπόλοιπους νευρώνες
%max_position=η θέση του νικητή νευρώνα
%winning_distance=η απόσταση του νικητή νευρώνα από τους άλλους
%στη συνέχεια αν αυτή η απόσταση είναι μικρότερη από neighborDist(η
%ελάχιστη απόσταση για να θεωρηθεί γειτονικός ένας νευρώνας) τότε τα βάρη
%αυτών των νευρώνων γίνονται 0.5 αλλιώς 0

[~,max_position]=max(somOutput(patterns));
winning_distance=distances(max_position,:);


winning_distance=winning_distance<=neighborDist;
winning_distance(find(winning_distance==max(winning_distance)))=0.5;

winning_distance(max_position)=1;

a=winning_distance;


end