% part 3

clc;
clear;

load('NIPS500.mat');

weights = tfidf1(Patterns);

save('results\tfidf_weights.mat');