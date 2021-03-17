function plot_dipping()

load('3_dipping','error','n');
n = n*2; % convert per class sample size to total sample size
plot(log10(n),mean(error))

end