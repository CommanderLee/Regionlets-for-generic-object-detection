% For positive images
count_data=0;
pos_image_sz=size(I2);
J=(imresize(I2,[256 256],'lanczos3'));
t=size(J);
size_of_cell;
limit=256/size_of_cell;
t=t/size_of_cell;
t=floor(t);
ca = mat2cell(J,size_of_cell*ones(1,t(1)),size_of_cell*ones(1,t(2)),3);
plotIndex = 1;
a=zeros(size(J),class(J));
aa = mat2cell(a,size_of_cell*ones(1,size(a,1)/size_of_cell),size_of_cell*ones(1,size(a,2)/size_of_cell),3);

for i=1:limit
    for j=1:limit
        aa(i,j)=ca(i,j);
        amtx=cell2mat(aa(i,j));
        t3=size(amtx);
        t3=t3/regionlet_size;
        t3=floor(t3);
        ca3 = mat2cell(amtx,regionlet_size*ones(1,t3(1)),regionlet_size*ones(1,t3(2)),3);
        plotIndex = 1;
        a3=zeros(size(amtx),class(amtx));
        aa3 = mat2cell(a3,regionlet_size*ones(1,size(a3,1)/regionlet_size),regionlet_size*ones(1,size(a3,2)/regionlet_size),3);
     count_temp=0;
     for k=1:t3(1)
     for l=1:t3(1)
         aa3(k,l)=ca3(k,l);
         amtx3 = cell2mat(aa3(k,l));
         im = im2double(amtx3);
         feat = features(im, 8);
         B = reshape(feat,[],1);
         count_temp;
         if(count_temp==0)
             temp_array=[B];
         else
             temp_array=[temp_array,B];
         end
         count_temp=count_temp+1;
     end
     end
    [r,c]=size(temp_array);
    sum_t=zeros(1,c);
    for v=1:c
        sum_t(v)=sum(temp_array(:,v));
    end
    [val,index]=max(sum_t);
    region=temp_array(:,index);
    l=numel(B);
    for g=1:l
        feat_pos(count_data*l+g,counter)=region(g,1);
    end
    count_data=count_data+1;
    count=count+1;
    end
end
