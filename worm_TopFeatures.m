% Understand some selected features in more detail:

%-------------------------------------------------------------------------------
% Preliminary labeling, filtering, normalization
theGroups = {'H','N2','dpy_20','unc_9','unc_38'}; % this is all of them.
theFiltering = 'neither'; % 'neither', 'locdep', 'lengthdep', 'both'
[~,filteredFileName] = doFilter(theGroups,theFiltering);
filteredData = load(filteredFileName);

%-------------------------------------------------------------------------------
% Plot class distributions for some selected features

featIDs = [16,... % RMS
            6604,... % particularly distinguishes unc-9
            2742,... % multiscale SampEn
           3179,... % Distribution fit
           4194,... % detrended fluctuation analysis
           7777]; % SD1 HRV measure

for i = 1:length(featIDs)
    TS_SingleFeature(filteredData,featIDs(i),1,1);
end

%-------------------------------------------------------------------------------
% Compare to class distributions of mean speed:
load(filteredFileName,'Operations');
isMean = find(strcmp({Operations.Name},'mean'));
TS_SingleFeature(filteredData,isMean,1,1);
ylim([0,250])
