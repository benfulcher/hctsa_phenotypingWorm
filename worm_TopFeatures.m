% Understand some selected features in more detail:

%-------------------------------------------------------------------------------
% Preliminary labeling, filtering, normalization
theGroups = {'H','N2','dpy_20','unc_9','unc_38'}; % this is all of them.
theFiltering = 'neither'; % filter out features that are location or length-dependent:
                          % 'neither', 'locdep', 'lengthdep', 'both'
[~,filteredFileName] = doFilter(theGroups,theFiltering);
filteredData = load(filteredFileName);

%-------------------------------------------------------------------------------
% Plot class distributions for some selected features
featIDs = [16,... % RMS
           6574,... % Wavelet measure quite specific to unc-9
           4199]; % detrended fluctuation analysis

for i = 1:length(featIDs)
    TS_SingleFeature(filteredData,featIDs(i),1,1);
end

%-------------------------------------------------------------------------------
% The feature of interest in Figure:
featID = 2748; % multiscale SampEn
TS_SingleFeature(filteredData,featID,1,1);

%-------------------------------------------------------------------------------
% Compare to class distributions of mean speed:
load(filteredFileName,'Operations');
isMean = find(strcmp({Operations.Name},'mean'));
TS_SingleFeature(filteredData,isMean,1,1);
ylim([0,250])
