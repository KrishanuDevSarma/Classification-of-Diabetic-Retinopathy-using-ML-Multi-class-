clc;
clear all;
close all;
%rng(1);
SD1=importdata('features.mat');  %Replace 'features.mat' with the extracted feature set as required
SD = SD1;
SL=[zeros(1,47),ones(1,66),2*ones(1,39)]';
 

TND1=SD;
TND1([1,4,14,19,22,26,31,42,56,65,73,77,81,91,102,106,110,119,120,129],:)=[];
TNL1=SL;
TNL1([1,4,14,19,22,26,31,42,56,65,73,77,81,91,102,106,110,119,120,129],:)=[];

TSD1=SD([1,4,6,7,11,14,16,18,21,23,26,28,31,34,36,41,44,46,51,55,56,60,61,66,68,71,74,76,81,82,86,91,96,102,106,110,112,115,119,120,126,129],:);
TSL1=SL([1,4,6,7,11,14,16,18,21,23,26,28,31,34,36,41,44,46,51,55,56,60,61,66,68,71,74,76,81,82,86,91,96,102,106,110,112,115,119,120,126,129],:);


classificationNeuralNetwork1 = fitcnet(TND1, TNL1, 'LayerSizes', [50 150],'LayerWeightsInitializer','he', 'Activations', "relu", 'Lambda', 1e-4, 'IterationLimit', 1000, 'Standardize', true, 'ClassNames', [1; 2; 3; 4; 5]);
GROUP1 = predict(classificationNeuralNetwork1, TSD1);
CM1 = confusionmat(TSL1,GROUP1);
acc1 = sum(diag(CM1))/sum(CM1(:))*100

 TP1=CM(1,1);TP2=CM(2,2);TP3=CM(3,3);
 
 TN1=CM(2,2)+CM(2,3) + CM(3,2)+CM(3,3);
 TN2=CM(1,1)+CM(1,3) + CM(3,1)+CM(3,3);
 TN3=CM(1,1)+CM(1,2) + CM(2,1)+CM(2,2);
 
 FN1=CM(1,2)+CM(1,3); 
 FN2=CM(2,1)+CM(2,3); 
 FN3=CM(3,1)+CM(3,2); 
 
 FP1=CM(2,1)+CM(3,1);
 FP2=CM(1,2)+CM(3,2);
 FP3=CM(1,3)+CM(2,3);
 
 TPR1=TP1/(TP1+FN1);
 TPR2=TP2/(TP2+FN2);
 TPR3=TP3/(TP3+FN3);
 
 Sensitivity = (TPR1+TPR2+TPR3)/3
 
 TNR1=TN1/(TN1+FP1);
 TNR2=TN2/(TN2+FP2);
 TNR3=TN3/(TN3+FP3);
 
 Specificity = (TNR1+TNR2+TNR3)/3
