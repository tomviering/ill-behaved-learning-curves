function plot_GP()

load('5_GP_regression.mat','loss','n_trn_try');
plot(log10(n_trn_try),mean(loss))
