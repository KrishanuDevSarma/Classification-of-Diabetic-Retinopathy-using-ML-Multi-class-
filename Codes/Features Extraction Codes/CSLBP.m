for Idx =1:n      %Replace n with the number of images in the dataset
    
        %%Extracting CSLBP Features from the Images
        img = imresize(adhist,[256 256]);
        
        df(:,Idx)=CSLBP_func(adhist);
        
end

CSLBP_features = df.';
