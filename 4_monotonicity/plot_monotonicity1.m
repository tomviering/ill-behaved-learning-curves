function ph = plot_monotonicity1()

n = 40; % max number of training samples 
q = 0.00001; % probability of observing a
lambda = 0; % regularizer

[Rsq1,Rbest1] = do_exp_general(n, q, lambda, 'sqr');

%figure; 
Rsq1 = Rsq1 - min(Rsq1);
Rsq1 = Rsq1./max(Rsq1);

ph = plot(Rsq1);