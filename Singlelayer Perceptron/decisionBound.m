function [boundary_X, boundary_Y] = decisionBound( theta, X )
%PLOTDECISION 
%   Plot the decision boundary of ceratin equation
    boundary_X = linspace(min(X(2,:)), max(X(2,:)));
    boundary_Y = -(theta(2)/theta(3)) * boundary_X - (theta(1)/theta(2));
end

