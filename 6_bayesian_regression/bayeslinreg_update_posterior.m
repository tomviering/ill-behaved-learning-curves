function [mu_star, V_star, a_star, b_star,sigma_hat_squared_star] = bayeslinreg_update_posterior(mu, V, a, b, X, y)
% mu, old mean
% V, old precision
% a, b parameters of the inverse gamma distribution
% X, y observations

n = size(X,1);

V_star = (V + (X'*X)); 
mu_star = V_star\(V*mu + X'*y);
a_star = a + n/2;
b_star = b + 0.5*(y'*y + mu'*V*mu - mu_star'*V_star*mu_star);

sigma_hat_squared_star = b_star/(a_star - 1);

end





