function [c] = classify (XTrain, yTrain, XTest, h)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% ------ START: REPLACE WITH YOUR CODE ------

n = size(yTrain,1);
nClass = size(yTrain,2)
%c = ones(n, nClass);

% read input data
[nInstances_train, nFeatures_train] = size(XTrain);
[nInstances_train_p, nLabels_train] = size(yTrain);
assert (nInstances_train == nInstances_train_p, 'KNN input: nInstances mismatch')
[nInstances_test, nFeatures_test] = size(XTest);
assert (nFeatures_train == nFeatures_test, 'KNN input: nFeatures mismatch')

% create c
c = ones(nInstances_test, nLabels_train);

% TODO: scale the data (optional)

% predict the XTest
for i = 1:nInstances_test
    i

    % compute distance to all training data
    diff_mat = XTrain - repmat(XTest(i,:), nInstances_train, 1);
    dist_mat = sum(diff_mat.^2, 2);
    % retrieval all voters' labels
    [min_value, min_index] = min(dist_mat);

    % apply majority voting
    c(i,:) = yTrain(min_index,:);

end

% ------ END: REPLACE WITH YOUR CODE ------



end


