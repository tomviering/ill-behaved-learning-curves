function plot_making_monotone()

% add required paths
addpath('monotone-master/exp')
addpath('monotone-master/exp/helpers')
addpath('monotone-master/figures')

% we need to go to this directory
cd('monotone-master/figures');

save_to_file = 0;
dat_id = 5; % 5 = MNIST

% load the relevant experiment settings
load('e14_settings')
load('e19_settings')
settings_obj{5} = MNIST19_settings;

count_validation_data = 1;

[settings,r] = load_all(settings_obj{dat_id}); % get settings
r = filterruns(r,1:100); % get results
%listlearners(r)

% correct the x-axis 
if (dat_id ~= 4)&&(dat_id ~= 5) %MNIST didnt do stratified sampling ;)
    r.xval = r.xval*2;
    r.xval2 = r.xval2*2;
end

% make plots
blue = addtoplot(r,1,'',count_validation_data,'-'); % PFLD
red = addtoplot(r,3,'',count_validation_data,'-'); % Wrapper (MT_HT)

set(get(gca,'Children'),'LineWidth',2)

legend off

% put text in figure
text(575, 0.8, 'PFLD', 'Color', blue.Color)
text(630, 0.5, 'Wrapper', 'Color', red.Color)

% go to original directory
cd('..');
cd('..');