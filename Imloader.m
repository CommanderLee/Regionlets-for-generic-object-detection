clc;
n=20; % n=2416 for pos
count=1;
row=[1 3 4];
col=[2 2 3];
n_regions=1;
n_regionlets=1;
path_name= strcat('./s_pos/'); 
dbase_positive = zeros(15360,n);
pos_regionlets=zeros(15360,3*n);
for i=1:n
  if (i<10) 
     image= strcat(path_name,'image000',int2str(i),'.png');
  elseif (i>9 && i<100)
      image= strcat(path_name,'image00',int2str(i),'.png');
  elseif (i>99 && i<1000)
       image= strcat(path_name,'image0',int2str(i),'.png');
   else
       image= strcat(path_name,'image',int2str(i),'.png');
  end
  %h=imshow(image);
  imshow(image);
  im=im2double(imread(image));
  %im = imagemodel(h);
  %attrs = imattributes(im)
  % Number of regions
  regions=zeros(2,n_regions);
  mx=48;
  my=80;
  regionlets=[mx,mx-10,mx+10;my,my-10,my+10];
  for i=1:n_regions
    regions(1,i)=10*rand;
    regions(2,i)=10*rand;
    rectangle('Position',[1 1 96 160],'edgecolor','blue');
    for j=1:n_regionlets
        %rectangle('Position',[regionlets(1,j) regionlets(2,j) 32 32],'edgecolor','red');
        rgbImage = imread(image);
        t=size(rgbImage);
        bx=32; % Size of regionlet
        t=t/bx;
        t=floor(t);
        ca = mat2cell(rgbImage,bx*ones(1,t(1)),bx*ones(1,t(2)),3);
        plotIndex = 1;
        a=zeros(size(rgbImage),class(rgbImage));
        aa = mat2cell(a,bx*ones(1,size(a,1)/bx),bx*ones(1,size(a,2)/bx),3);
        x = 1;
        y = 3;
        z = 5;
        %r = floor((z-x).*rand) + x
        %c = floor((y-x).*rand) + x
        r=row(j);
        c=col(j);
        aa(r,c)=ca(r,c);
        amtx = cell2mat(aa);
        size(amtx)
        hold on;
        imshow(amtx)
        im = im2double(amtx);
        feat = features(im, 8);
        ihog = invertHOG(feat);
        temp1 = reshape(ihog,15360,1); 
        pos_regionlets(:,count)=temp1;
        figure(1);
        clf;
        count=count+1
        %subplot(131);
        %imagesc(im); axis image; axis off;
        %title('Original Image', 'FontSize', 20);

        %subplot(132);
        %showHOG(feat); axis off;
        %title('HOG Features', 'FontSize', 20);

        %subplot(133);
        %imagesc(ihog); axis image; axis off;
        %title('HOG Inverse', 'FontSize', 20);
    end
  end        
  

  
im=rgb2gray(imread(image)); 
temp1 = reshape(im,15360,1); 
dbase_positive(:,i) = temp1; 
            
end
