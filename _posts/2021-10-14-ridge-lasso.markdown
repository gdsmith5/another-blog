---
layout: post
title:  "Meet the Model: Ridge and LASSO regularization"
subtitle: "For reigning in overfitting."
cover-img: "/assets/img/ML_dark.jpeg"
thumbnail-img: "/assets/img/lasso.jpeg"
thumbnail-img-source: "wallpaperflare.com"
thumbnail-img-link: "https://c4.wallpaperflare.com/wallpaper/591/746/388/cowboy-lasso-roping-wallpaper-preview.jpg"
date:   2021-10-14 13:37:06 -0500
tags: [Machine Learning, meet the model, supervised, regression]
comments: false
readtime: true
---

A common issue when trying to fit a model to data is that of _overfitting_ - having too many degrees of freedom (i.e. variables or features) compared to the number of samples or observations. Models can become overly complex because of all of these degrees of freedom and end up overfitting to the training data - and not doing well on new data.

One way to address this problem is _feature selection_. With feature selection, only a subset of variables (features) is used. Another approach is to employ regularization, which uses additional constraints on the optimization. In this post, we are going to look at two particular types of regularization called `Ridge` and `LASSO` (Least Absolute Shrinkage Selection Operator) regression.

### Regularization

The goal with simple linear regression is to minimize the _objective function_, which is the difference between the model-predicted values ($ \bf{x_i} \cdot \bf{b} $) and the actual values ($ y_i $) (actually, the sum of the squares of these differences):

$$
\sum_{i=1}^n \left(y_i - \bf{x_i} \cdot \bf{b}\right)^2 \rightarrow min
$$

(Note that the intercept has been included in the vector of regression coefficients, $ \bf{b} $, as $ b_0 $, and that $ x_0 = 1 $.)

With regularization, we add an additional term to the quantity being minimized. What that term is depends on the type of regularization being used. `Ridge`, `LASSO` and `elastic` are common types of regularization.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/regularization.png#small)

Here, the second sum is over all $m$ variables, and the term being summed over, $r_j$, is $\frac{1}{2}b_j^2$ for `Ridge` regression and $\lvert b_j \rvert$ for `LASSO` regression. Note the complexity parameter, $\lambda$, which determines how important this additional constraint is in the overall minimization.

### Simple example

Let's look at a very simple example to illustrate how regularization works and what it does.

Imagine that we have one observation with a single value of $y = 8$ and a single vector of $\bf{x} = \left[2 ~~ 3\right] $ coordinates.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/regularization_example_simple_equation.png#tiny)

The equation to be solved is then:

$$
2b_0 + 3b_1 = 8
$$

There are an infinite number of solutions to this equation. In other words, there are an infinite number of sets of regression coefficients, $ \begin{bmatrix} b_0 \cr b_1 \end{bmatrix} $, that will work. In the figure below, those solutions are represented by the blue diagonal line. Two solutions in particular, $b_0=4, b_1=0$ and $b_0=-2, b_1=4$ are represented by the grey dots.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/regularization_example_simple.png#tiny)

The solutions with the `Ridge` and `LASSO` constraints are represented by the open circles. So, you can see how by imposing those constraints we go from an infinite number of solutions (all equally valid) to just one for each type of regularization.

The `Ridge` solution is: $ \begin{bmatrix} 1.23 \cr 1.85 \end{bmatrix} $.

The `LASSO` solution is: $ \begin{bmatrix} 0 \cr 2.67 \end{bmatrix} $.

### LASSO regression as feature selection

