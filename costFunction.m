function [J, theta] = costFunction(X, y, theta, alpha, num_iters)

% Length of our training example
m = length(y);

% Initial cost
J = 0;
grad = zeros(size(theta));

% Logistic regression hypothesis
h = sigmoid(X*theta);

% Cots function
J = (1/m)*sum((-y.*log(h) - (1-y).*log(1-h)));

% Gradient descent
for iter = 1:num_iters
    theta = theta - (alpha/m)*(X'*(h-y));

end
end
