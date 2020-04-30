function [normalizedFileName,filteredFileName] = doFilter(theGroups,theFiltering,classVarFilter)

%-------------------------------------------------------------------------------
% Check inputs:
%-------------------------------------------------------------------------------
if nargin < 3
    classVarFilter = true; % features with zero variance within a labeled class are removed
end

%-------------------------------------------------------------------------------
% Filter the time-series data to the restricted set of labels first:
%-------------------------------------------------------------------------------
[~,restrictedFileName] = TS_LabelGroups('raw',theGroups,true,true);

%-------------------------------------------------------------------------------
% Remove length-dependent features -> HCTSA_notLocDep.mat
%-------------------------------------------------------------------------------
[ID_lengthDep,ID_notlengthDep] = TS_getIDs('lengthdep',restrictedFileName,'ops');
[ID_locDep,ID_notlocDep] = TS_getIDs('locdep',restrictedFileName,'ops');

switch theFiltering
case 'neither'
    fprintf(1,'No filtering\n');
    filteredFileName = restrictedFileName;
case 'lengthdep'
    fprintf(1,'Filtering out length dependent features!\n');
    filteredFileName = TS_FilterData(restrictedFileName,[],ID_notlengthDep,'HCTSA_filt.mat');
case 'locdep'
    fprintf(1,'Filtering out location dependent features!\n');
    filteredFileName = TS_FilterData(restrictedFileName,[],ID_notlocDep,'HCTSA_filt.mat');
case 'both'
    % Include features that are neither length nor location dependent:
    fprintf(1,'Filtering out location and length dependent features!\n');
    filteredFileName = TS_FilterData(restrictedFileName,[],intersect(ID_notlengthDep,ID_notlocDep),'HCTSA_filt.mat');
end

%-------------------------------------------------------------------------------
% Now normalize:
normalizedFileName = TS_Normalize('scaledRobustSigmoid',[0.5,1],filteredFileName,classVarFilter);
% copyfile(filteredFileName,'HCTSA_filterConstant.mat');
system(sprintf('cp %s HCTSA_filterConstant.mat',filteredFileName)); % if using non-bash shell
filteredFileName = TS_Normalize('none',[0.5,1],'HCTSA_filterConstant.mat',classVarFilter);

end
