function ph = plot_monotonicity2()

n = 40; 
q = 0.1;
lambda = 0;

[R, Rbest] = do_exp_general(n, q, lambda, 'abs');

Rsq1 = R;
Rsq1 = Rsq1 - min(Rsq1);
Rsq1 = Rsq1./max(Rsq1);

ph = plot(Rsq1);

%topright = 1;
%plot1(R,Rbest,save_to_file,'fig1b',topright)

end