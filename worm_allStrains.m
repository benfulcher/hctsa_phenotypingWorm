% worm_allStrains
% script to compare all strains of worm

theGroups = {'H','N2','dpy','trp','unc','unc_38'}; % this is all of them.
theFiltering = 'both'; % 'neither', 'locdep', 'lengthdep', 'both'
[normalizedFileName,filteredFileName] = doFilter(theGroups,theFiltering);

% Focus on classification ability:
TS_classify(normalizedFileName)

TS_TopFeatures(filteredFileName,'svm_linear',1,'numHistogramFeatures',20)
% TS_TopFeatures(filteredFileName,'fast_linear',1,'numHistogramFeatures',20)
