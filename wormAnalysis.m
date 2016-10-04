%-------------------------------------------------------------------------------
% Set parameters:
%-------------------------------------------------------------------------------
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
% Plot some examples of each class:
numPerClass = 3;
TS_plot_timeseries(normalizedData,numPerClass,[],[])

%-------------------------------------------------------------------------------
% Determine classification rate:
whatClassifier = 'svm_linear';
doPCs = 0; % see whether similar classification accuracy can be gained using reduced PCs
TS_classify(normalizedData,whatClassifier,doPCs)

%-------------------------------------------------------------------------------
% What are some of the top features?:
doNull = 0; % switch on to compute null distribution and determine how many
            % features are informative
if doNull
    numNulls = 50;
else
    numNulls = 0;
end
TS_TopFeatures(filteredData,'fast_linear','numHistogramFeatures',40,'numNulls',numNulls)

TS_TopFeatures(filteredData,'fast_linear','whatPlots','cluster','numHistogramFeatures',40);
caxis([0.5,1])

%-------------------------------------------------------------------------------
% Produce an annotated PCA plot, noticing class structure
doUserInput = 0; % switch on to annotate manually
annotateParams = struct('n',12,'textAnnotation','none','userInput',0,'maxL',1500);
TS_plot_pca(normalizedData,1,'',annotateParams)

%-------------------------------------------------------------------------------
% Visualize the data matrix colored by strain
% (kind of requires TS_cluster to look nice, though, and then loading in the
% clustered data):
TS_cluster('none',[],'corr_fast','average',[0,1],normalizedFileName);
normalizedData = load(normalizedFileName); % re-load
TS_plot_DataMatrix(normalizedData,'colorGroups',0,'groupReorder',1)

%-------------------------------------------------------------------------------
% Top feature space? (slow, not fully functional):
annotateParams = struct('n',12,'textAnnotation','none','userInput',0,'maxL',1500);
TS_ForwardFS(normalizedData,[],'fast_linear',5,2,annotateParams);
