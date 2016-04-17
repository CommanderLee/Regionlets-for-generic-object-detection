%--------------------- For negative images--------------------------------
disp('Calculating HOG for negative samples');
%n1=1218; % neg images
count1=1;
counter1=0;
%path_name2= strcat('./s_neg/');
annFiles = dir([commonDir '/annotations/*.txt']);
n1 = length(annFiles);
for id=1:n1

    fid = fopen([commonDir '/annotations/' annFiles(id).name], 'r');
    negFlag = 1;
    tline = fgets(fid);
    while ischar(tline)
        if (tline(1) ~= '%' && ~isempty(tline))
            negFlag = 0;
            break;
        end
        tline = fgets(fid);
    end
    fclose(fid);
    if negFlag == 1
        [~, imgName] = fileparts(annFiles(id).name);
        image1 = [commonDir '/images/' imgName '.png'];
    else
        continue;
    end
    
    count_data1=0;
    counter1=counter1+1;
    
%     if (i<10)
%         image1= strcat(path_name2,'image000',int2str(i),'.png');
%     elseif (i>9 && i<100)
%         image1= strcat(path_name2,'image00',int2str(i),'.png');
%     elseif (i>99 && i<1000)
%         image1= strcat(path_name2,'image0',int2str(i),'.png');
%     else
%         image1= strcat(path_name2,'image',int2str(i),'.png');
%     end

    image1=imread(image1);
    neg_image_sz=size(image1);
    im=(imresize(image1,[256 256],'lanczos3'));
    im_hog = im2double(im);
    feat = features(im_hog, 8);
    i=0;
    c=[1,1,size_of_region-1,size_of_region-1];
    while(c(2)<size_of_region)
        c=[1,1,size_of_region-1,size_of_region-1];
        c(2)=c(2)+floor(size_of_region*(1-over_lap))*(i-1);
        c(4)=c(4)+floor(size_of_region*(1-over_lap))*(i-1);
        while(c(1)<size_of_region)
            c(1)=c(1)+floor(size_of_region*(1-over_lap));
            c(3)=c(3)+floor(size_of_region*(1-over_lap));
            t1=c+r1;
            for j=1:numel(t1)
                if(t1(j)>256)
                    t1(j)=256;
                end
            end
            t1;
            t1=floor(t1/8);
            for j=1:numel(t1)
                if(t1(j)>=31)
                    t1(j)=30;
                end
                if(t1(j)<=0)
                    t1(j)=1;
                end
            end
            x1min=min(t1(1),t1(3));
            y1min=min(t1(2),t1(4));
            l1=w1+h1;
            for j=0:w1-1
                if(x1min+j<=30)
                    if(i==0)
                        thog1=feat(x1min,y1min,:);
                    else
                        if(thog1<feat(x1min+j,y1min,:))
                            thog1=feat(x1min+j,y1min,:);
                        end
                    end
                end
            end
            for j=0:h1-1
                if(y1min+j<=30)
                    if(thog1<feat(x1min,y1min+j,:))
                        thog1=feat(x1min,y1min+j,:);
                    end
                end
            end
            
            t2=c+r2;
            for j=1:numel(t2)
                if(t2(j)>256)
                    t2(j)=256;
                end
            end
            t2;
            t2=floor(t2/8);
            for j=1:numel(t2)
                if(t2(j)>=31)
                    t2(j)=30;
                end
                if(t2(j)<=0)
                    t2(j)=1;
                end
            end
            x2min=min(t2(1),t2(3));
            y2min=min(t2(2),t2(4));
            l1=w1+h1;
            for j=0:w2-1
                if(x2min+j<=30)
                    if(i==0)
                        thog2=feat(x2min,y2min,:);
                    else
                        if(thog2<feat(x2min+j,y2min,:))
                            thog2=feat(x2min+j,y2min,:);
                        end
                    end
                end
            end
            for j=0:h2-1
                if(y2min+j<=30)
                    if(thog2<feat(x2min,y2min+j,:))
                        thog2=feat(x2min,y2min+j,:);
                    end
                end
            end
            
            t3=c+r3;
            for j=1:numel(t3)
                if(t3(j)>256)
                    t3(j)=256;
                end
            end
            t3;
            t3=floor(t3/8);
            for j=1:numel(t3)
                if(t3(j)>=31)
                    t3(j)=30;
                end
                if(t3(j)<=0)
                    t3(j)=1;
                end
            end
            x3min=min(t3(1),t3(3));
            y3min=min(t3(2),t3(4));
            l3=w3+h3;
            for j=0:w3-1
                if(x3min+j<=30)
                    if(i==0)
                        thog3=feat(x3min,y3min,:);
                    else
                        if(thog3<feat(x3min+j,y3min,:))
                            thog3=feat(x3min+j,y3min,:);
                        end
                    end
                end
            end
            for j=0:h3-1
                if(y3min+j<=30)
                    if(thog3<feat(x3min,y3min+j,:))
                        thog3=feat(x3min,y3min+j,:);
                    end
                end
            end
            
            t4=c+r4;
            for j=1:numel(t4)
                if(t4(j)>256)
                    t4(j)=256;
                end
            end
            t1;
            t4=floor(t4/8);
            for j=1:numel(t4)
                if(t4(j)>=31)
                    t4(j)=30;
                end
                if(t4(j)<=0)
                    t4(j)=1;
                end
            end
            x4min=min(t4(1),t4(3));
            y4min=min(t4(2),t4(4));
            l1=w1+h1;
            for j=0:w4-1
                if(x4min+j<=30)
                    if(i==0)
                        thog4=feat(x4min,y4min,:);
                    else
                        if(thog4<feat(x4min+j,y4min,:))
                            thog4=feat(x4min+j,y4min,:);
                        end
                    end
                end
            end
            for j=0:h4-1
                if(y4min+j<=30)
                    if(thog4<feat(x4min,y4min+j,:))
                        thog4=feat(x4min,y4min+j,:);
                    end
                end
            end
            
            t5=c+r5;
            for j=1:numel(t5)
                if(t5(j)>256)
                    t5(j)=256;
                end
            end
            t1;
            t5=floor(t5/8);
            for j=1:numel(t5)
                if(t5(j)>=31)
                    t5(j)=30;
                end
                if(t5(j)<=0)
                    t5(j)=1;
                end
            end
            x5min=min(t5(1),t5(3));
            y5min=min(t5(2),t5(4));
            l1=w1+h1;
            for j=0:w5-1
                if(x5min+j<=30)
                    if(i==0)
                        thog5=feat(x5min,y5min,:);
                    else
                        if(thog5<feat(x5min+j,y5min,:))
                            thog5=feat(x5min+j,y5min,:);
                        end
                    end
                end
            end
            for j=0:h5-1
                if(y5min+j<=30)
                    if(thog5<feat(x5min,y5min+j,:))
                        thog5=feat(x5min,y5min+j,:);
                    end
                end
            end
            
            
            
            hog1=thog1;
            hog2=thog2;
            hog3=thog3;
            hog4=thog4;
            hog5=thog5;
            hog=cat(3,hog1,hog2);
            hog=cat(3,hog,hog3);
            hog=cat(3,hog,hog4);
            hog=cat(3,hog,hog5);
            hog=squeeze(hog); %96x1 vector
            if(i==0)
                data=[hog];
            else
                data=[data;hog];
            end
            %feat_pos(counter,:)=data;
        end
        i=i+1;
    end
    for k=1:numel(data)
        feat_neg(k,counter1)=data(k,1);
    end
    
end
disp('HOG on negative data finished...');