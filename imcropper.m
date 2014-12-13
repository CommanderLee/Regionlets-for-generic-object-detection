I=imread(image);
[pathstr,name,ext] = fileparts(image);
boxes;
for i=1:boxes
I2=imcrop(I,[Locations(i,2),Locations(i,3),Locations(i,4),Locations(i,5)]);
positive_hog;
end
