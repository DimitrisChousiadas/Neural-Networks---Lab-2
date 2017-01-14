%% part 4

clc;
clear;
load('NIPS500.mat');
load('results\part3\tfidf_data.mat');

gridSize = [10 10];
neurons = gridSize(1)*gridSize(2);

%% 4B

somShow(IW,gridSize);
saveas(gcf,'results/part4/umatrix.png');

%% 4C-i

winners = zeros(size(Patterns,1), neurons);
for iter = 1:size(Patterns,1)
   winners(iter,:) = somOutput(Patterns(iter,:));
end

docsPerNeuron = sum(winners,1)';
docsPerNeuron = reshape(docsPerNeuron,10,10);

%% 4C-ii

d = dist(Patterns,IW');
[~,docs] = min(d);
docs = docs';
doc_titles = titles(docs);

%% 4C-iii

[~,terms_pos] = sort(IW,2);
num_features = size(Patterns,2);
terms_pos = terms_pos(:,(num_features-2):num_features);
termsPerNeuron = terms(terms_pos);

%% 4C-iv

networkInd = find(strcmp(terms,'network'));
networkMax = max(IW(:,networkInd));
functionInd = find(strcmp(terms,'function'));
functionMax = max(IW(:,functionInd));

net_fnc_neurons = find((IW(:,networkInd)>0.3*networkMax) & (IW(:,functionInd)>0.3*functionMax));

%% 4C-v

unique_terms_pos = unique(terms_pos);
max_weight = max(IW(:,unique_terms_pos),[],1);
mean_weight = mean(IW(:,unique_terms_pos),1);
percentage = mean_weight ./ max_weight * 100;
percentage = percentage';
percentage = round(percentage*100)/100;

%% saving workspace
save('results\part4\part4.mat');