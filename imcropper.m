% I=imread(image);
% [pathstr,name,ext] = fileparts(image);
I=imread(img_file);
[pathstr,name,ext] = fileparts(img_file);

boxes;
for i=1:boxes
    I2=imcrop(I,[Locations(i,2),Locations(i,3),Locations(i,4),Locations(i,5)]);
    imwrite(I2, sprintf('%s/cropped/%d.png', commonDir, iCrop));
    iCrop = iCrop + 1;
    positive_hog;
end
