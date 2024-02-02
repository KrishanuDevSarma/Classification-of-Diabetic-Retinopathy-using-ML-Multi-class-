clc;
clear all;
close all;

%Accessing the Diabetic Retinopathy Fundus Image Dataset STARE

imdsT = imageDatastore('G:\Project Stage-II\stare\Raw','IncludeSubfolders',true,'FileExtensions',[".png"],'LabelSource', 'foldernames')
T = countEachLabel(imdsT);
df_LTP=[];

for Idx =1:152
    
        im = readimage(imdsT,Idx);

        %Green Channel extraction
        green = im(:,:,2);
 
        %Applying CLAHE(Contrast Limited Adaptive Histogram)           

        adhist = double(adapthisteq(green,'clipLimit',0.02,'Distribution','uniform'));
    
       
        %%Extracting LTP Features from the Images
        img = imresize(adhist,[512 512]);
        
        df_LTP(:,Idx)=LTP_func(adhist,2);
        df_GLRLM(:,Idx)=GLRLM_func(adhist);
        
end

ltp_features = df_LTP.';
glrlm_features = df_GLRLM.';

horzcat = [ltp_features glrlm_features];