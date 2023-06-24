function [Acc] = deepLearning2(DS, opt)

[rData, ~] = size(DS);
nTrain = round((rData*70)/100);
trSets = DS(1:nTrain, :);
teSets = DS(nTrain+1:end, :);

trainSet.Predictors = double(table2array(trSets(:, 1:end-1)));
trainSet.Response = table2array(trSets(:, end));

testSet.Predictors =double(table2array(teSets(:, 1:end-1)));
testSet.Response = table2array(teSets(:, end));

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
    dropoutLayer(0.2,"Name","dropout")
    reluLayer("Name","relu4")
    fullyConnectedLayer(3,"Name","fc3")
    softmaxLayer
    classificationLayer];


options = opt;
x = trainSet.Predictors;
y= categorical(trainSet.Response');

net = trainNetwork(x, y, layers,options);

YPredVal = classify(net,testSet.Predictors);
YValidation = testSet.Response;
catYValidation = categorical(YValidation);
Acc = sum(YPredVal == catYValidation)/numel(catYValidation);

end