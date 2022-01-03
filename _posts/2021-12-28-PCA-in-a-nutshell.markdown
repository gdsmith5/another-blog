---
layout: post
title:  "PCA in a Nutshell"
subtitle: "Heard the term ‘PCA’ being thrown around a lot and wondered what all the fuss is about?"
cover-img: "/assets/img/ML_dark.jpeg"
thumbnail-img: "/assets/img/ML.jpeg"
date:   2021-12-28 13:37:06 -0500
categories: MATLAB
tags: [ML, PCA, unsupervised]
comments: false
readtime: true
---

Been wanting to dip your toe into Machine Learning but not sure where to start?

Principal Components Analysis (PCA) is a great place to begin!

* PCA is a method for representing a dataset with an alternative coordinate system

* The cool part is that this coordinate system is tailored to the specific dataset with which it is to be used!

* The even cooler part is that PCA is _unsupervised_, which means that no training data and only minimal user input are required! 

The idea behind PCA is that it constructs new variables that are linear combinations of the original variables. These new variables are called the principal components (PCs), and any sample from the dataset can be expressed in terms of these PCs. Think of them as new directions in space, and any data point is represented not by how far along the original axes (e.g. x, y) the point is but how far along the new axes (PCs) it is.


---

Play around with 2-D, 3-D and 17-D example datasets using this [cool online visualization of PCA](https://setosa.io/ev/principal-component-analysis/){:target="_blank"}.
