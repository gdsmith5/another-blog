---
layout: page
title: Projects
subtitle: A selection of data science and machine learning projects I've completed for my research lab and my course
---

## [Calibration of low-cost aerosol sensors in Athens, GA]({{ site.baseurl }}Athens_PA_cal_report)
**regression** &emsp; **aerosol** &emsp; **data cleaning** &emsp; **cross validation** &emsp; **MATLAB**

In this project I gathered data from 13 low-cost PurpleAir aerosol sensors as well as from a regulatory monitor in Athens, GA. I then built a linear regression model to correct the low-cost sensor measurements to be more accurate.

## [Building regression models for predicting specific gravity of beer wort from NIR spectra]()

**regression** &emsp; **LASSO** &emsp; **PLS** &emsp; **GPR** &emsp; **MATLAB**

In this project I used a dataset consisting of NIR (near-infrared) spectra of 40 beer wort samples and the corresponding specific gravity measurements to build several regression models. The models were able to use the spectra to predict specific gravity to within 0.4 Platos (crazy unit used in brewing!).

Models include: LASSO (read [my post about LASSO and Ridge regression]({{ site.baseurl }}{% post_url 2021-10-14-ridge-lasso %})), PLS (partial least squares) and GPR (Gaussian process regression).

## [Visualizing interpolated low-cost sensor data geographically]({{ site.baseurl }}PA_interpolation_report)

**interpolation** &emsp; **aerosol** **GPR** &emsp; **MATLAB**

In this project I used GPR (Gaussian process regression) to interpolate low-cost PurpleAir aerosol sensor data around Athens, GA and to visualize it on a map of the area.

## [MLB batter similarity using PCA]()

**PCA** &emsp; **baseball** &emsp; **Python** &emsp; **MATLAB**

In this project I used MATLAB to call some Python functions for retrieving 2021 MLB batting statistics. Then, I built a PCA model on the statistics to identify player "profiles" that explain the most variance in the data.