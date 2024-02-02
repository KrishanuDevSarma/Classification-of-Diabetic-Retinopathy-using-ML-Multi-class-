%%Extracting GLCM Features from the Images 
for Idx = 1:n        %Replace n with the number of images in the dataset
       
        glcms = graycomatrix(adhist);
        R=0;
        for i = 1:8
            for j = 1:8
                R = R + glcms(i,j);
            end;
        end;
       
        normalized_glcms = glcms./R;
        homogeneity = 0;
        contrast = 0;
        energy = 0; correlation = 0;
        mean_glcms = 0;
        var_glcms = 0;
        for i = 1:8
            for j = 1 : 8

%Detecting the value of Homogeneity feature
                homogeneity = homogeneity + (normalized_glcms(i,j)/(1 + (i-j)^2));

%Detecting the value of Contrast feature
                contrast = contrast + (normalized_glcms(i,j)*(i-j)^2);

%Detecting the value of Energy feature
                energy = energy + normalized_glcms(i,j)^2;
                mean_glcms = mean_glcms + i*normalized_glcms(i,j);
 
            end
        end
 
        for i = 1:8
            for j = 1:8
                var_glcms = var_glcms + (normalized_glcms(i,j)*(i-mean_glcms)^2);
            end
        end
 
        for i = 1:8
            for j = 1:8

%Detecting the value of Correlation feature
                correlation = correlation + ((normalized_glcms(i,j)*(i-mean_glcms)*(j - mean_glcms))/var_glcms);
            end
        end
        feature(:,Idx) = [homogeneity;correlation;contrast;energy]
end

%Storing the combined GLCM Features of all the Images as a single matrix 
GLCM_feature = feature.';

horzcat = [Features GLCM_feature];
