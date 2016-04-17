%%
clc, 
close all, 
clear all,
size_of_region=32;
over_lap=0.9;
count=0;
counter=0;
feat_pos=zeros(1,1);
feat_neg=zeros(1,1);
thog1=zeros(1,1);
thog2=zeros(1,1);
thog3=zeros(1,1);
thog4=zeros(1,1);
thog5=zeros(1,1);
a = 0;
b = size_of_region;
r1=floor((b-a).*rand(1,4) + a);
w1=ceil(abs(r1(3)-r1(1))/8);
h1=ceil(abs(r1(4)-r1(2))/8);
r2=floor((b-a).*rand(1,4) + a);
w2=ceil(abs(r2(3)-r2(1))/8);
h2=ceil(abs(r2(4)-r2(2))/8);
r3=floor((b-a).*rand(1,4) + a);
w3=ceil(abs(r3(3)-r3(1))/8);
h3=ceil(abs(r3(4)-r3(2))/8);
r4=floor((b-a).*rand(1,4) + a);
w4=ceil(abs(r4(3)-r4(1))/8);
h4=ceil(abs(r4(4)-r4(2))/8);
r5=floor((b-a).*rand(1,4) + a);
w5=ceil(abs(r5(3)-r5(1))/8);
h5=ceil(abs(r5(4)-r5(2))/8);
%%
disp('Regionlet Based Object Detection');
disp('Calculating HOG for positive samples.......');
commonDir = '../CSC2541-AutoDriving/Project/data-kaist-thermal-original/train-all20';
dirData = dir([commonDir '/images/*.png']);      
fileNames = {dirData.name};
n=numel(fileNames);
iCrop = 0;
for iFile = 1:n
    [pathstr,name,ext] = fileparts(fileNames{iFile});
    image=fileNames{iFile};
    ann=dir(strcat(commonDir, '/annotations','/',name,'.txt'));
    ann_temp={ann.name};
    [pathstr,ann_file,ext] = fileparts(ann_temp{1});
    %ann_file=strcat('./annotations/',ann_file,ext);
    %ann_file;
    img_file = [commonDir, '/images','/',name,'.png'];
    ann_file = [commonDir, '/annotations','/',name,'.txt'];
    annotation;
end
disp('HOG for positive data complete.....');
%%
negative_hog;
%%
trainer;
%%
classify;