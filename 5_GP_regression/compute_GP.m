function compute_GP(rep, n_trn_try)

global result_path;

rng(1); % reproduceable
loss = nan(rep,length(n_trn_try));

tic

for rep_i = 1:rep
    fprintf('gaussian process rep %d of %d\n',rep_i,rep);

    d = 10;
    n = 2000;

    x = sign(randn(n,d));

    meanfunc = @meanConst; hyp_teacher.mean = [0];
    covfunc = @covSEiso; ell = sqrt(d); sf = 1; hyp_teacher.cov = log([ell; sf]);
    likfunc = @likGauss; sn = 1; hyp_teacher.lik = log(sn);

    hyp_student = hyp_teacher;
    hyp_student.lik = log(10^(-2)); % corresponds to sigma_n^2 = 1e-4
    hyp_student.cov = log([2*sqrt(d), sf]);

    K = feval(covfunc, hyp_teacher.cov, x);
    mu = feval(meanfunc, hyp_teacher.mean, x);

    f_true = mvnrnd(mu,K,1)';
    y = f_true + exp(hyp_teacher.lik)*randn(n, 1);

    for n_trn_i = 1:length(n_trn_try)
        
        n_trn = n_trn_try(n_trn_i);

        x_trn = x(1:n_trn,:);
        y_trn = y(1:n_trn,:);
        x_tst = x(n_trn+1:end,:);
        y_tst = y(n_trn+1:end,:);

        f_tst = f_true(n_trn+1:end,:);

        [~, ~, f_pred, ~] = gp(hyp_student, @infGaussLik, meanfunc, covfunc, likfunc, x_trn, y_trn, x_tst);

        loss(rep_i,n_trn_i) = mean((f_tst - f_pred).^2);
        
    end
end

timetaken = toc;

save(sprintf('%s/5_GP_regression.mat',result_path),'loss','n_trn_try','timetaken');
