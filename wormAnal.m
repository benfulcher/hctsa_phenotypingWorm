%-------------------------------------------------------------------------------
% Parameters:
%-------------------------------------------------------------------------------
% theGroups = {'H','N2','unc'};
% theGroups = {'H','trp','unc'};
% theGroups = {'H','N2'};
% theGroups = {'H','N2','dpy'};


theFiltering = 'both'; % 'neither', 'locdep', 'lengthdep', 'both'

[normalizedFileName,filteredFileName] = doFilter(theGroups,theFiltering);

%-------------------------------------------------------------------------------
% Classic analyses using the normalized data
%-------------------------------------------------------------------------------
TS_classify(normalizedFileName)
annotateParams = struct('n',12,'textAnnotation','none','userInput',0,'maxL',1500);
TS_plot_pca(normalizedFileName,1,'',annotateParams)
TS_TopFeatures(normalizedFileName,'fast_linear',0,'numHistogramFeatures',20)
TS_ForwardFS(normalizedFileName)

%-------------------------------------------------------------------------------
% Species analysis:
%-------------------------------------------------------------------------------
% TS_LabelGroups({'H','N2','dpy'},'raw');
% TS_LabelGroups({'H','N2','dpy','trp','unc','unc_38'},'raw');
% TS_LabelGroups({'H','N2','trp','unc'},'raw');
% TS_normalize('scaledRobustSigmoid',[0.5,1])
% TS_classify
% TS_plot_pca
% TS_TopFeatures

%-------------------------------------------------------------------------------
[~,restrictedFileName] = TS_LabelGroups(theGroups,'raw',1,1);
normalizedFileName = TS_normalize('none',[0.5,1],restrictedFileName);
TS_TopFeatures('HCTSA_filtered_N.mat','fast_linear',0)

% %-------------------------------------------------------------------------------
% % Forward feature selection:
% [TS_DataMat,TimeSeries] = TS_LoadData('HCTSA_notLocDep_filtered_N.mat');
% fn_testStat = @(XTrain,yTrain,Xtest,yTest) sum(yTest ~= classify(Xtest,XTrain,yTrain,'diaglinear'));
% opts = statset('display','iter');
% [fs,history] = sequentialfs(fn_testStat,TS_DataMat,[TimeSeries.Group]',...
%                     'cv',5,'options',opts);
% fprintf(1,'Selected %u features\n',sum(fs));
