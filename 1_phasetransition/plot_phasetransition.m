function plot_phasetransition()

load('1_phasetransition.mat','E');
plot(E.xvalues, E.error)
