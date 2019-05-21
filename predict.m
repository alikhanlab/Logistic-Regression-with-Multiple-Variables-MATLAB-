function p = predict(X, theta)

m = size(X, 1); % Number of training examples

% You need to return the following variables correctly
p = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters. 
%               You should set p to a vector of 0's and 1's
%


prediction = sigmoid(X*theta);
p(find(prediction < 0.5)) = 0;
p(find(prediction >= 0.5)) = 1;

end