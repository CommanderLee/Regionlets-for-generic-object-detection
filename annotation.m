boxes=0;
files = dir (ann_file);
LengthFiles = length (files);
string1 = 'Objects with ground truth :' ; % 1 matching string
string2 = 'Bounding box for object' ; % matching string 2
Locations = zeros (12,5);
for i = 1: LengthFiles 
    %fid = fopen (files(i).name, 'r');
    fid = fopen(ann_file, 'r');
%     while ~ feof (fid)         % to determine whether a file is read into the end of the 
%         Data = fgetl (fid);
%         t = strfind (Data, string1); % finding a string phase matching string 
%         obj_num = 0; 
%         if ~ isempty (t)
%             obj_num = sscanf (Data, 'Objects with ground truth :%d {"PASperson"}'); % get the number of pedestrians
%             
%         end
%          
%          t = strfind (Data, string2); % finding matches with the string two strings
%          if ~ isempty (t)
%              [temp]= sscanf (Data,'Bounding box for object %d "PASperson" (Xmin, Ymin) - (Xmax, Ymax) : (%d, %d) - (%d, %d)');
%              Locations(temp(1),:)=temp;
%              boxes=boxes+1;
%          end
%     end
    
    tline = fgets(fid);
    while ischar(tline)
        if (tline(1) ~= '%')
            % person 237 222 27 49 0 0 0 0 0 0 0
           data = textscan(tline, '%s %f %f %f %f %d %d %d %d %d %d %d');
           type = data{1}{1};
           switch type
               case 'person'
                   boxes = boxes + 1;
                   Locations(boxes, :) = [boxes, data{2}, data{3}, data{4}, data{5}];
               otherwise
           end
        end
        tline = fgets(fid);
    end
    
    fclose (fid); 
end
Locations;
imcropper;