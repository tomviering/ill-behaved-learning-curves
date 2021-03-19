%% Figure 2
% This code produces the surfaceplot with the feature curves and learning
% curves. 

close all;
clear all;

save_to_pdf = 1; % requires export_fig to be installed in export_fig
% https://nl.mathworks.com/matlabcentral/fileexchange/23629-export_fig

use_results_long = 1; % this script requires the results file 2_peaking.mat
% long = 0: little repitions, noisy learning curves (results_fast)
% long = 1: many repitions: smooth learning curves (results_long)

%% Init and get data

if use_results_long
    rmpath('results_fast'); 
    addpath('results_long'); 
else
    addpath('results_fast'); 
    rmpath('results_long');  
end

load('2_peaking.mat','error');
%load('2_peaking.mat','error','error_exact');
E = squeeze(mean(error));
% E is the error matrix that adheres to
% E(ind_d,ind_n), where ind_d = d, and ind_n*2 = n

%% settings

lw = 2; % linewidth

% learning curve
d_learning_curve = 70;

% feature curve
ind_feature_curve = 25;
n_feature_curve = ind_feature_curve*2;

% x-ticks, y-ticks
x_ticks = 20:20:160;
y_ticks = 10:10:100;
x_ticks_routes = 40:40:160;
y_ticks_routes = 20:20:100;

%% plot the contour

figure;
%level_list = [0.0155 0.0500 0.1000 0.1500 0.2000 0.2500 0.3000 0.3500];
level_list = [0 0.0500 0.1000 0.1500 0.2000 0.2500 0.3000, 0.3500];

% values for the plot
X = repmat(1:size(E,2),size(E,1),1)*2;
Y = repmat((1:size(E,1))',1,size(E,2));
x_learning_curve = (1:size(E,2))*2;
x_feature_curve = 1:size(E,1);

% plot it
plt_main = subplot(2,2,1);
[c,h_cont] = contourf(X,Y,E,level_list);

% make-up
xlabel('n')
ylabel('d')
colorbar
title('contour plot of error rate')
set(gca,'XTick',x_ticks)
set(gca,'YTick',y_ticks)

%% compute learning curves

C = colororder; % use the colors in C for the line plots

% fixed learning curve
learning_curve = E(d_learning_curve,:);

% optimal learning curve
[learning_curve_optimal,d_optimal_learning_curve] = min(E);

%% plot learning curves (bottom)

plt_bot = subplot(2,2,3);

% plot learning curves
h_optlc = plot(x_learning_curve,learning_curve_optimal,'color',C(1,:),'linewidth',lw);
hold on;
h_lc = plot(x_learning_curve,learning_curve,'color',C(2,:),'linewidth',lw);

% make-up
xlim([1,x_learning_curve(end)])
xlabel('n')
ylabel('error rate')
title('learning curve')
legend([h_optlc,h_lc],'optimal d',sprintf('d = %d',d_learning_curve))
set(gca,'Box','off')
set(gca,'XTick',x_ticks)
text(45,0.45,'Peaking')

%% compute feature curves

% fixed feature curve
feature_curve = E(:,ind_feature_curve)';

% optimal feature curve
[feature_curve_optimal,ind_optimal_feature_curve] = min(E');
n_optimal_feature_curve = ind_optimal_feature_curve*2;

%% plot feature curves (right)

plt_right = subplot(2,2,2);

% plot feature curves
h_optfc = plot(feature_curve_optimal,x_feature_curve,'color',C(3,:),'linewidth',lw);
hold on
h_fc = plot(feature_curve,x_feature_curve,'color',C(4,:),'linewidth',lw);

% make-up
ylim([1,x_feature_curve(end)])
ylabel('d')
xlabel('error rate')
title('feature curve')
legend([h_optfc,h_fc],'optimal n',sprintf('n = %d',n_feature_curve))
set(gca,'Box','off')
set(gca,'YTick',y_ticks)
htxt = text(0.4,80,'Double Descent');
set(htxt,'Rotation',-90);

%% plot curve routes (bottom right)

plt_bottomright = subplot(2,2,4);

% plot the curve routes
r_optlc = plot(x_learning_curve,d_optimal_learning_curve,'color',C(1,:),'linewidth',lw);
hold on;
r_lc = plot(x_learning_curve,repmat(d_learning_curve,1,length(x_learning_curve)),'color',C(2,:),'linewidth',lw);
r_optfc = plot(n_optimal_feature_curve,x_feature_curve,'color',C(3,:),'linewidth',lw);
r_fc = plot(repmat(n_feature_curve,1,length(x_feature_curve)),x_feature_curve,'color',C(4,:),'linewidth',lw);

% make-up
xlim([1,x_learning_curve(end)])
ylim([1,x_feature_curve(end)])
xlabel('n')
ylabel('d')
title('curve routes')
set(gca,'XTick',x_ticks_routes)
set(gca,'YTick',y_ticks_routes)
legend([r_optlc,r_lc,r_optfc,r_fc],'optimal d',sprintf('learning curve d = %d',d_learning_curve),'optimal n',sprintf('feature curve n = %d',n_feature_curve),'Location','SouthEast')

%% resize subplots

offset = 0.1;
pad = 0.1;
MW = 0.5; % main figure width
MH = 0.5; % 
OH = 0.2; % side figure height / width
totalwidth = offset+MW+pad+OH+offset;
totalheight = offset+MH+pad+OH+offset;

set(plt_main,'Position',[offset,offset+OH+pad,MW,MH]);
set(plt_bot,'Position',[offset,offset,MW,OH])
set(plt_right,'Position',[offset+MW+pad,offset+OH+pad,OH,MH]);
set(plt_bottomright','Position',[offset+MW+pad,offset,OH,OH]);

%% final make-up

set(gcf,'Color','white')
get(gcf,'Position')
w = 600;
h = w*1.3;
set(gcf,'Position',[400,100,400+w,100+h]);

%% save to pdf

if (save_to_pdf == 1)
    addpath('export_fig');
    export_fig figures/figure2.pdf
end

