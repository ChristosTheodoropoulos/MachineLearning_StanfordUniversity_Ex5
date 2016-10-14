function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

h = X * theta;		%h --> 12x1

for i = 1:m
	J = J + (h(i) - y(i))^2;
end

J = J/(2*m);

sum = 0;

for j = 2:size(theta)
	sum = sum + theta(j)^2;
end

sum = (lambda/(2*m))*sum;

J = J + sum;


for j = 1:size(theta)
	for i = 1:m	
		grad(j) = grad(j) + (1/m)*((h(i) - y(i))*X(i,j));
	end
end

for j = 2:size(theta)
		grad(j) = grad(j) + (lambda/m)*theta(j);
end

% =========================================================================

grad = grad(:);

end
