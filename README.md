# Diabetic Retinopathy Classification Project

## Overview

Welcome to the Diabetic Retinopathy Classification project repository, curated by Krishanu Dev Sarma. In this project, we delve into the intricate task of classifying various stages of Diabetic Retinopathy using Machine Learning algorithms, specifically Multi-class Support Vector Machines (SVM) and Artificial Neural Networks (ANN). This builds upon my earlier project involving a binary class SVM model for Diabetic Retinopathy detection.

## Project Structure

1. **Datasets:** The `Datasets` folder contains three datasets catering to the diverse stages of Diabetic Retinopathy.
2. **Codes:** All the magic happens in the `Codes` folder, divided into sub-folders for clarity.
    - `preprocessing`: Code for data preprocessing and cleaning.
    - `ML Model Codes`: Implementation of the SVM and ANN models.
    - `Features Extraction Codes`: Code to extract relevant features from the Fundus Images.

## Technical Details

### SVM for Multi-Class Classification

#### Kernel Magic

As SVM is inherently a binary classifier, we employ kernel functions to extend its capabilities to multi-class classification. The Gaussian kernel (`'rbf'` in MATLAB) proves to be particularly effective in capturing complex relationships within the data.

```matlab
% Example code for multi-class SVM with a Gaussian kernel
svm_model = fitcecoc(X_train, y_train, 'KernelFunction', 'rbf');
```

#### Pros and Cons of SVM

##### Pros:

1. **Versatility:** SVM's kernel trick makes it adaptable for various data distributions.
2. **Regularization:** Effectively prevents overfitting, crucial for medical data.

##### Cons:

1. **Computational Intensity:** Training large datasets can be resource-intensive.
2. **Parameter Sensitivity:** Tuning kernel parameters requires finesse.

### ANN for Multi-Class Classification

#### Neural Symphony

ANN, our digital brain, excels in recognizing patterns. For multi-class classification, we configure a neural architecture capable of understanding the nuances of Diabetic Retinopathy stages.

```matlab
% Example code for multi-class ANN in MATLAB
ann_model = patternnet(hidden_layer_size);
ann_model = train(ann_model, X_train, y_train);
```

#### Pros and Cons of ANN

##### Pros:

1. **Non-Linearity Grasp:** ANN adeptly captures non-linear relationships in data.
2. **Feature Learning:** Autonomously learns relevant features, reducing manual engineering.

##### Cons:

1. **Black Box Nature:** Understanding the rationale behind ANN decisions can be challenging.
2. **Data Dependency:** Performance heavily relies on the quality and quantity of training data.

## Advice for Developers

1. **Data Harmony:** Ensure a balanced distribution of data across all Diabetic Retinopathy stages.
2. **Feature Serenade:** Fine-tune your feature selection; let the relevant features sing.
3. **Iterative Tuning:** Experiment with different kernel functions for SVM and neural architectures for ANN.

## Exploring Past Work

In my [previous project](https://github.com/KrishanuDevSarma/Detection-of-diabetic-Retionopathy-using-ML-Binary-Classification-), I ventured into Diabetic Retinopathy detection using a binary class SVM model. This laid the groundwork for the current project, showcasing the progression in complexity and scope.

## How to Use This Repository

1. Clone the repository to your local machine.
2. Explore the datasets in the `Datasets` folder.
3. Navigate through the codes in the `Codes` folder, following the sequence in sub-folders.

Feel free to reach out for any clarifications or collaborations. Let's unravel the intricacies of Diabetic Retinopathy together!

Happy coding! 🚀👁️ #MachineLearning #DiabeticRetinopathy #SVM #ANN #MedicalAI
