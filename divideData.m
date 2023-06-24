function [trSets, teSets] = divideData(Data, n,kfold)
testPercentage = 100 /kfold;
bin = round((n*testPercentage)/100);
seg = ones(2,5);
for i=0:kfold-1
    seg(1, i+1)= (bin * i) + 1;
    seg(2, i+1)= bin * (i+1);
end
seg(2, kfold) = n;
testSets = cell(1, kfold);
trainSets = cell(1, kfold);
for i=1:kfold
    testSets{1, i} =Data(seg(1,i):seg(2,i), :);
    trainSets{1, i} = setdiff(Data,testSets{1, i});
end
trSets = trainSets;
teSets = testSets;
end