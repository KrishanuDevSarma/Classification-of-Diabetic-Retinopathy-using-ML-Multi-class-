for Idx = 1:n 	%Replace n with the number of images in the dataset     
     
%%Extracting Mesh Features from the Images
        %img=imresize(adhist,[256 256]);
        img = adhist;
        rows=size(img,1);
        cols=size(img,2);
     
        sum=0;g=0;
        for i= 2:255
            for j=2:255
                sum=0;
                if(img(i-1,j-1)<img(i-1,j))
                    g=0;
                else
                    g=1;
                end;
                img(i-1,j-1) = g*(2^0);
                if(img(i-1,j)<img(i-1,j+1))
                    g=0;
                else
                    g=1;
                end;
                img(i-1,j) = g*(2^1);
                if(img(i-1,j+1)<img(i,j+1))
                    g=0;
                else
                    g=1;
                end;
                img(i-1,j+1) = g*(2^2);
                if(img(i,j+1)<img(i+1,j+1))
                    g=0;
                else
                    g=1;
                end;
                img(i,j+1) = g*(2^3);
                if(img(i+1,j+1)<img(i+1,j))
                    g=0;
                else
                    g=1;
                end;
                img(i+1,j+1) = g*(2^4);
                if(img(i+1,j)<img(i,j))
                    g=0;
                else
                    g=1;
                end;
                img(i+1,j) = g*(2^5);
                if(img(i+1,j-1)<img(i,j-1))
                    g=0;
                else
                    g=1;
                end;
                img(i+1,j-1) = g*(2^6);
                if(img(i,j-1)<img(i-1,j-1))
                    g=0;
                else
                    g=1;
                end;
                img(i,j-1) = g*(2^7);
                           
            end;
        end;  

        img(1, :) = []; % Delete rows.
        img(rows-1, :) = []; % Delete rows.
        img(:, 1) = []; % Delete columns.
        img(:, cols-1) = []; % Delete columns.
        
        h1=imhist(img);
        h2=h1'./256;
	  
%Storing the Histograms of the Images in an Array
        ArrayOfLMPImages{Idx}= h2;
 
end;

%Compiling the Histograms of all the Images in a Matrix  
Features=cell2mat(ArrayOfLMPImages');
