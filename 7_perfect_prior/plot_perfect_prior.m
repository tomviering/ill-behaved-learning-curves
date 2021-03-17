function plot_perfect_prior()

load('7_perfect_prior','NLL');
%figure;
maxn = 30;
mNLL = mean(NLL);
plot(0:maxn,mNLL(1:(maxn+1)));

end