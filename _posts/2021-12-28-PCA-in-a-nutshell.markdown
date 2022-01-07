---
layout: post
title:  "PCA in a Nutshell"
subtitle: "Heard the term ‘PCA’ being thrown around a lot and wondered what all the fuss is about?"
cover-img: "/assets/img/ML_dark.jpeg"
thumbnail-img: "/assets/img/PCA_flash_card.png"
thumbnail-img-source: "Chris Albon"
thumbnail-img-link: "https://chrisalbon.com/images/machine_learning_flashcards/Principal_Component_Analysis_print.png"
date:   2021-12-28 13:37:06 -0500
categories: MATLAB
tags: [Machine Learning, PCA, unsupervised]
comments: false
readtime: true
---

Been wanting to dip your toe into Machine Learning but not sure where to start?

Principal Components Analysis (PCA) is a great place to begin!

* PCA is a method for representing a dataset with an alternative coordinate system.

* The cool part is that this coordinate system is tailored to the specific dataset with which it is to be used!

* The even cooler part is that PCA is _unsupervised_, which means that no training data and only minimal user input are required! 

{: .box-note}
Here, I explain in a more graphical way what PCA is without getting into the math behind it. Don't get me wrong, the mathematical basis of PCA is really elegant and interesting, just beyond the scope of this brief introduction!

--- 
<pre></pre>

#### PCA as coordinate transformation

The idea behind PCA is that it constructs new variables that are linear combinations of the original variables. These new variables are called the principal components (PCs), and any sample from the dataset can be expressed in terms of these PCs. Think of them as new directions in space (see, for example, the gray arrows in the plot below), and any data point is represented not by how far along the original axes (e.g. x, y) the point is but how far along the new axes (PCs) it is.

![PCA]({{ site.baseurl }}/assets/img/PCA_2D_example.jpg#small)

{: .center}
Principal components (PCs) of data shown with gray arrows.

For example, see the red point at $x$=7.7 and $y$=9.2? We could just as easily specify its location with regard to the principal components (the gray arrows): how far along the PC1 and PC2 "axes" is this point? Well, it would be $x_{new}$=4.9 and $y_{new}$=1.1. Note that those coordinates are relative to the origin of our new coordinate system, which is placed in the middle ("centroid") of the data.

![PCA]({{ site.baseurl }}/assets/img/PCA_2D_example_2.jpg#small)

{:.center}
Data plotted in terms of principal components (PCs).

What we've done by using PCA is a coordinate transformation; specifcally, it's a rotation. See how the new axes, $x_{new}$ and $y_{new}$, are rotated relative to the original axes, $x$ and $y$?

#### Directions of PCs follow the spread

If you look closely at the data plotted with the new coordinates, i.e. as transformed by PCA, you will notice that there is much more spread along $x_{new}$ ("PC1") than along $y_{new}$ ("PC2"); that's not an accident. PCA constructs the principal components exactly according to how much spread there is in the data. More precisely, the first PC ("PC1") is oriented in such a way to explain the most amount of variance (i.e. spread) in the data. Similarly, the second PC ("PC2") is oriented to explain the next most amount of variance in the data.

#### Dimensionality reduction

In this simple 2-D example, the two PCs explain 100% of the variance. In other words, we can represent the positions of the data points exactly by specifying their coordinates with respect to these two PCs. What if we were to, instead, only use PC1? Then we would be using only one coordinate to represent the location of each point.

For example, the red point would now just be represented as $x_{new}$=4.9. Clearly, that's not exactly right, but it does a pretty good job of describing where the point is if we are limited to just one dimension ($x_{new}$). This is an example of _dimensionality reduction_.

This is a trivial example dataset because there are only two dimensions to begin with, but imagine a situation where you have 100, 1000 or even 1,000,000 dimensions! Using PCA would allow you to focus on describing your data with just a few, or maybe even several, dimensions because those dimensions (PCs) are chosen so as to explain the most variance in the data.

How many PCs should be used? Well, there are plenty of "rules of thumb" to help you determine that number, but just be warned that there is no "right" answer; it largely depends on the application. I know, not satisfying, but it's the truth!

---

Play around with 2-D, 3-D and 17-D example datasets using this [cool online visualization of PCA](https://setosa.io/ev/principal-component-analysis/){:target="_blank"}.
