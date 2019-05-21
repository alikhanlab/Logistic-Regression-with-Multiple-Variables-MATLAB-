function [J, theta] = costFunction_ex2_my(X, y, theta)

% Length of our training example
m = length(y);

% Initial cost
J = 0;

% Logistic regression hypothesis
h = sigmoid(X*theta);

% Cots function
J = (1/m)*sum((-y.*log(h) - (1-y).*log(1-h)));


end
