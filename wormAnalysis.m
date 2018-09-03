%-------------------------------------------------------------------------------
%% Process data
% Set labels to assign to time series (strains/genotypes):
theGroups = {'H','N2','dpy_20','unc_9','unc_38'}; % this is all of them.

% Set filtering to perform on features (e.g., exclude location or length dependent features):
theFiltering = 'neither'; % 'neither', 'locdep', 'lengthdep', 'both'

%-------------------------------------------------------------------------------
% Filter features and normalize:
classVarFilter = true; % remove features with zero variance within a labeled class
[normalizedFileName,filteredFileName] = doFilter(theGroups,theFiltering,classVarFilter);
normalizedData = load(normalizedFileName);
filteredData = load(filteredFileName);

%-------------------------------------------------------------------------------
%% Plot some examples of time series from each class:
numPerClass = 3;
TS_plot_timeseries(normalizedData,numPerClass)

%-------------------------------------------------------------------------------
%% Compute the balanced classification rate using all features
% (including confusion matrix)
whatClassifier = 'svm_linear';
TS_classify(normalizedData,whatClassifier,'numPCs',0);

%-------------------------------------------------------------------------------
%% What are the top individual features for distinguishing strains?:
doNull = false; % switch on (to true) to compute null distribution and
                % determine how many features are statistically informative
                % of strain
whatStatistic = 'fast_linear'; % Use balanced linear classification rate as feature statistic
numFeaturesDistr = 32; % number of top features to plot distributions for

if doNull
    numNulls = 50; % use 50 nulls
else
    numNulls = 0;
end
TS_TopFeatures(filteredData,whatStatistic,'numFeaturesDistr',numFeaturesDistr,...
                        'numNulls',numNulls)

%-------------------------------------------------------------------------------
%% Produce an annotated low-dimensional plot, noticing class structure
numAnnotate = 8; % number of points to annotate with time series
theAlgorithm = 'pca'; % 'pca','tSNE'
doUserInput = false; % switch on to annotate manually
timeSeriesLength = 1500; % plot this many datapoints for time series annotations
annotateParams = struct('n',numAnnotate,'textAnnotation','none',...
                'userInput',doUserInput,'maxL',timeSeriesLength);
TS_PlotLowDim(normalizedData,theAlgorithm,true,'',annotateParams);

%-------------------------------------------------------------------------------
%% Visualize the time series x feature data matrix
% (kind of requires TS_cluster to look nice, though, and then loading in the
% clustered data; time series will be ordered by strain using groupReorder flag):
TS_cluster('none',[],'corr_fast','average',[0,1],normalizedFileName);
normalizedData = load(normalizedFileName); % reload data containing clustering info
groupReorder = true; % reorder rows (time series) by their group label
colorGroups = false; % can switch on to color strains differently
timeSeriesLength = 5000; % length of time series segments to show to the left of the plot
TS_plot_DataMatrix(normalizedData,'colorGroups',colorGroups,'groupReorder',true,...
                    'timeSeriesLength',timeSeriesLength)
% (Note: you can zoom in on the main color plot to look in more detail at
% time series and features, especially on smaller screens)

%-------------------------------------------------------------------------------
%% Data in space of top 2 features? (slow; not fully supported functionality):
% annotateParams = struct('n',12,'textAnnotation','none','userInput',0,'maxL',1500);
% TS_ForwardFS(normalizedData,[],'fast_linear',5,2,annotateParams);
