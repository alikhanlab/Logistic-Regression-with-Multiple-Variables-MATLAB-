function [X, mu, sigma] = featureNormalize(X)

X = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));



mu = mean(X);


sigma = std(X);


X = (X - mu) ./ sigma;





% ============================================================

end