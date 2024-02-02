for Idx =1:n      %Replace n with the number of images in the dataset
    
        %%Extracting GLRLM Features from the Images
        img = imresize(adhist,[256 256]);
        
        df(:,Idx)=GLRLM_func(adhist);
        
end

glrlm_features = df.';
