function [accuracy] = calculateAccuracy(predictedColumn,labelColumn)
plbl_Risk = double(string([predictedColumn{1,1}; predictedColumn{1,2}; predictedColumn{1,3}; predictedColumn{1,4}; predictedColumn{1,5}]));
lbl_Risk = labelColumn;
accuracy = sum(plbl_Risk == lbl_Risk)/numel(lbl_Risk);
end