function compute_bayesian_regression(rep, Ntrn)

global result_path;

N = 10000; % this is the data used for training and testing,
% thus should be much larger than Ntrn
rng(1); % reproduceable
d = 25; % dimension of problem is d*2+1

% this is the example with the 
% polynomial basis 
% and without the hierachical model

% prior
a0 = 1;
b0 = 1/40;
mu0 = zeros(d*2+1,1);
sigma0 = eye(d*2+1);

% do model incorrect experiment
model_correct = 0;
square_risk = nan(Ntrn, rep);

tic

for irep = 1:rep
    fprintf('safebayes rep %d of %d\n',irep,rep);
    %Ntrn = 500;

    [X,y] = gendat_coinflip(N,d,model_correct);
    Xtst = X(Ntrn+1:end,:);
    Ytst = y(Ntrn+1:end,:);

    % init prior
    a = a0;
    b = b0;
    mu = mu0;
    sigma = sigma0;
    V = inv(sigma); % we use the precision, since more numberically stable

    % start learning
    for i_sample = 1:Ntrn

        X_sample = X(i_sample,:);
        y_sample = y(i_sample,:);
        [mu, V, a, b, sigma_hat] =...
            bayeslinreg_update_posterior(mu, V, a, b, X_sample, y_sample);
        
        Yhat = Xtst * mu; % predict
        square_risk(i_sample,irep) = mean((Yhat - Ytst).^2); % performance

    end
end

timetaken = toc;

save(sprintf('%s/6_bayesian_regression.mat',result_path),'square_risk','timetaken');
