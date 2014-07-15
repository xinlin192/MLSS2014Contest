

function score = KNN (yTrain, XTrain, yTest, XTest,  K)

    % read input data
    [nInstances_train, nFeatures_train] = size(XTrain);
    [nInstances_train_p, nLabels_train] = size(yTrain);
    assert (nInstances_train == nInstances_train_p, 'KNN input: nInstances mismatch')
    [nInstances_test, nFeatures_test] = size(XTest);
    assert (nFeatures_train == nFeatures_test, 'KNN input: nFeatures mismatch')

    % create prediction
    prediction = zeros([nInstances_test, nLabels_train]);

    % TODO: scale the data (optional)

    % predict the XTest
    for i = 1:nInstances_test
        i
        % TODO: priority queue
        min_dist = 1e99;
        min_index = -1;
        
        % compute distance to all training data
        for j = 1:nInstances_train,
            dist = compute_dist(XTest(i,:), XTrain(j,:));
            if dist < min_dist
                min_dist = dist;
                min_index = j;
            end
        end
        % retrieval all voters' labels
        
        
        % apply majority voting
        if min_index > 0
            prediction(i,:) = yTrain(min_index,:);
        end

    end

end


function dist = compute_dist (ins1, ins2)
    dist = norm (ins1 - ins2, 2);
end
