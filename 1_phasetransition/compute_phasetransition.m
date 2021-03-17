function compute_phasetransition(nrep, n)

global result_path;

rng(1);
D = 100; % dimensionality
N = 1e4; % number of samples in the dataset

% create synthetic dataset
a = prdataset([rand(N,D-1) -ones(N,1)/100;rand(N,D-1) ones(N,1)/100],[ones(N,1);-ones(N,1)]);
a.prior = [.5 .5];

prwaitbar REPORT
% create learning curve (takes long)

tic
E = cleval(a,fisherc,n,nrep);
timetaken = toc;

save(sprintf('%s/1_phasetransition.mat',result_path),'E','timetaken');

