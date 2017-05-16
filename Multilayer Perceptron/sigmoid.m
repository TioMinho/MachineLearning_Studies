% Sigmoid Function
function g = sigmoid(X)
    g = 1 ./ (1 + exp(-X)); 
end