In the example above, notice that the `Ridge` solution has two non-zero coefficients, whereas the `LASSO` solution results in only one. `LASSO` has performed a form of feature selection because one of the variables, $x_0$, is not being used (it's coefficient, $b_0$, is zero).

This is one of the useful features of using `LASSO` regression - you get feature selection built in. To be fair, even though `Ridge` regression is not performing feature selection, it is adjusting the relative importance of the different features through the magnitudes of the coefficients - it's just not eliminating some features like `LASSO` is.

### $\lambda$: the complexity parameter

The exact solution that is obtained with either `Ridge` or `LASSO` regression depends on the value of $\lambda$, the complexity parameter; if $\lambda=0$, there is no regularization and there are an infinite number of solutions (in the example, above). As the value of $\lambda$ increases, the more important the regularization component of the objective function being minimized is.

For `LASSO` regression, increasing the value of $\lambda$ increases the number of features that have coefficients with value of zero - in other words, larger values of $\lambda$ result in a solution with a smaller number of features.

### A more complex (interesting?) example

To see how `LASSO` regression can be used with a "real" dataset, let's look at NIR (near-infrared) spectra of 40 biscuit dough samples with their associated fat content values (% fat weight compared to flour weight). ([Osborne, B.G., Fearn, T., Miller, A.R. and Douglas, S. (1984), Application of near infrared reflectance spectroscopy to the compositional analysis of biscuits and biscuit doughs. J. Sci. Food Agric., 35: 99-105.](https://doi.org/10.1002/jsfa.2740350116))

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/biscuit_dough_NIR_spectra.png#tiny)

There are 600 NIR absorption intensity values ("Data" on the y-axis) for each spectrum, which correspond to the 600 wavelengths from 1200 nm to 2398 nm (on the x-axis) - thus, overdetermined!

{: .box-note}
Even though NIR spectra lack the tell-tale "fingerprint" features that infrared spectra typically do, they still provide a wealth of information that has been used extensively especially in the area of food science/chemistry.

You can see that there is not a lot of variation in the spectra despite the fact that the fat values range from 15.0 to 21.6 (not shown). That's OK, this is the sort of thing that multivariate regression is built for!

When the value of $\lambda$ is optimized (more on that, below), 13 variables (i.e. wavelengths) are selected. In other words, only 13 of the 600 wavelengths have non-zero `LASSO` regression coefficients. You can see which ones indicated by blue lines overlayed with the average (normalized) NIR spectrum:

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/biscuit_dough_lasso.png#tiny)

You can see that the `LASSO` feature selection has focused on a particular region of the spectrum near 1650 nm, and that this region doesn't correspond to a peak. In fact, it is the _shoulder_ of a peak, and looking at the original spectra (above), it would have been hard to see that that region would contain the most information about fat content - in fact, all of the spectra look nearly identical there!

How good is the resulting `LASSO` model with 13 variables? Take a look:

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/biscuit_dough_lasso_predicted.png#tiny)

That's a RMSEC (root-mean square of calibration) of only 0.3 and a RMSECV (root-mean square of cross validation) of only 0.5.

### How to find the optimium value of $\lambda$

As I mentioned earlier, if you change the strength of regularization by changing the value of the complexity parameter, $\lambda$, the number of features `LASSO` selects will change. In the biscuit dough example, above, I had MATLAB vary the value of $\lambda$ and calculate the MSE (mean-squared error) using cross validation at each one.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/biscuit_dough_lasso_lambda.png#tiny)

The recommended value of $\lambda$ is actually not the one with the lowest MSE (the <span style="color:green"> green </span> circle and green dashed line) - it's the smallest one that is within 1 standard error of the lowest MSE (the <span style="color:blue"> blue </span> circle and the blue dashed line). This is an example of _parsimony_ - choosing the least complicated model without giving up too much performance. If we had chosen to use the value of $\lambda$ with the lowest MSE ($\lambda=0.009$), we would have a model with more features compared to the model built using $\lambda=0.12$ - but not a lot better performance.

### Ridge regression

And here are the coefficients from `Ridge` regression.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/biscuit_dough_ridge.png#tiny)

You can see that very few (if any) coefficients equal zero. So, the `Ridge` regression model still involves all wavelengths; it's just that some are weighted more heavily than others. Notice that a lot of the wavelengths with sizeable coefficients are near the 1650 nm region, just like we saw with `LASSO` regression!

{: .box-note}
While it is beyond the scope of this post to explain how to carry out `LASSO` and `Ridge` regression in MATLAB, it does have very convenient functions for doing so. Check out the [`LASSO`](https://www.mathworks.com/help/stats/lasso.html){:target="_blank"} and [`Ridge`](https://www.mathworks.com/help/stats/ridge.html){:target="_blank"} documentation on the official MathWorks site.

---