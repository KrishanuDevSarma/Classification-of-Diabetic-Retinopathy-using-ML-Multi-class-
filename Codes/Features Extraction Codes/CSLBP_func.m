 function [h]=CSLBP(a)
 
% clc;clear all;close all;
 a=imread('cameraman.tif');

[rows, columns ] = size(a);

for row = 2 : rows - 1
	for col = 2 : columns - 1
		centerPixel = a(row, col);
	
	
		pixel3=a(row-1, col+1)- a(row+1, col-1) >= centerPixel;
		pixel2=a(row-1, col)  - a(row+1, col)   >= centerPixel;
		pixel1=a(row-1, col-1)- a(row+1, col+1) >= centerPixel;
		pixel0=a(row, col-1)  - a(row,col+1)    >= centerPixel;
		
        
        
		PatternImage(row-1,col-1) = pixel3 * 2^3 + pixel2 * 2^2 + pixel1 * 2 + pixel0;
			
	end
end
h=hist(PatternImage(:),0:15);

 Ds1 = 1; %distance beetwen pixel
    GLCM1 = graycomatrix(PatternImage,'Offset',[0 Ds1; -Ds1 Ds1; -Ds1 0; -Ds1 -Ds1]);
    gl1= GLCM1(:)';
    
     Ds2 = 2; %distance beetwen pixel
    GLCM2 = graycomatrix(PatternImage,'Offset',[0 Ds2; -Ds2 Ds2; -Ds2 0; -Ds2 -Ds2]);
    gl2= GLCM2(:)';
    GLCM3 = graycomatrix(PatternImage,'Offset',[0 Ds1; -Ds1 Ds1;  0 Ds2; -Ds2 Ds2]);
    gl3= GLCM3(:)';
    GLCM4 = graycomatrix(PatternImage,'Offset',[0 Ds1; -Ds1 0;  0 Ds2; -Ds2 0]);
    gl4= GLCM4(:)';
    GLCM=horzcat(gl1,gl2,gl3,gl4);
end
