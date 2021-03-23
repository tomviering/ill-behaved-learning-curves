% This script runs all experiments and saves the results to disk.
% It also shows some simple plots to visualize the results
% NOTE: this script takes long to run (~6 hours) because many 
% repititions are used to obtain smooth learning curves
close all;
clear all;

% each cell indicates the computation time (5 min, 2 hours, etc.)
mkdir('results_long');
rmpath('results_fast');
addpath('results_long');
global result_path; % this global controls where the compute functions (compute_phasetransition, compute_peaking, etc.)
% store the result files. 
result_path = 'results_long';

%% paths

addpath('1_phasetransition');
addpath('2_peaking');
addpath('3_dipping');
addpath('4_monotonicity');
addpath('5_GP_regression');
addpath('6_bayesian_regression');
addpath('7_perfect_prior');
addpath('8_making_monotone');

%% 1. phase transition (3 min)

download_dependencies('prtools')

n = [2:5:100];
nrep = 100; % 100 was used in the paper
compute_phasetransition(nrep, n)

%% 1. phase transition - plot

figure;
load('1_phasetransition.mat','E');
plot(E.xvalues, E.error)
xlabel('n');
ylabel('error rate');
title('1. phase transition');



%% 2. peaking (2 hours)

nrep = 1000; % 1000 used in paper
n = 81; % per class
compute_peaking(nrep, n);

%% 2. peaking - plot

load('2_peaking.mat','error');
E = squeeze(mean(error));
learning_curve = E(100,:);
figure;
plot(learning_curve);
xlabel('n per class');
ylabel('error rate');
title('2. peaking learning curve');

%% 2. peaking - surfaceplot

load('2_peaking.mat','error');
E = squeeze(mean(error));

figure;

% values for the plot
X = repmat(1:size(E,2),size(E,1),1)*2;
Y = repmat([1:size(E,1)]',1,size(E,2));
x_learning_curve = [1:size(E,2)]*2;
x_feature_curve = 1:size(E,1);

% plot it
[c,h] = contourf(X,Y,E);

% make-up
xlabel('n')
ylabel('d')
title('2. peaking surface plot');



%% 3. dipping (3 hours)
% trains a nearest-mean classifier on the distribution of figure 4.

download_dependencies('prtools')

n = unique(round(logspace(0,3,60)));
nrep = 10000; % 10000 used in paper
compute_dipping(nrep,n);

%% 3. dipping - plot

load('3_dipping','error','n');
figure; 
plot(log10(n),mean(error));
xlabel('log(n)');
ylabel('error rate');
title('3. dipping');



%% 4. monotonicity (1 sec)
% we use the code provided by the paper, which can be found here:
% https://github.com/tomviering/RiskMonotonicity/
% for more details, see this repo.

download_dependencies('riskmt')
addpath('RiskMonotonicity-master');

% square loss experiment
n = 40; % max number of training samples 
q = 0.00001; % probability of observing a
lambda = 0; % regularizer
Rsq = do_exp_general(n, q, lambda, 'sqr');

% absolute loss experiment
n = 40; 
q = 0.1;
lambda = 0;
Rabs = do_exp_general(n, q, lambda, 'abs');

%% 4. monotonicity - square loss plot
figure;
plot(Rsq);
xlabel('n');
ylabel('square loss');
title('4. monotonicity');

%% 4. monotonicity - absolute loss plot
figure;
plot(Rabs);
xlabel('n');
ylabel('absolute loss');
title('4. monotonicity');



%% 5. GP regression (1 hour)

download_dependencies('gpml')
n = unique(round(logspace(0,3,60)));
nrep = 1000; % 1000 in paper
compute_GP(nrep, n);

%% 5. GP regression - plot

load('5_GP_regression.mat','loss','n_trn_try');
figure;
plot(log10(n_trn_try),mean(loss))
xlabel('log(n)');
ylabel('squared loss');
title('5. GP regression');



%% 6. Bayesian regression (2 min)

n = 500;
nrep = 50;
compute_bayesian_regression(nrep, n);

%% 6. Bayesian regression - plot

load('6_bayesian_regression.mat','square_risk');
figure;
plot(mean(square_risk,2)) 
xlabel('n');
ylabel('squared loss');
title('6. Bayesian regression');


%% 7. perfect prior (1 sec)

n = 30;
nrep = 10000;
compute_perfect_prior(nrep, n);

%% 7. perfect prior - plot

load('7_perfect_prior','NLL');
figure;
plot(mean(NLL));
xlabel('n');
ylabel('negative log likelyhood');
title('7. perfect prior');


%% 8. making monotone 
% https://github.com/tomviering/monotone/
% we use the provided author results of this paper.
% for actually reproducing these experiments, see the above github repo.

% note: the current working directory of Matlab needs to be the root folder
% otherwise this piece of code doesn't work.

download_dependencies('makingmt')

figure;
plot_making_monotone()
xlabel('n');
ylabel('error rate');
title('8. making monotone');

