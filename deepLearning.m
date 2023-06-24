function [Confusionmatrix, Acc, lblPredicted, Conf] = deepLearning(DS, trainingProgress, LR, Mom)

[rData, ~] = size(DS);
kfold= 5;
[trSets, teSets] = divideData(DS, rData, kfold);

accuracy = zeros(1, kfold);
CM = cell(1, kfold);
predictedLabel = cell(1, kfold);

for i=1:kfold
tempSet = trSets{1, i};
trainSet.Predictors = double(table2array(tempSet(:, 1:end-1)));
trainSet.Response = table2array(tempSet(:, end));


tempSet = teSets{1, i};
testSet.Predictors =double(table2array(tempSet(:, 1:end-1)));
testSet.Response = table2array(tempSet(:, end));

tp = 'none';
if (trainingProgress == 1)
tp = 'training-progress';
end

layers = [
    featureInputLayer(12,"Name","inputLayer")
    batchNormalizationLayer("Name","batchnorm")
    sigmoidLayer("Name","sigmoid")
    dropoutLayer(0.1,"Name","dropout1")
    reluLayer("Name","relu1")
    fullyConnectedLayer(12,"Name","fc1")
    reluLayer("Name","relu2")
    fullyConnectedLayer(12,"Name","fc2")
    reluLayer("Name","relu3")
    fullyConnectedLayer(3,"Name","fc3")
    softmaxLayer
    classificationLayer];


options = trainingOptions('sgdm', ...
    'InitialLearnRate',LR, ...
    'Momentum', Mom, ...
    'MaxEpochs',300, ...
    'Shuffle','every-epoch', ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'ExecutionEnvironment','auto', ...
    'Plots', tp);
x = trainSet.Predictors;
y= categorical(trainSet.Response');

net = trainNetwork(x, y, layers,options);

YPredVal = classify(net,testSet.Predictors);
Conf = predict(net,testSet.Predictors);
predictedLabel{1, i} = YPredVal;
Confidence{1, i} = Conf;
YValidation = testSet.Response;
catYValidation = categorical(YValidation);
accuracy(1, i) = sum(YPredVal == catYValidation)/numel(catYValidation);

catYPredVal = categorical(YPredVal);
CM{1, i} = confusionmat(catYValidation,catYPredVal);
end

Confusionmatrix = CM;
Acc = accuracy;
lblPredicted = predictedLabel;
Conf = Confidence;
end