% Figure 4: this code visualizes the distribution for the dipping
% classification example. 

close all;
clear all;

save_to_pdf = 0; % requires export_fig to be installed in export_fig
% https://nl.mathworks.com/matlabcentral/fileexchange/23629-export_fig

%% 

subplot(1,2,1);

x = -3:0.01:3;

linewidth = 1.5;

c1 = and(x > -2.5,x < -1.5);
c2 = and(x > -0.5, x < 0.5);
c3 = and(x > 1.5, x < 2.5);

neg = c2;
pos = or(c1, c3);

pneg = plot(x, neg*0.5, 'LineWidth',linewidth);
hold on;
ppos = plot(x, pos*0.5*0.5, 'LineWidth',linewidth);

blue = get(pneg,'Color');
red = get(ppos,'Color');

markersize = 100;
sblue = scatter(0, 0.25*0.5,markersize, blue, '*');
sred = scatter([2], [0.25*0.5], markersize, red, '*');

model2 = plot([1, 1],[0, 1],'k:');
cols = colororder;

leg = legend([pneg, ppos, sblue, model2],'$p(x,y=+1)$','$p(x,y=-1)$','data $n=2$','model $n=2$','fontsize',10,'Interpreter','latex');

set(gca,'YTick',[0, 0.25, 0.5])
set(gcf,'color','white')

axis([-3, 3, 0, 0.5])
box off;

xlabel('x')
ylabel('density')

set(gcf,'position',[680   715   560   110]);

set(leg,'position',[0.5047    0.2586    0.2089    0.6682]);

if save_to_pdf
    addpath('export_fig');
    export_fig figures/figure4.pdf;
end



