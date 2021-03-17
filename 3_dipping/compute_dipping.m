function compute_dipping(nrep,n)
% nrep: number of repitions
% n: list of samples PER CLASS

global result_path;

rng(1); % reproduceable
% stratified sampling of the test set to improve estimation of the test
% error
[Xtst, Ytst] = dipping_dataset_stratified(1000);
tst = prdataset(Xtst, Ytst);

error = nan(nrep,length(n));

prwaitbar OFF

tic
for rep = 1:nrep
    fprintf('dipping rep %d of %d\n',rep,nrep);
    for ni = 1:length(n)
        ntemp = n(ni);

        % for the training set you can also use stratified sampling,
        % this does change the shape of the resulting learning curve.
        % however, we find non-stratified sampling with equal class priors
        % more natural, which is what is used here. 
        [X, Y] = dipping_dataset(ntemp);
        trn = prdataset(X, Y);

        w = nmc(trn); % nearest mean classifier

        error(rep,ni) = testd(tst*w); 

    end
end    

timetaken = toc;

save(sprintf('%s/3_dipping.mat',result_path),'error','n','timetaken');
