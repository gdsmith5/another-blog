---
layout: page
title: Athens PurpleAir Calibration
subtitle: Using linear regression to correct aerosol sensor measurements
tags: [regression, data cleaning]
---

{: .box-note}
In this project, I set out to develop a way to correct the inexpenseive PurpleAir sensors that are located around Athens, GA.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/PA_map.png#tiny)

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

Aerosols are tiny particles supsended in the atmosphere, and they are important because they affect air quality, human health and climate change. Recently, a low-cost instrument for measuring aerosol concentrations, called a "PurpleAir" sensor, has become popular with researchers and scientific hobbyists, alike. By nature of their relatively low cost (~ $250), ease of setup and ability to run unattended for months and even years at a time, these sensors have been placed all over the United States and even the world. In fact, as of the writing of this report there are over 20,000 of these sensors active in the U.S.

Because the PurpleAir sensors are orders of magnitude less expensive than research-grade and regulatory instruments, many more of them can be placed providing:

- increased spatial coverage
- improved redundancy
- higher time resolution

Additionally, each sensor contains two independent meaurement "channels" providing a way to check for internal consistency.

While very good sensors, they are not as accurate as the more expensive instruments and suffer from biases. Several researchers have developed corrections for the sensors to try to make them more accurate, but these "one-size-fits-all" approaches may not work well for all sensors.

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