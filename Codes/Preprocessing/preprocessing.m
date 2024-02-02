clc;
close all;
clear all;

%Accessing the Diabetic Retinopathy Fundus Image Dataset STARE

imdsT = imageDatastore('dataset','IncludeSubfolders',true,'FileExtensions',[".png"],'LabelSource', 'foldernames')    %Replace dataset with the folder containing the images
T = countEachLabel(imdsT);

for Idx = 1:n     %Replace n with the number of images in the dataset
       
%**********************Preprocessing****************************

	%Storing the Image in a variable
        im = readimage(imdsT,Idx);

	%Green Channel extraction
        green = im(:,:,2);
 
%Applying CLAHE(Contrast Limited Adaptive Histogram Equalisation)           

adhist=adapthisteq(green,'clipLimit',0.02,'Distribution','uniform');
