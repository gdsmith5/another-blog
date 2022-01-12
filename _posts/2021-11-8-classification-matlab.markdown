---
layout: post
title:  "Classification workflow in MATLAB"
subtitle: "Working with models"
cover-img: "/assets/img/binary_dark.jpeg"
thumbnail-img: "/assets/img/classification_matlab_overview.png"
thumbnail-img-source: "author"
date:   2021-11-08 13:37:06 -0500
tags: [MATLAB, models, classification, supervised]
comments: false
readtime: true
---

MATLAB offers a lot of really useful functions for building, training, validating and using classification models. This post just lays out a workflow for using these resources, kind of giving you a visual overview of how all the pieces fit together.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/classification_matlab_overview.png#small)

Below, I go through each of these steps in detail:

- [Building the model](#building-the-model)
- [Predicting with the model](#predicting-with-the-model)
- [Calculating loss for resubstitution](#calculating-loss-for-resubstitution)
- [Creating cross-validated models](#creating-cross-validated-models)
- [Calculating _k_-fold loss](#calculating-k-fold-loss)
- [Predicting out-of-fold class assignments](#predicting-out-of-fold-class-assignments)

---

### Building the model

The first step is to build the model. This is the part where you use the relevant `fitc` function (`fitcknn`, `fitctree`, etc.) to fit the model to your training data. What you get out of any of these `fitc` functions is a trained model object (`Mdl`). This object contains all the information about the model as well as the training data.

The model object also contains functions (these are actually "methods" of the class to which the model belongs). These functions are specific to the type of model that is built, but the different classification models share common terminology making it easy to use them in a similar way regardless of model type.

These functions include things like `predict()`, `loss()` and `resubLoss()`. A list of available functions for a given type of model can be found by clicking on the relevant model on the [MATLAB Classification overview page](https://www.mathworks.com/help/stats/classification.html?s_tid=CRUX_lftnav){:target="_blank"}. For example, here is the [page describing all of the functions associated with the k-nearest neighbor model object](https://www.mathworks.com/help/stats/classification-nearest-neighbors.html){:target="_blank"}.

### Predicting with the model

One very useful function associated with a model is the `predict()` function. This function allows you to predict class assignments for data using the model that you have trained.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/classification_matlab_predict.png#small)

In addition to predicting class assignment, it can also predict _posterior probabilities_ - scores representing class membership likelihood.

### Calculating loss for resubstitution

Another function is the `resubLoss()` function. It calculates the loss (fraction of samples misclassified) by the model on the training data. Yes, it uses the same data as were used for training the model. In this way, it is very similar to RMSEC (root-mean square error of calibration) for regression models.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/classification_matlab_resubLoss.png#small)

### Creating cross-validated models

A really useful function is the `crossval()` function. It does two things:

1. It takes care of splitting the data into "in-fold" and "out-of-fold" sets for cross validation (10-fold by default)
2. It builds separate models built on the "in-fold" data from each fold

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/classification_matlab_crossval.png#small)

What the `crossval()` function returns is a cross-validated model, `CVMdl`. This model is actually a set of models (10 if using 10-fold cross validation), and this set can be used to calculate things like predicted class assignment for out-of-fold samples and the associated loss (i.e. mis-classification). Read on, gentle reader!

### Calculating _k_-fold loss

It's good (reall good!) to have some estimate of how well a model performs. One of the most common ways of doing this is to see how well a cross-validated model performs on the out-of-fold samples. The `kfoldLoss()` function  calculates the loss of each of the models in the cross-validated model (`CVMdl`) when applied to the out-of-fold data for the associated fold (upon which that particular model was built). It then averages those losses, and that's what it reports as the "CV loss". 

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/classification_matlab_kfoldLoss.png#small)

Because the loss values were calculated on samples not used in training each model, they can be considered representative of how the general model ("Mdl"), created in the initial building step using one of the `fitc` functions, will perform on new data (i.e. that it was not trained on). Thus, the "CV loss" is very similar to the RMSECV (root-mean square error of cross validation) measured for regression models.

### Predicting out-of-fold class assignments

The `kfoldPredict()` function returns the predicted class assignments for the out-of-fold samples from each fold. Since each sample is out-of-fold just once, this means that the class for each sample is predicted just once. This is useful to get a sense for how the model behaves on new data and if it does particulary poorly (or well) with predicting certain classes.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/classification_matlab_kfoldPredict.png#small)

One informative way to visualize the cross-validated model performance is to plot the true classes vs. the predicted classes in what is called a _confusion matrix_. The `confusionchart()` function generates such a plot from the cross-validated model ("CVMdl").

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/classification_matlab_confusion.png#small)

The numbers in each box indicate the number of samples corresponding to that outcome. Numbers along the diagonal indicate samples for which classes were correctly assigned, while off-diagonal numbers indicate mis-classification. It can be informative to investigate which classes the mis-classified samples are classified as.

---

So, hopefully you now see how to work with classification (and cross-validated classification) models in MATLAB. It might seem a little overwhelming at first, but it's really convenient how the same types of functions can be used for a whole variety of different types of classification models.

---

Read more about [classification](https://www.mathworks.com/help/stats/classification.html?s_tid=CRUX_lftnav){:target="_blank"} in the official MathWorks documentation.