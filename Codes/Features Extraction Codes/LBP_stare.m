% function [ lbp_upper, lbp_lower ] = LBP(im, t)
function[h]=lbpnew(im)
   
    rows=size(im,1);
    cols=size(im,2);

    
    reorder_vector = [8 7 4 1 2 3 6 9];

    lbp_upper = zeros(size(im));
    
    for row = 2 : rows - 1
        for col = 2 : cols - 1
            cen = im(row,col); %// Get centre
        
          
            pixels = double(im(row-1:row+1,col-1:col+1));

            %// Get ranges and determine LBP
            out_LBP = zeros(3, 3);
            
            out_LBP(pixels < cen) = 0;
            out_LBP(pixels >= cen) = 1;
      

            %// Get upper and lower patterns
            upper = out_LBP;
            
            upper = upper(reorder_vector);

            %// Convert to a binary character string, then use bin2dec
            %// to get the decimal representation
            upper_bitstring = char(48 + upper);
            lbp_upper(row,col) = bin2dec(upper_bitstring);

            
        end
       h=hist(lbp_upper(:),0:255);
           
   end