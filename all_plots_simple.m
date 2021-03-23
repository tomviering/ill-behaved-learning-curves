close all;
clear all;

use_results_long = 0; % this script requires all result files
% long = 0: little repitions, noisy learning curves (results_fast)
% long = 1: many repitions: smooth learning curves (results_long)

save_to_png = 1; % saves png files to figures directory

%% Set result directory

if use_results_long
    rmpath('results_fast'); 
    addpath('results_long'); 
else
    addpath('results_fast'); 
    rmpath('results_long');  
end

%% Add all other paths

addpath('1_phasetransition');
addpath('2_peaking');
addpath('3_dipping');
addpath('4_monotonicity');
addpath('5_GP_regression');
addpath('6_bayesian_regression');
addpath('7_perfect_prior');
addpath('8_making_monotone');

if save_to_png
    download_dependencies('export_fig');
    M = '-m0.5'; % scale down by factor of 2
end

%% 1. phase transition - plot

figure;
load('1_phasetransition.mat','E');
plot(E.xvalues, E.error)
xlabel('n');
ylabel('error rate');
title('1. phase transition');
if save_to_png
    export_fig('figures/1_phasetransition.png',M);
end



%% 2. peaking - plot

load('2_peaking.mat','error');
E = squeeze(mean(error));
learning_curve = E(100,:);
figure;
plot(learning_curve);
xlabel('n per class');
ylabel('error rate');
title('2. peaking learning curve');
if save_to_png
    export_fig('figures/2_peaking.png',M);
end

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

if save_to_png
    export_fig('figures/2_peaking_surface.png',M);
end



%% 3. dipping - plot

load('3_dipping','error','n');
figure; 
plot(log10(n),mean(error));
xlabel('log(n)');
ylabel('error rate');
title('3. dipping');

if save_to_png
    export_fig('figures/3_dipping.png',M);
end



%% 4. monotonicity 
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
ylabel('squared loss');
title('4. monotonicity');

if save_to_png
    export_fig('figures/4_monotonicity_squared.png',M);
end



%% 4. monotonicity - absolute loss plot
figure;
plot(Rabs);
xlabel('n');
ylabel('absolute loss');
title('4. monotonicity');

if save_to_png
    export_fig('figures/4_monotonicity_absolute.png',M);
end



%% 5. GP regression - plot

load('5_GP_regression.mat','loss','n_trn_try');
figure;
plot(log10(n_trn_try),mean(loss))
xlabel('log(n)');
ylabel('squared loss');
title('5. GP regression');

if save_to_png
    export_fig('figures/5_GP_regression.png',M);
end



%% 6. Bayesian regression - plot

load('6_bayesian_regression.mat','square_risk');
figure;
plot(mean(square_risk,2)) 
xlabel('n');
ylabel('squared loss');
title('6. Bayesian regression');

if save_to_png
    export_fig('figures/6_bayesian_regression.png',M);
end



%% 7. perfect prior - plot

load('7_perfect_prior','NLL');
figure;
plot(mean(NLL));
xlabel('n');
ylabel('negative log likelyhood');
title('7. perfect prior');

if save_to_png
    export_fig('figures/7_perfect_prior.png',M);
end



%% 8. making monotone - plot

download_dependencies('makingmt')

figure;
plot_making_monotone()
xlabel('n');
ylabel('error rate');
title('8. making monotone');

if save_to_png
    export_fig('figures/8_making_monotone.png',M);
end

