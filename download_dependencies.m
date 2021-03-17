function download_dependencies(to_install)
% downloads and extracts the matlab dependencies for the experiments
% and adds them to the matlab path
% 
% 'prtools': matlab pattern recognition toolbox - prtools.net (4 mb)
% 'riskmt': risk monotonicity  - https://github.com/tomviering/RiskMonotonicity/ (20kb)
% 'gpml': gaussian process toolbox - http://gaussianprocess.org/gpml/ (3mb) 
% 'makingmt': making monotone IDA - https://github.com/tomviering/monotone/ (20mb)
% 'all'

if (strcmp(to_install,'prtools'))&&(exist('prtools','dir'))
    fprintf('prtools already downloaded and extracted.\n');
    addpath('prtools');
    fprintf('prtools added to path.\n');
    return;
end

if (strcmp(to_install,'prtools'))||(strcmp(to_install,'all'))
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


if (strcmp(to_install,'riskmt'))&&(exist('RiskMonotonicity-master','dir'))
    fprintf('riskmt already downloaded and extracted.\n');
    addpath('RiskMonotonicity-master');
    fprintf('riskmt added to path.\n');
    return;
end

if (strcmp(to_install,'riskmt'))||(strcmp(to_install,'all'))
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


if (strcmp(to_install,'gpml'))&&(exist('gpml-matlab-v4.2-2018-06-11','dir'))
    fprintf('gpml already downloaded and extracted.\n');
    addpath('gpml-matlab-v4.2-2018-06-11');
    fprintf('gpml added to path.\n');
    startup;
    return;
end

if (strcmp(to_install,'gpml'))||(strcmp(to_install,'all'))
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

if (strcmp(to_install,'makingmt'))&&(exist('monotone-master','dir'))
    fprintf('makingmt already downloaded and extracted.\n');
    addpath('monotone-master');
    fprintf('makingmt added to path.\n');
    return;
end

if (strcmp(to_install,'makingmt'))||(strcmp(to_install,'all'))
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
    fprintf('done');
end


