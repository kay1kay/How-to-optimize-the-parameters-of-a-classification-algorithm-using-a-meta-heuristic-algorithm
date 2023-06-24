clc;
clear;
close all;
dataset = readtable("dataset\Maternal Health Risk.csv", "preserveVariableNames", true);
dataset = dataset(randperm(size(dataset, 1)), :); %shuffle
DS_RiskLevel =  [dataset(:, 1:12) , dataset(:, "RiskLevel")];
% LearningRate = 0.5;
% Momentum = 0.5;
[LearningRate, Momentum] = CSA(DS_RiskLevel);

[CM_RiskLevel, accuracy_RiskLevel, predictedLabel_RiskLevel, Confidence_RiskLevel] = deepLearning(DS_RiskLevel, 0, LearningRate, Momentum);


disp("Accuracy of RiskLevel= "+calculateAccuracy(predictedLabel_RiskLevel, dataset{:, "RiskLevel"}));

CM = CM_RiskLevel{1, 1}+CM_RiskLevel{1, 2}+CM_RiskLevel{1, 3}+CM_RiskLevel{1, 4}+CM_RiskLevel{1, 5};
confusionchart(CM);
