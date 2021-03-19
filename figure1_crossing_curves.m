% Figure1: learning curves that cross
% and have the exactly the same AULC
% these learning curves are 'made up' and do not correspond
% to actual learning curves generated on data,
% since they are only used as illustration

close all;
clear all;

save_to_pdf = 1; % requires export_fig to be installed in export_fig
% https://nl.mathworks.com/matlabcentral/fileexchange/23629-export_fig

%%

x = 10:100;
lw = 2;

y1 = x.^(-0.25)+0.3-0.4+0.11+0.0042;
y2 = (x*1000).^(-0.3)+0.6-0.4+0.1-0.05+0.11-0.0003;

y1trn = 1-y1.*0.25-0.65;
y2trn = 1-y2-0.22;

AULC_y1 = mean(y1);
AULC_y2 = mean(y2);
% note that the means are _exactly_ equal, and thus, in this case,
% the AULC cannot help us distuinguish these curves

figure;
fh1 = plot(x,y1,'LineWidth',lw);
blue = fh1.Color;
hold on;
fh2 = plot(x,y2,'LineWidth',lw);
red = fh2.Color;

xlabel('n','fontsize',16)
ylabel('error rate','fontsize',16)

axis([10 100 0.3 0.6])

set(gca,'XTick', [50, 100])
set(gca,'Ytick', [0.2, 0.4, 0.6])

a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',12)
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',12)

set(gcf,'color','white')
box off

set(gcf,'Position',[680   735   427   243])

if (save_to_pdf == 1)
    addpath('export_fig');
    export_fig figures/figure1.pdf
end
