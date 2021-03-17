function plot_peaking()

load('2_peaking.mat','error');
E = squeeze(mean(error));
learning_curve = E(80,:);
plot(learning_curve);

