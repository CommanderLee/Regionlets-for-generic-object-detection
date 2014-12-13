n=20; % n=2416 for pos 
for i=1:n
%Path to the training database folder
        if (i<10) 
            image= strcat(path_name,'image000',int2str(i),'.png');
        elseif (i>9 && i<100)
            image= strcat(path_name,'image00',int2str(i),'.png');
        elseif (i>99 && i<1000)
            image= strcat(path_name,'image0',int2str(i),'.png');
        else
            image= strcat(path_name,'image',int2str(i),'.png');
        end
            f=imread(dbase_train(i));
            
end
