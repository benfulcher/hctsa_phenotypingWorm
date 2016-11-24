function downloadComputedData()
% Download the HCTSA.mat file from figshare
%-------------------------------------------------------------------------------

url = 'https://ndownloader.figshare.com/files/6294369';
fileName = 'HCTSA.mat';
outFileName = websave(fileName,url);
fprintf(1,'hctsa results for C. Elegans movement phenotyping downloaded to:\n%s\n',...
                outFileName);

end
