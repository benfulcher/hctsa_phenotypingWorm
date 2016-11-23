%-------------------------------------------------------------------------------
%% Process data
% Set labels to assign to time series (strains/genotypes):
theGroups = {'H','N2','dpy_20','unc_9','unc_38'}; % this is all of them.

% Set filtering to perform on features (e.g., exclude location or length dependent features):
theFiltering = 'neither'; % 'neither', 'locdep', 'lengthdep', 'both'

%-------------------------------------------------------------------------------
% Filter features and normalize:
classVarFilter = 1; % remove features with zero variance within a labeled class
[normalizedFileName,filteredFileName] = doFilter(theGroups,theFiltering,classVarFilter);
normalizedData = load(normalizedFileName);
filteredData = load(filteredFileName);

%-------------------------------------------------------------------------------
%% Plot some examples of each class:
numPerClass = 3;
TS_plot_timeseries(normalizedData,numPerClass,[],[])

%-------------------------------------------------------------------------------
%% Determine balanced classification rate using all features
% (including confusion matrix)
whatClassifier = 'svm_linear';
doPCs = false; % see whether similar classification accuracy can be gained using reduced PCs
TS_classify(normalizedData,whatClassifier,doPCs)

%-------------------------------------------------------------------------------
%% What are the top individual features for distinguishing strains?:
doNull = false; % switch on (to true) to compute null distribution and
                % determine how many features are statistically informative
                % of strain
if doNull
    numNulls = 50;
else
    numNulls = 0;
end
TS_TopFeatures(filteredData,'fast_linear','numHistogramFeatures',32,'numNulls',numNulls)

%-------------------------------------------------------------------------------
%% Produce an annotated PCA plot, noticing class structure
doUserInput = 0; % switch on to annotate manually
annotateParams = struct('n',12,'textAnnotation','none','userInput',0,'maxL',1500);
TS_plot_pca(normalizedData,1,'',annotateParams)

%-------------------------------------------------------------------------------
%% Visualize the time series x feature data matrix
% (kind of requires TS_cluster to look nice, though, and then loading in the
% clustered data; time series will be ordered by strain using groupReorder flag):
TS_cluster('none',[],'corr_fast','average',[0,1],normalizedFileName);
normalizedData = load(normalizedFileName); % reload data containing clustering info

colorGroups = false; % can switch on to color strains differently
TS_plot_DataMatrix(normalizedData,'colorGroups',colorGroups,'groupReorder',1)

%-------------------------------------------------------------------------------
%% Data in space of top 2 features? (slow; not fully supported functionality):
% annotateParams = struct('n',12,'textAnnotation','none','userInput',0,'maxL',1500);
% TS_ForwardFS(normalizedData,[],'fast_linear',5,2,annotateParams);
