%-------------------------------------------------------------------------------
% Set parameters:
%-------------------------------------------------------------------------------
% Set labels to assign to time series (strains/genotypes):
theGroups = {'H','N2','dpy_20','unc_9','unc_38'}; % this is all of them.

% Set filtering to perform on features (e.g., exclude location or length dependent features):
theFiltering = 'neither'; % 'neither', 'locdep', 'lengthdep', 'both'

%-------------------------------------------------------------------------------
% Filter features and normalize:
[normalizedFileName,filteredFileName] = doFilter(theGroups,theFiltering);

%-------------------------------------------------------------------------------
% Plot some examples of each class:
TS_plot_timeseries(normalizedFileName,3,[],[])

%-------------------------------------------------------------------------------
% Determine classification rate:
TS_classify(normalizedFileName)

%-------------------------------------------------------------------------------
% What are some of the top features:
doNull = 0; % can switch on to get significance
TS_TopFeatures(filteredFileName,'fast_linear',doNull,'numHistogramFeatures',40)

%-------------------------------------------------------------------------------
% Produce an annotated PCA plot:
annotateParams = struct('n',12,'textAnnotation','none','userInput',0,'maxL',1500);
TS_plot_pca(normalizedFileName,1,'',annotateParams)

%-------------------------------------------------------------------------------
% Visualize the data matrix colored by strain
TS_plot_DataMatrix(normalizedFileName,'colorGroups',1,'groupReorder',1)

%-------------------------------------------------------------------------------
% Top feature space?:
TS_ForwardFS(filteredFileName,[],'diaglinear',5,2)

%-------------------------------------------------------------------------------
% [~,restrictedFileName] = TS_LabelGroups(theGroups,'raw',1,1);
% normalizedFileName = TS_normalize('none',[0.5,1],restrictedFileName);
% TS_TopFeatures('HCTSA_filtered_N.mat','fast_linear',0)

% %-------------------------------------------------------------------------------
% % Forward feature selection:
% [TS_DataMat,TimeSeries] = TS_LoadData('HCTSA_notLocDep_filtered_N.mat');
% fn_testStat = @(XTrain,yTrain,Xtest,yTest) sum(yTest ~= classify(Xtest,XTrain,yTrain,'diaglinear'));
% opts = statset('display','iter');
% [fs,history] = sequentialfs(fn_testStat,TS_DataMat,[TimeSeries.Group]',...
%                     'cv',5,'options',opts);
% fprintf(1,'Selected %u features\n',sum(fs));
