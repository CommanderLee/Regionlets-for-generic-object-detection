dirData = dir('./s_pos/crop_000010.png');      %# Get the selected file data
fileNames = {dirData.name};          %# Create a cell array of file names
for iFile = 1:numel(fileNames)       %# Loop over the file names
    [pathstr,name,ext] = fileparts(fileNames{iFile});
    name
    image=fileNames{iFile}
    ann=dir(strcat('./annotations','/',name,'.txt'));
    ann_temp={ann.name};
    [pathstr,ann_file,ext] = fileparts(ann_temp{1});
    ann_file=strcat('./annotations/',ann_file,ext);
    ann_file
    annotation;
end
imshow(image)

