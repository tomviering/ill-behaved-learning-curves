%% Figure 3
% This code produces the 8 ill behaving learning curves. 

%% Init and get data

close all;
clear all;

save_to_pdf = 0; % requires export_fig to be installed in export_fig
% https://nl.mathworks.com/matlabcentral/fileexchange/23629-export_fig

use_panel = 0; % makes the fancy plot as per the paper
% requires panel to be installed in directory panel-2.14
% you can find it at 
% https://nl.mathworks.com/matlabcentral/fileexchange/20003-panel

use_results_long = 1; % this script requires all result files
% long = 0: little repitions, noisy learning curves (results_fast)
% long = 1: many repitions: smooth learning curves (results_long)

%% Set result directory

if use_results_long
    rmpath('results_fast'); 
    addpath('results_long'); 
else
    addpath('results_fast'); 
    rmpath('results_long');  
end

%% Add required scripts to path

addpath('1_phasetransition');
addpath('2_peaking');
addpath('3_dipping');
addpath('4_monotonicity');
addpath('5_GP_regression');
addpath('6_bayesian_regression');
addpath('7_perfect_prior');
addpath('8_making_monotone');

addpath('helpers'); 

if use_panel
    addpath('panel-2.14'); 
end

%% start fancy plot
figure;

numrow = 4; 
numcol = 2;
show_x_label = 1; % whether to show the xlabel (makes figure a bit cluttered...)
hide_xtick = 1;
hide_ytick = 1;
ts = 0.01; % ticksize x axis

if use_panel
    % panel is similar to subplot but can easily decrease margins:
    p = panel();
    p.pack(numrow, numcol);
else
    subplot(4,2,1);
end

% plot counter
numplot = 0;

% phase transition
if use_panel
    p(floor(numplot/2)+1,mod(numplot,2)+1).select();
else
    subplot(4,2,numplot+1);
end
plot_phasetransition()
title('Phase Transition (6.1)')
xlabel_hided('n', show_x_label);
ylabel('(PA) error');
ylim([-0.01, 0.6]);
vertline(49.5,'k:')
numplot = numplot + 1;
ax = gca;
ax.TickLength = [ts 0.035];

% peaking
if use_panel
    p(floor(numplot/2)+1,mod(numplot,2)+1).select();
else
    subplot(4,2,numplot+1);
end
plot_peaking();
title('Peaking (6.2)');
xlabel_hided('n', show_x_label);
ylabel('error / sq. loss')
xlim([0,81]);
%ylim([0.42, 0.5]);
vertline(40,'k:') % vertical line
numplot = numplot + 1;
ax = gca;
ax.TickLength = [ts 0.035];


% dipping
if use_panel
    p(floor(numplot/2)+1,mod(numplot,2)+1).select();
else
    subplot(4,2,numplot+1);
end
plot_dipping(); 
title('Dipping (6.3)');
xlabel_hided('log n', show_x_label);
ylabel('error')
numplot = numplot + 1;
ax = gca;
ax.TickLength = [ts 0.035];



% monotonicity
if use_panel
    p(floor(numplot/2)+1,mod(numplot,2)+1).select();
else
    subplot(4,2,numplot+1);
end
ph1 = plot_monotonicity1();
hold on;
ph2 = plot_monotonicity2();
xlabel_hided('n', show_x_label);
ylim([-0.1,1.1]);
% add text to indicate the setting:
text(15,0.89,'sq. loss','Color',ph1.Color)
text(27,0.55,'abs. loss','Color',ph2.Color)
title('Monotonicity (6.4)');
numplot = numplot + 1;
ax = gca;
ax.TickLength = [ts 0.035];



% GP mismatch
if use_panel
    p(floor(numplot/2)+1,mod(numplot,2)+1).select();
else
    subplot(4,2,numplot+1);
end
plot_GP();
title('GP Regression (6.5)');
xlabel_hided('log n', show_x_label);
ylabel('PA sq. loss');
numplot = numplot + 1;
ax = gca;
ax.TickLength = [ts 0.035];
ax = gca;
ax.TickLength = [ts 0.035];


% safebayes
if use_panel
    p(floor(numplot/2)+1,mod(numplot,2)+1).select();
else
    subplot(4,2,numplot+1);
end
plot_bayesian_regression();
title('Bayesian Regression (6.6)')
xlabel_hided('n', show_x_label);
ylabel('sq. loss');
xlim([0,500]);
numplot = numplot + 1;
ax = gca;
ax.TickLength = [ts 0.035];



% perfect prior
if use_panel
    p(floor(numplot/2)+1,mod(numplot,2)+1).select();
else
    subplot(4,2,numplot+1);
end
plot_perfect_prior();
title('Perfect Prior (6.7)')
xlabel_hided('n', show_x_label);
ylabel('NLL');
xlim([-3,30]);
numplot = numplot + 1;
ax = gca;
ax.TickLength = [ts 0.035];

% monotonify
if use_panel
    p(floor(numplot/2)+1,mod(numplot,2)+1).select();
else
    subplot(4,2,numplot+1);
end
plot_making_monotone();
title('Making Monotone (6.8)')
xlabel_hided('n', show_x_label);
ylabel('error');
%xlim([-3,30]);
numplot = numplot + 1;
ax = gca;
ax.TickLength = [ts 0.035];

% set figure in fixed position so its reproduceable
set(gcf,'Position',[724 60 826 899]);
set(gcf,'Position',[   724   300   442   659]);

% make lines thicker
lines = findobj(gcf,'Type','Line');
for i = 1:numel(lines)
    if lines(i).LineStyle == ':'
        lines(i).LineWidth = 0.5;
    else
        lines(i).LineWidth = 1.5;
    end
end

% remove the yticks and xticks 
axes_found = findobj(gcf,'Type','Axes');
for i = 1:numel(axes_found)
    if hide_xtick == 1
        %axes(i).XTick = [];
        axes_found(i).XTickLabel = [];
    end
    if hide_ytick == 1
        axes_found(i).YTick = [];
        axes_found(i).YTickLabel = [];
    end
end
    
% make margins a bit smaller
if use_panel
    p.margin = [10 15 10 5];
end

% set white bg
set(gcf,'Color','white');

%% create invisible axes
ax1 = axes('Position',[0 0 1 1],"Color","none")
set(ax1,'XTick',[])
set(ax1,'YTick',[])
set(ax1,'XColor','white');
set(ax1,'YColor','white');

xlim([0,1]);
ylim([0,1]);

%% misspecification box
xmin = 0.03;
ymin = 1/4+0.02+0.025;
width = 0.92;
height = 1/2-0.05+0.025;

if (exist('r'))
    delete(r)
    delete(mytxt)
end
c_orange = [255/255, 153/255, 51/255];
c_purple = [1, 153/255, 204/255];
c_blue = [139, 185, 226]/255;
r = rectangle('Position',[xmin,ymin,width,height],'Curvature',0,'LineWidth',1,'EdgeColor', c_blue)
mytxt = text(xmin+width+0.02,0.5,'MODEL MISSPECIFICIED','HorizontalAlignment','center','FontWeight','bold','Color',c_blue)
set(mytxt,'Rotation',90);
%set(mytxt,'BackgroundColor','white');
uistack(r,'bottom')

%% flip plotting order
c = get(gcf, 'Children')
set(gcf,'Children',flipud(c));

%%
if save_to_pdf 
    addpath('export_fig');
    export_fig figures/figure3.pdf
end