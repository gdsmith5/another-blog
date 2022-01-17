---
layout: page
title: Regression of beer wort for predicting amount of dissolved solids
subtitle: Using Machine Learning to estimate potential alcohol content
tags: [regression]
---

{: .box-note}
In this project, I built a set of Machine Learning models to predict the concentration of dissolved solids in beer wort from NIR (near-infrared) spectra.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/beer_wort_spec_gravity.jpeg#tiny)

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

When brewing beer, the concentration of dissolved solids in the beer wort, the initial malty liquid that eventually becomes beer, is an important quantity to measure. That's because its value is correlated with the eventual alcohol content of the final product. Traditionally, the concentration of dissolved solids is estimated by measuring the specific gravity, or density relative to water, of the wort.

However, making such a measurement requires extracting a sample of the wort and 

### Objective

Here, I used data from PurpleAir sensors and a regulatory monitor located in Athens, GA to develop a local correction to make these sensors more accurate. 

### Approach

The overall approach I took consisted of the following steps:

1. obtain data from PurpleAir sensors and regulatory monitor in Athens, GA
2. sync the two datasets and combine into a single `timetable`
3. clean the dataset
4. train a linear regression model to predict the particulate matter concentration from the PurpleAir measurements
5. compare performance of trained Athens model to "one-size-fits-all" correction on withheld test dataset

### Results

#### Data

I obtained hourly-averaged data from Jan. 1, 2021 to Oct. 31, 2021 from 13 PurpleAir sensors located within 20 km of the regulatory monitor in Athens, GA. (these data are publicly available from [PurpleAir](https://api.purpleair.com/){:target="_blank"} and the [U.S. EPA's Air Quality System](https://aqs.epa.gov/aqsweb/documents/data_api.html){:target="_blank"} API services - details of the MATLAB scripts I wrote to access these data will be described in a future project!)

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/PA_map.png#small)

{:.caption}
Particulate matter concentration values measured by PurpleAir sensors (orange and yellow dots) and the reference monitor (blue dot) around Athens, GA. Oct. 25, 2021.

#### Cleaning

Initially, I had a dataset with 92,534 hourly-averaged samples. After cleaning, in which entries with "NaN" and those for which the "A" and "B" channels disagreed by more than 30% were removed, I had 51,262 samples.

#### Splitting into training/test datasets

This dataset was split into a training set (Jan. 1, 2021 - Aug. 30, 2021) and a test set (Sep. 1, 2021 - Oct. 31, 2021) with 38,870 and 12,392 hourly-averaged samples, respectively.


#### Building linear model

The linear model was built on the training set resulting in the following correction equation:

$$
PM_{corr} = 4.20 + 0.182 \cdot PA_A + 0.22 \cdot PA_B
$$

where $PM_{corr}$ is the corrected particulate matter concentration (in $\mu g / m^3$), $PA_A$ and $PA_B$ are the PurpleAir channel A and B measurements, respectively.

#### Model performance

5-fold cross validation was used, and RMSECV and MAE from the cross validation were calculated. The model was then run with the test data ("Predicted") and RMSEP and MAE values calculated, as well.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/Athens_PA_table.png#small)

<br>
For comparison, a popular "one-size-fits-all" correction (the "[LRAPA model](https://www.lrapa.org/DocumentCenter/View/4147/PurpleAir-Correction-Summary){:target="_blank"}") was also used.

These performance metrics should be considered in relation to the average measurements of $PM_{ref}$ of 10.3 $\mu g / m^3$.

### Conclusion

{: .box-note}
**The linear model built specifically on Athens, GA data performed significantly better in cross validation and on the test dataset (from Athens, GA) than did the "one-size-fits-all" LRAPA model.**

- In fact, the Athens model performed about a whole $\mu g / m^3$ (11%) better than the LRAPA model.

- While not surprising, this exercise goes to show that there can be local differences that are important to include when trying to make the most accurate predictions with the PurpleAir model.

- In addition to providing a better correction for the PurpleAir sensors in the Athens, GA area, the linear model built here might also prove useful for use with sensors in other, similar environments.

---

### MATLAB script 

{% include Athens_PA_cal_project.html %}