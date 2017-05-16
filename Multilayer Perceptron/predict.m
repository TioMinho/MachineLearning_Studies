function [ Y_pred, Y_dummy ] = predict( X, theta1, theta2 )
%PREDICT
%   Apply a fowardpropagation to predict the classification
    m = size(X,2);
    
    a1 = [ones(1, m); X];
    a2 = [ones(1, m); sigmoid(theta1' * a1)];
    a3 = sigmoid(theta2' * a2);

    [~, Y_pred] = max(a3, [], 1);
    Y_dummy = dummyvar(Y_pred)';
end

