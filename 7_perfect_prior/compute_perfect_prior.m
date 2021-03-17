function compute_perfect_prior(rep, n)

rng(1); % reproduceable

global result_path;

NLL = nan(rep,n);

tic

for rep_i = 1:rep

    fprintf('perfect prior rep %d of %d\n',rep_i,rep);
    % init prior
    a = 1;
    b = 1;

    for i = 1:(n+1)

        % i == 1: corresponds with the performance
        % with no data (n = 0)
        % so we do not update the parameters if i == 1:
        if (i > 1)
            heads = rand(1,1) > 0.5;
            if heads
                a = a+1;
            else
                b = b+1;
            end
        end

        % prediction
        posterior_heads = a/(a+b);

        % performance
        NLL(rep_i,i) = -1/2 * log(posterior_heads) - 1/2 * log(1-posterior_heads);
    end
end

timetaken = toc;

save(sprintf('%s/7_perfect_prior',result_path),'NLL','timetaken');

