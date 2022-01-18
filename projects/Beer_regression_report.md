---
layout: page
title: Regression of NIR beer spectra
subtitle: Using Machine Learning to estimate potential alcohol content
tags: [regression]
---

{: .box-note}
In this project, I built a set of Machine Learning models to predict the concentration of dissolved solids in beer wort from NIR (near-infrared) spectra.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/beer_wort_spec_gravity.jpeg#small)

{:.caption}
[By Schlemazl - Own work, CC BY-SA 3.0](https://commons.wikimedia.org/w/index.php?curid=22601592){:target="_blank"}

<br>
### Outline
- [Motivation](#motivation)
- [Objective](#objective)
- [Approach](#approach)
- [Results](#results)
- [Conclusion](#conclusion)
- [MATLAB script](#matlab-script)

<br>
### Motivation

When brewing beer, the concentration of dissolved solids in the wort, the initial malty liquid that eventually becomes beer, is an important quantity to measure. That's because its value is correlated with the eventual alcohol content of the final product. Traditionally, the concentration of dissolved solids is estimated by measuring the specific gravity, or density relative to water, of the wort.

However, making such a measurement requires extracting a sample of the wort and using a hygrometer. The hygrometer is weighted to sink by a specific amount depending on the density - the denser the wort, the less it sinks. This process must be repeated every time the specific gravity is measured as the beer progresses through the fermentation process.

NIR (near-infrared) spectroscopy provides a convenient alternative since it can be performed non-destructively and in an online process. The trick is, of course, figuring out how to relate the measured spectra to the specific gravity, or more precisely, the concentration of dissolved solids.

### Objective

Here, I used a published dataset ([Nørgaard, L. et al. Interval Partial Least-Squares Regression ( i PLS): A Comparative Chemometric Study with an Example from Near-Infrared Spectroscopy. Appl Spectrosc 54, 413–419 (2000)](https://journals.sagepub.com/doi/10.1366/0003702001949500){:target="_blank"}) of NIR spectra and dissolved solid concentrations, called "extract" (in crazy brewing units called degrees Plato, degP), to build a set of Machine Learning regression models. 

### Approach

The overall approach I took consisted of the following steps:

1. explore the data by plotting NIR spectra
2. build LASSO model
3. build PLS model
4. build GPR model

### Results

#### Data

The dataset consists of 40 samples with a NIR spectrum and dissolved solids concentration (ranging from 4.2 - 18.8 degP) for each.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/beer_spectra.png#small)

{:.caption}
NIR spectra of 40 beer wort samples from Nørgaard et al., Appl Spectrosc 54, 413–419 (2000).

Notice that there are not much differences in the spectra despite the fact that the dissolved solids concentration varies by more than a factor of four. This is a perfect example of how multivariate regression can be used to identify key features (i.e. wavelengths) that are correlated with the quantity of interest.

We are going to use three different regssion models:

- LASSO regularization
- PLS (partial least squares)
- GPR (Gaussian process regression)

#### LASSO regularization

LASSO regularization adds an additional constraint to the optimization problem, thereby providing a unique solution where otherwise there wouldn't be one. Practically, this results in a form of feature selection in which the regression coefficients for many of the variables are exactly zero.

Read [my post on LASSO and Ridge regression]({{ site.baseurl }}{% post_url 2021-10-14-ridge-lasso %}) to learn more about how regularization is used when problems are underdetermined.

The variables selected using the beer dataset are shown below:

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/beer_lasso_variables.png#small)

{:.caption}
Average NIR spectrum of beer wort samples (red) and regression coefficients (blue).

Note that only seven wavelengths have non-zero coefficients: 1184, 1320, 1326, 2126, 2128, 2136 and 2246 nm, and of these only three dominate.

Using 5-fold cross validation, we can see how well we can expect the LASSO model to perform on new data:

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/beer_lasso_cv.png#small)

{:.caption}
Cross-valided predicted values of the "extract".

The extract **RMSECV** for this model is **0.38 degP**, which is pretty good considering that the average extract value is 11.1 degP.

#### PLS

Partial least squares regression builds a set of _latent variables_ that are particularly good for predicting values of the predictant (i.e. the "extract") becuase it uses both sets of data (i.e. the NIR spectra and the "extract" values) when constructing them. You can think of it as related to PCA, but whereas PCA tries to explain the variance of the NIR spectra, PLS tries to explain the variance of both the NIR spectra and the extract values (it's a little more involved than that, but that's the basic idea).

Sounds good, right? Let's use all of the data to come up with a great regression model. So, how does PLS do?

Well ... the **RMSECV** of the PLS model is an underwhelming **0.94 degP**. This is a lot worse than what we got with LASSO regression (0.38 degP) and is clearly not acceptable. What happened? Well, the PLS model was overtrained on the training data.

To address this issue, I used a variable ranking algorithm called _RReliefF_ (see MathWorks documentation on the `relieff()` function) to select variables. Specifically, I chose just the top 10% (93) wavelengths.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/beer_PLS_variables.png#small)

{:.caption}
Average NIR spectrum of beer wort samples (red) and RReliefF weights for the top 10% of wavelengths (blue).

But, in order to avoid so-called _data leakage_, I used this variable selection inside each of my five folds in the 5-fold cross validation. Thus, each of the five PLS models that were built as part of the cross validation could have been built on a different set of (93) variables.

The **RMSECV** for this approach was a much more reasonable **0.24 degP**.

#### GPR

I also built a GPR (Gaussian process regression) model, which is basically a super cool interpolation (a little too complicated to explain, here). I ran into a similar problem with the GPR as I did with the PLS regession - overfitting when using all of the wavelengths in the spectra. Only this time it was _a lot_ worse! The RMSECV was 2.3 degP! I may as well just use the average extract value as my guess for each sample ... literally!

However, if I use RRelief to select variables, I get a much better **RMSECV = 0.23 degP**.

### Conclusion

{: .box-note}
**Multivariate regression models were built that can predict the extract (i.e. dissolved solids concentration) very accurately from NIR spectra**

- All three models worked well with only a subset of the variables (i.e. wavelengths).

- Using all of the variables led to gross overfitting using the PLS and GPR models.

- Variable selection using RReliefF improved performance of the PLS and GPR models.

- Using NIR spectroscopy to measure extract values seems feasible and convenient.

---

### MATLAB script 

{% include beer_lasso.html %}
{% include beer_PLS.html %}