function compute_peaking(REP, N_per_class)

global result_path;

rng(1);

d_original = 100;

N_test_per_class = 1000;

distance = 6; % distance between the two standard Gaussians their means
distance_half = distance/2;
distance_per_dim = distance_half/sqrt(d_original);

Xtest_neg = randn(N_test_per_class,d_original) + distance_per_dim;
Xtest_pos = randn(N_test_per_class,d_original) - distance_per_dim;

% this should be equal to the value in distance
check_distance = sqrt(sum((mean(Xtest_neg)-mean(Xtest_pos)).^2));

error = nan(REP,d_original,N_per_class);
error_exact = nan(REP,d_original,N_per_class);

tic
for rep = 1:REP
    fprintf('rep %d\n',rep);
    X_neg = randn(N_per_class,d_original) + distance_per_dim;
    X_pos = randn(N_per_class,d_original) - distance_per_dim;
    
    for d = 1:d_original
        
        for n = 1:N_per_class
            
            X = [X_neg(1:n,1:d);X_pos(1:n,1:d)];
            Y = [-ones(n,1);+ones(n,1)];
            w = lsqminnorm(X'*X,X'*Y);
            
            Ytest_neg_pred = Xtest_neg(:,1:d)*w;
            Ytest_pos_pred = Xtest_pos(:,1:d)*w;
            
            error_temp = (sum(Ytest_neg_pred >= 0) + sum(Ytest_pos_pred <= 0))/(N_test_per_class * 2);
            
            error(rep,d,n) = error_temp;
            error_exact(rep,d,n) = 0.5 + 0.5*erf((ones(1,d)*distance_per_dim*w)/(sqrt(2)*norm(w)));
            
        end
        
    end
    
end

timetaken = toc;
save(sprintf('%s/2_peaking.mat',result_path),'error','error_exact','timetaken');







