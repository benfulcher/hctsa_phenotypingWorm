% Understand some selected features in more detail:

%-------------------------------------------------------------------------------
% Preliminary labeling, filtering, normalization
theGroups = {'H','N2','dpy_20','unc_9','unc_38'}; % this is all of them.
theFiltering = 'neither'; % 'neither', 'locdep', 'lengthdep', 'both'
[normalizedFileName,filteredFileName] = doFilter(theGroups,theFiltering);
numClasses = length(theGroups);

%-------------------------------------------------------------------------------
% Plot class distributions for some selected features

featIDs = [6991,... % ARMA model prediction
           7484,...
           7586,...
           4458,...
           7777]; % SD1 HRV measure

for i = 1:length(featIDs)
    TS_SingleFeature(filteredFileName,featIDs(i));
end
