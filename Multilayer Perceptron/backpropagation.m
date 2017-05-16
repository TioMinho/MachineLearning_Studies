function [ theta1_grad, theta2_grad ] = backpropagation( X, y, theta_1, theta_2  )
    %BACKPROPAGATION 
    %   Calculates the Gradients for the Theta1 and Theta2
    %   Good for only one iteration of Backprop
    m = size(X,2);
    
    a1 = [ones(1, m); X];
    a2 = [ones(1, m); sigmoid(theta_1' * a1)];
    a3 = sigmoid(theta_2' * a2);

    delta_2 = a3 - y;
    delta_1 = (theta_2 * delta_2) .* (a2 .* (1-a2));

    theta1_grad = (1/m)*(delta_1 * a1')';
    theta1_grad = theta1_grad(:,2:end);
    theta2_grad = (1/m)*(delta_2 * a2')';
end

