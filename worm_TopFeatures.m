% Understand some selected features in more detail:

%-------------------------------------------------------------------------------
%% Preliminary labeling, filtering, normalization
theGroups = {'H','N2','dpy_20','unc_9','unc_38'}; % this is all of them.
theFiltering = 'neither'; % filter out features that are location or length-dependent:
                          % 'neither', 'locdep', 'lengthdep', 'both'
[~,filteredFileName] = doFilter(theGroups,theFiltering);
filteredData = load(filteredFileName);

%-------------------------------------------------------------------------------
%% Plot class distributions for some selected features
featIDs = [16,... % RMS
           6574,... % Wavelet measure quite specific to unc-9
           2748,... % Multiscale SampEn
           4199]; % detrended fluctuation analysis

annotateParams = struct('maxL',10000);
for i = 1:length(featIDs)
    TS_FeatureSummary(featIDs(i),filteredData,1,annotateParams)
end

%-------------------------------------------------------------------------------
%% Compare to class distributions of mean speed
% (doesn't distinguish the neural mutants)
load(filteredFileName,'Operations');
isMean = find(strcmp(Operations.Name,'mean'));
TS_SingleFeature(filteredData,isMean,true,true);
ylim([0,250])
