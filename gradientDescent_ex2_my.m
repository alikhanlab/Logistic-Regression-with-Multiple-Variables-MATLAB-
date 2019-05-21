function [theta, J_history] = gradientDescent_ex2_my(X, y, theta, alpha, num_iters)

% Number of training examples
m = length(y);

% Cost on every iteration. (Cost should decrease over iterations)
J_history = zeros(num_iters,1);



for iter = 1:num_iters
    
    h = sigmoid(X*theta);
    
    theta = theta - (alpha/m)*(X'*(h-y));
    
  
    
    J_history(iter) = costFunction_ex2_my(X, y, theta);
    
end
end

