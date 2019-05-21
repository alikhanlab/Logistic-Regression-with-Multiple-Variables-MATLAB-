
%% EX2 Logistic Regression

%% 1.1 Visualizing the data
data = load('ex2data1.txt');
X = data(:, [1:2]);
y = data(:, 3);

disp('Visualizing the data...')
plotData(X, y);


%% 1.2.1 Signoid fun function

% The Logistic Regression Hypothesis use signoid function

disp('The sigmoid value of 0 is expected : 0.5')
sigmoid(0)

%% 1.2.2 Cost function

%Size of a features matrix
[m, n] = size(X);

% Add ones to the first column to compute cost
X = [ones(m,1) X];

theta = zeros(n+1,1);

J = costFunction_ex2_my(X, y, theta);
fprintf('Expected cost with initial theta expected: 0.693\n');
fprintf('Actual cost from program: %f\n', J);


%% 1.2.3 Gradient descent

alpha = 1;
num_iters = 1000;

data1 = load('ex2data1.txt');
X = data1(:,[1:2]);
[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];

[theta, J_history] = gradientDescent_ex2_my(X, y, theta, alpha, num_iters);

fprintf('Expected theta (approx):\n');
fprintf(' -25.161\n 0.206\n 0.201\n');

fprintf('Actual theta from program:\n')
fprintf(' %f \n', theta);

cost = costFunction_ex2_my(X, y, theta);
disp('Cost at theta found by gradient descent')
disp(cost)
fprintf('Expected cost (approx): 0.203\n');

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');


%% Predict and Accuracy
exam1 = (45 - mu(1,1))/sigma(1,1); 
exam2 = (85 - mu(1,2))/sigma(1,2);

prob = sigmoid([1 exam1 exam2]*theta);
fprintf(['For a student with scores 45 and 85, we predict an admission ' ...
         'probability of %f\n'], prob);
fprintf('Expected value: 0.775 +/- 0.002\n\n');

% Compute accuracy on our training set
p = predict(X, theta);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('Expected accuracy (approx): 89.0\n');
fprintf('\n');

%% Plotting Decision Boundary
plotDecisionBoundary(theta, X, y);


