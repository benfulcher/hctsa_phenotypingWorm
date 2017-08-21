%-------------------------------------------------------------------------------
%% PLOT SOME EXAMPLES OF EACH CLASS:
%-------------------------------------------------------------------------------
numPerClass = 3;
TS_plot_timeseries('raw',numPerClass,[],[])

%-------------------------------------------------------------------------------
%% PRODUCE THE CLUSTERED CORRELATION MATRIX FOR THE TOP 40 FEATURES
%-------------------------------------------------------------------------------
theGroups = {'H','N2','dpy_20','unc_9','unc_38'}; % this is all of them.
theFiltering = 'neither'; % 'neither', 'locdep', 'lengthdep', 'both'
classVarFilter = true; % remove features with zero variance within a labeled class
[normalizedFileName,filteredFileName] = doFilter(theGroups,theFiltering,classVarFilter);
TS_TopFeatures(filteredFileName,'fast_linear','whatPlots','cluster','numFeaturesDistr',40);
caxis([0.5,1])

%-------------------------------------------------------------------------------
%% PLOT THE MULTISCALE SAMPEN MEASURE
%-------------------------------------------------------------------------------
% The feature of interest in Figure:
featID = 2748; % multiscale SampEn
TS_SingleFeature(filteredFileName,featID,true,true);
