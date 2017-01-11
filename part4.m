% part 4

clc;
clear;

load('NIPS500.mat');
load('results\tfidf_data.mat');

gridSize = [10 10];

figure;somShow(IW,gridSize);