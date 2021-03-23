function download_dependencies(to_install)
% downloads and extracts the matlab dependencies for the experiments
% and adds them to the matlab path
% 
% 'prtools': matlab pattern recognition toolbox - prtools.net (4 mb)
% 'riskmt': risk monotonicity  - https://github.com/tomviering/RiskMonotonicity/ (20kb)
% 'gpml': gaussian process toolbox - http://gaussianprocess.org/gpml/ (3mb) 
% 'makingmt': making monotone IDA - https://github.com/tomviering/monotone/ (20mb)
% 'author_results': downloads the author results for all experiments (80mb)
%
% 'all': downloads everything

install_all = strcmp(to_install,'all');
install_prtools = strcmp(to_install,'prtools') || install_all;
install_riskmt = (strcmp(to_install,'riskmt')) || install_all;
install_gpml = (strcmp(to_install,'gpml')) || install_all;
install_makingmt = (strcmp(to_install,'makingmt')) || install_all;
install_author_results = (strcmp(to_install,'author_results')) || install_all;
install_export_fig = strcmp(to_install,'export_fig') || install_all;

prtools_installed = exist('prtools','dir');
riskmt_installed = exist('RiskMonotonicity-master','dir');
gpml_installed = (exist('gpml-matlab-v4.2-2018-06-11','dir'));
makingmt_installed = (exist('monotone-master','dir'));
author_results_installed = exist('results_fast','dir') && exist('results_long','dir');
export_fig_installed = exist('export_fig-master'); 

if (install_prtools)&&(prtools_installed)
    fprintf('prtools already downloaded and extracted.\n');
    addpath('prtools');
    fprintf('prtools added to path.\n');
end

if (install_prtools)&&(~prtools_installed)
    fprintf('downloading and extracting prtools....\n');
    
    url_prtools = 'http://prtools.tudelft.nl/files/prtools.zip';
    fn_prtools = 'prtools.zip';
    dir_prtools = 'prtools';
    
    websave(fn_prtools, url_prtools);
    unzip(fn_prtools, dir_prtools);
    delete(fn_prtools);
    
    addpath('prtools');
    fprintf('prtools added to path\n');
    fprintf('done\n');
end


if install_riskmt&&riskmt_installed
    fprintf('riskmt already downloaded and extracted.\n');
    addpath('RiskMonotonicity-master');
    fprintf('riskmt added to path.\n');
end

if install_riskmt&&~riskmt_installed
    fprintf('downloading and extracting riskmt...\n');
    
    url_riskmt = 'https://github.com/tomviering/RiskMonotonicity/archive/master.zip';
    fn_riskmt = 'risk_monotonicity.zip';

    websave(fn_riskmt, url_riskmt);
    unzip(fn_riskmt);
    delete(fn_riskmt);
    
    addpath('RiskMonotonicity-master');
    fprintf('riskmt added to path.\n');
    fprintf('done\n');
end


if install_gpml&&gpml_installed
    fprintf('gpml already downloaded and extracted.\n');
    addpath('gpml-matlab-v4.2-2018-06-11');
    fprintf('gpml added to path.\n');
    startup;
end

if install_gpml&&~gpml_installed
    fprintf('downloading and extracting gpml...\n');
    
    url_gpml = 'http://gaussianprocess.org/gpml/code/matlab/release/gpml-matlab-v4.2-2018-06-11.zip';
    fn_gpml = 'gpml.zip';

    websave(fn_gpml, url_gpml);
    unzip(fn_gpml);
    delete(fn_gpml);
    
    addpath('gpml-matlab-v4.2-2018-06-11');
    fprintf('gpml added to path.\n');
    startup;
end

if install_makingmt&&makingmt_installed
    fprintf('makingmt already downloaded and extracted.\n');
    addpath('monotone-master');
    fprintf('makingmt added to path.\n');
end

if install_makingmt&&~makingmt_installed
    fprintf('downloading and extracting makingmt...\n');

    url_makingmt = 'https://github.com/tomviering/monotone/archive/master.zip';
    fn_makingmt = 'monotonicity.zip';

    websave(fn_makingmt,url_makingmt);
    unzip(fn_makingmt);
    delete(fn_makingmt);

    url_mt_results = 'http://tomviering.nl/monotone/author_results.zip';
    fn_mt_results = 'author_results_monotonicity.zip';

    websave(fn_mt_results,url_mt_results);
    unzip(fn_mt_results,'monotone-master');
    delete(fn_mt_results);
    
    addpath('monotone-master');
    fprintf('makingmt added to path.\n');
    fprintf('done\n');
end

if install_author_results&&~author_results_installed
    fprintf('downloading and extracting author results...\n');
    
    url_author = 'http://tomviering.nl/survey/author_results.zip';
    fn_author = 'author_results.zip';
    
    websave(fn_author,url_author);
    
    unzip(fn_author);
    delete(fn_author);
end

if install_author_results&&author_results_installed
    fprintf('author results directory already exists\n');
    fprintf('assuming they are already installed, skipping...\n');
    
end

if install_export_fig && ~export_fig_installed
    fprintf('downloading and extracting export_fig...\n');
    
    url_exportfig = 'https://github.com/altmany/export_fig/archive/refs/heads/master.zip';
    unzip(url_exportfig);
    
    addpath('export_fig-master');
    fprintf('export_fig added to path.\n');
    fprintf('done\n');
    
end

if install_export_fig && export_fig_installed
    fprintf('export_fig already downloaded and extracted.\n');
    addpath('export_fig-master');
    fprintf('export_fig added to path.\n');
    
end


    
    
    

