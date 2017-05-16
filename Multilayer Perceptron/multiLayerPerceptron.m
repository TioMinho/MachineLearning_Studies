clear all

data = load('iris.data');
X = data(:,1:4)';
y = data(:, 5)';

% ------ Treinamento do Perceptron -----------------
hidden_Neurons = 25;
num_Classes = 3;
num_Features = size(X, 1);
num_Examples = size(X, 2);

theta_1 = rand(num_Features + 1, hidden_Neurons);
theta_2 = rand(hidden_Neurons + 1, num_Classes); 

alpha = 1;
iterations = 1000;
error_Hist = zeros(iterations,1);

for i = 1:iterations
    permute = randperm(length(X));
    X = X(:, permute);
    y = y(:, permute);
    y_d = dummyvar(y)';

    [theta1_grad, theta2_grad] = backpropagation(X, y_d, theta_1, theta_2);

    theta_1 = theta_1 - alpha * theta1_grad;
    theta_2 = theta_2 - alpha * theta2_grad;
end
% ----------------------------------------------------

[ y_pred, y_dummy ] = predict(X, theta_1, theta_2);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(y_pred == y)) * 100);


