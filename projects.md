---
layout: page
title: Projects
subtitle: A selection of data science and machine learning projects I've completed for my research lab and my course
permalink: /projects/
---
![map](\assets\img\PA_SE_surface_map.png#itsy){: style="float: right"}
## [Interpolating low-cost sensor data]({{ site.baseurl }}\PA_interpolation_report)

{: .blog-tags}
<a> interpolation </a> <a> aerosol </a> <a> GPR </a> <a> MATLAB </a>

In this project I used GPR (Gaussian process regression) to interpolate low-cost PurpleAir aerosol sensor data around Athens, GA and to visualize it on a map of the area.



![map](\assets\img\PA_map.png#itsy){: style="float: right"}
## [Athens PurpleAir calibration]({{ site.baseurl }}Athens_PA_cal_report)

{: .blog-tags}
<a> regression </a> <a> aerosol </a> <a> data cleaning </a> <a> cross validation </a> <a> MATLAB </a>

In this project I gathered data from 13 low-cost PurpleAir aerosol sensors as well as from a regulatory monitor in Athens, GA. I then built a linear regression model to correct the low-cost sensor measurements to be more accurate.



![map](\assets\img\beer_PLS_variables.png#itsy){: style="float: right"}
## [Regression of NIR beer spectra]({{ site.baseurl }}Beer_regression_report)

{: .blog-tags}
<a> regression </a> <a> LASSO </a> <a> PLS </a> <a> GPR </a> <a> MATLAB </a>

In this project I used a dataset consisting of NIR (near-infrared) spectra of 40 beer wort samples and the corresponding dissolved solids concentration measurements to build several regression models. The models were able to use the spectra to predict the dissolved solids to within 0.2 Platos (crazy unit used in brewing!).

Models include: LASSO (read [my post about LASSO and Ridge regression]({{ site.baseurl }}{% post_url 2021-10-14-ridge-lasso %})), PLS (partial least squares) and GPR (Gaussian process regression).

<!---
## [MLB batter similarity using PCA]()

**PCA** &emsp; **baseball** &emsp; **Python** &emsp; **MATLAB**

In this project I used MATLAB to call some Python functions for retrieving 2021 MLB batting statistics. Then, I built a PCA model on the statistics to identify player "profiles" that explain the most variance in the data.
--->