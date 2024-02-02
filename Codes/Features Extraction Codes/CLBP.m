for Idx = 1:n 	%Replace n with the number of images in the dataset
    
        %**********************Preprocessing****************************

	%Storing the Image in a variable
        im = readimage(imdsT,Idx);

G=im(:,:,2);

A=adapthisteq(G);

[rows, columns ] = size(A);
Pattern_Im = zeros(rows-2,columns-2);
for row = 2 : rows - 1
   for col = 2 : columns - 1
        Ic = A(row, col);
        I1 = A(row, col+1);
        I2 = A(row+1, col+1);
        I3 = A(row+1, col);
        I4 = A(row+1, col-1);
        I5 = A(row, col-1);
        I6 = A(row-1, col-1);
        I7 = A(row-1, col);
        I8 = A(row-1, col+1);
        
        
        K1 = I1>=Ic;
        K2 = I2>=Ic;
        K3 = I3>=Ic;
        K4 = I4>=Ic;
        K5 = I5>=Ic;
        K6 = I6>=Ic;
        K7 = I7>=Ic;
        K8 = I8>=Ic;
        
        CLBPS = [K1 K2 K3 K4 K5 K6 K7 K8];
        Ps(row-1,col-1) = uint8(K8 * 2^7 + K7 * 2^6 + K6 * 2^5 + K5 * 2^4 + K4 * 2^3 + K3 * 2^2 + K2 * 2 + K1);
        
        
        Mp = (I1+I2+I3+I4+I5+I6+I7+I8);
        C = Mp/8;
        
        N1 = I1>=C;
        N2 = I2>=C;
        N3 = I3>=C;
        N4 = I4>=C;
        N5 = I5>=C;
        N6 = I6>=C;
        N7 = I7>=C;
        N8 = I8>=C;
        
        CLBPM = [N1 N2 N3 N4 N5 N6 N7 N8];
        Pm(row-1,col-1) = uint8(N8 * 2^7 + N7 * 2^6 + N6 * 2^5 + N5 * 2^4 + N4 * 2^3 + N3 * 2^2 + N2 * 2 + N1);
        
        
        
   end
end

h1=hist(Ps(:),0:255);

h2=hist(Pm(:),0:255);

h = [h1,h2];

ArrayofCLBP{Idx} = h;
end;

CLBP_features = cell2mat(ArrayofCLBP');
