% theGroups = {'H','N2','dpy'};
theGroups = {'H','N2','dpy','trp','unc','unc_38'}; % this is all of them.
theFiltering = 'both'; % 'neither', 'locdep', 'lengthdep', 'both'
[normalizedFileName,filteredFileName] = doFilter(theGroups,theFiltering);
doNull = 0; % can switch on to get significance
TS_TopFeatures(filteredFileName,'fast_linear',doNull,'numHistogramFeatures',40)


numClasses = length(theGroups);
whatData = filteredFileName;

%-------------------------------------------------------------------------------
% Plot for some particular features
%-------------------------------------------------------------------------------
% featID = 6991; % ARMA model prediction
% featID = 7484;
% featID = 7586;
% featID = 4458;
featID = 7777; % SD1 HRV measure
TS_SingleFeature(whatData,featID)

% [TS_DataMat,TimeSeries,Operations,whatDataFile] = TS_LoadData(whatData);
% load(whatDataFile,'groupNames')
% timeSeriesGroup = [TimeSeries.Group]'; % Use group form
% numClasses = max(timeSeriesGroup);
% op_ind = find([Operations.ID]==featID);
%
% % Actually make some examples:
% f = figure('color','w'); hold on
% ax = gca;
% colors = BF_getcmap('dark2',numClasses,1);
%
% % Plot distributions first for the sake of the legend
% linePlots = cell(numClasses,1);
% for i = 1:numClasses
%     featVector = TS_DataMat((timeSeriesGroup==i),op_ind);
%     [~,~,linePlots{i}] = BF_plot_ks(featVector,colors{i},0,2,20,1);
% end
% % Trim x-limits
% ax.XLim(1) = min(TS_DataMat(:,op_ind))-0.02*range(TS_DataMat(:,op_ind));
% ax.XLim(2) = max(TS_DataMat(:,op_ind))+0.02*range(TS_DataMat(:,op_ind));
%
% % Add a legend:
% legend([linePlots{:}],groupNames,'interpreter','none')
% ylabel('Probability density')
%
% % Annotate rectangles:
% BF_AnnotateRect('fast_linear',TS_DataMat(:,op_ind),timeSeriesGroup,numClasses,colors,ax);
%
% % Add x-label:
% xlabel(Operations(op_ind).Name,'interpreter','none')
%
% % Adjust position
% f.Position(3:4) = [405,179];
%
% % Get 10-fold cross-validated accuracy:
% accuracy = GiveMeCfn('fast_linear',TS_DataMat(:,op_ind),timeSeriesGroup,[],[],numClasses,1,[],[],10);
% fprintf(1,'10-fold cross validated balanced accuracy: %.2f +/- %.2f\n',mean(accuracy),std(accuracy));
