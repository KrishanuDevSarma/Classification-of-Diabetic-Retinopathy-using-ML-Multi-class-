df_LTP=[];

for Idx =1:n     %Replace n with the number of images in the dataset
    
        
        %%Extracting LTP Features from the Images
        img = imresize(adhist,[512 512]);
        
        df_LTP(:,Idx)=LTP_func(adhist,2);
        
end

ltp_features = df_LTP.';
