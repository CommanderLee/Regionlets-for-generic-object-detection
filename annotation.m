boxes=0;
files = dir (ann_file);
LengthFiles = length (files);
string1 = 'Objects with ground truth :' ; % 1 matching string
string2 = 'Bounding box for object' ; % matching string 2
Locations = zeros (12,5);
for i = 1: LengthFiles 
    fid = fopen (files(i).name, 'r');
    while ~ feof (fid)         % to determine whether a file is read into the end of the 
        Data = fgetl (fid);
        t = strfind (Data, string1); % finding a string phase matching string 
        obj_num = 0; 
        if ~ isempty (t)
            obj_num = sscanf (Data, 'Objects with ground truth :%d {"PASperson"}'); % get the number of pedestrians
            
        end
         
         t = strfind (Data, string2); % finding matches with the string two strings
         if ~ isempty (t)
             [temp]= sscanf (Data,'Bounding box for object %d "PASperson" (Xmin, Ymin) - (Xmax, Ymax) : (%d, %d) - (%d, %d)');
             Locations(temp(1),:)=temp;
             boxes=boxes+1;
         end
    end
    fclose (fid); 
end
Locations;
imcropper;