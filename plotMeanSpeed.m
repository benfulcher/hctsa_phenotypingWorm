function plotMeanSpeed()
% Plots the distribution of mean speed across the strains

theGroups = {'H','N2','dpy_20','unc_9','unc_38'}; % this is all of them.
theDataFile = 'HCTSA.mat';

% First filter the data
[~,filteredFileName] = TS_LabelGroups(theGroups,theDataFile,1,1);

%-------------------------------------------------------------------------------
% Look at distributions of mean speed:
%-------------------------------------------------------------------------------
load(filteredFileName,'Operations');
isMean = find(strcmp({Operations.Name},'mean'));
TS_SingleFeature(filteredFileName,isMean,1);
ylim([0,250])

% load(filteredFileName,'TS_DataMat','Operations','TimeSeries','groupNames');
% isMean = find(strcmp({Operations.Name},'mean'));
% numGroups = max([TimeSeries.Group]);
% if numGroups<=3
%     groupColors = BF_getcmap('set1',numGroups,1);
% else
%     groupColors = BF_getcmap('dark2',numGroups,1);
% end
%
% dataCell = cell(numGroups,1);
% for i = 1:numGroups
%     isGroup = [TimeSeries.Group]==i;
%     dataCell{i} = (TS_DataMat(isGroup,isMean));
% end
%
% % Order by mean:
% meanGroup = cellfun(@mean,dataCell);
% [~,ix] = sort(meanGroup,'descend');
%
% extraParams = struct();
% extraParams.theColors = groupColors(ix);
% extraParams.customOffset = 0;
% extraParams.offsetRange = 0.7;
% BF_JitteredParallelScatter(dataCell(ix),1,1,1,extraParams);
%
% f = gcf;
% ax = gca;
% ax.XLim = [0.5,numGroups+0.5];
% ax.XTick = 1:numGroups;
% ax.XTickLabel = groupNames(ix);
% xlabel('C. Elegans strains');
% ylabel('Mean speed (units?)');
% ax.YLim(1) = 0;
% ax.YLim(2) = max(TS_DataMat(:,isMean))*1.02;
% ax.TickLabelInterpreter = 'none';
% f.Position(3:4) = [402,159];
%
% % f = figure('color','w'); hold on
% % hLines = cell(numGroups,1);
% % for i = 1:numGroups
% %     isGroup = [TimeSeries.Group]==i;
% %     [~,~,hLines{i},h_points] = BF_plot_ks(TS_DataMat(isGroup,isMean),groupColors{i},[],2);
% % end
% % legend([hLines{:}],groupNames,'interpreter','none')
% % xlabel('Mean speed')
% % ylabel('Probability density');
% %
% % % Tweak plot:
% % ax = gca;
% % ax.XLim = [min(TS_DataMat(:,isMean)),max(TS_DataMat(:,isMean))];
% % f.Position(3:4) = [363   149];

end
