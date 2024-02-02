clc;
clear all;
close all;

%Accessing the Diabetic Retinopathy Fundus Image Dataset STARE

imdsT = imageDatastore('G:\Project Stage-II\stare\Raw','IncludeSubfolders',true,'FileExtensions',[".png"],'LabelSource', 'foldernames')
T = countEachLabel(imdsT);
df=[];

for Idx =1:152
    
        im = readimage(imdsT,Idx);

        %Green Channel extraction
        green = im(:,:,2);
 
        %Applying CLAHE(Contrast Limited Adaptive Histogram)           

        adhist = double(adapthisteq(green,'clipLimit',0.02,'Distribution','uniform'));
    
       
        %%Extracting CSLBP Features from the Images
        img = imresize(adhist,[256 256]);
        
        df(:,Idx)=CSLBP_func(adhist);
        
end

CSLBP_features = df.';