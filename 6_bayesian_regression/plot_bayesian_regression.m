function plot_bayesian_regression()

load('6_bayesian_regression.mat','square_risk');
res = mean(square_risk,2);
%figure; 
plot(res) % bayes 