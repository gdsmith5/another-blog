---
layout: page
title: Interpolating PurpleAir data
subtitle: Using GPR to interpolate network of data across the Southeast U.S.
tags: [interpolation, aerosol]
---

{: .box-note}
In this project, I set out to demonstrate the utility of visualizing low-cost PurpleAir sensor data across the Southeast U.S. using Gaussian process regression for interpolation.


{:.center}
![waitbar]({{ site.baseurl }}/assets/img/PA_SE_surface_map.png#tiny)

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

Because of their low cost (~ $250), PurpleAir aerosol sensors have gained in popularity with researchers and science hobbyists, alike. There are now over 20,000 of these sensors deployed all across the U.S. The resulting high density spatial coverage and fast time resolution (2 minutes) means that there is a wealth of information provided by this publicly-accessible dataset.

With so many sensors, however, it can be hard to synthesize all of the measurements and arrive at meaningful conclusions. This is especially true because the spatial coverage, while dense, is not homogeneous.

### Objective

Here, I used Gaussian process regression to demonstrate how interpolation of PurpleAir sensor data can be used to provide a spatially complete overview of aerosol concentration in the Southeast U.S.

### Approach

The overall approach I took consisted of the following steps:

1. obtain hourly-averaged data from all PurpleAir sensors within 500 km of Athens, GA
2. randomly pick one day/hour to use
4. clean data by removing outliers
6. fit GPR model to sensor data
7. use GPR model to predict aerosol concentrations for grid of points covering Southeast U.S.
8. plot 2-D and 3-D contour maps of predicted values

### Results

#### Data

I obtained hourly-averaged data from June 2021 for 258 PurpleAir sensors located within 500 km of Athens, GA. (these data are publicly available from [PurpleAir](https://api.purpleair.com/){:target="_blank"} API service - details of the MATLAB scripts I wrote to access these data will be described in a future project!) I randomly picked one date / hour to use (June 8, 2021 - 8:00 am   ).

#### Correct measurements

PurpleAir sensors are well-known to over-estimate aerosol concentrations. So, I applied a correction that I developed based on PurpleAir sensors around the country (but not those in Athens, GA). The development of this correction will be detailed in a future project!

#### Clean data

I didn't want a handful of outliers to throw off the interpolation, so I used the MATLAB `isoutlier()` function to remove those samples considered outliers (more specifically, those that are more than three scaled median absolute deviations away from the median).

#### Convert locations to distances

In order to use GPR to carry out the interpolation, I needed to convert the latitude / longitude locations of each PurpleAir sensor to distances in meters. The distances were calculated relative to the centroid of the collection of 258 sensors.

#### Fit GPR model to sensor data

A GPR model was fit to the measurements at all 258 PurpleAir locations. A constant noise standard deviation of $2 \cdot \sigma$ was specified, where $\sigma$ is the standard deviation of the PurpleAir measurements (1.35 $\mu g / m^3$ in this example). Specifying the noise standard deviation was important as it prevented the GPR model from overfitting to the data; practically, this kept the interpolation smooth without "spikes" at each of the PurpleAir sites.

#### Predict aerosol concentrations over mesh of points

The GPR model was then used to predict aerosol concentration over a grid of 40,000 equally spaced locations (200 x 200) around the Southeast U.S.

#### Contour plot of predict values

A contour plot of the aerosol concentration values predicted by the GPR model was created.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/PA_SE_contours.png#small)

{:.caption}
Interpolated aerosol concentration contours in units of $\mu g / m^3$. Dots represent indiviudal PurpleAir sensor locations.

This plot makes it easy to see the overall trends apparent thoughout the Southeast U.S. - there are higher aerosol concentrations on the western side, decreasing in a roughly southeastern direction.

#### Surface plot of predicted values

This interpolated "field" of aerosol concentrations can be visualized more readily as a 3-D surface plot:

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/PA_SE_surface.png#small)

{:.caption}
Interpolated aerosol concentration surface in units of $\mu g / m^3$. Dots represent PurpleAir measurements from indiviudal sensors.

Here, the dots show the PurpleAir measurements that the GPR interpolation model was based on. This representation highlights the need for and the utility of the GPR model - the PurpleAir measurements appear very scattered when viewed by themselves making it difficult to obtain a comprehensive picture of how aerosol concentration is distributed throughout the region.

The same surface can be viewed in a slightly more informative way with the contours superimposed on a map of the Southeastern U.S.:

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/PA_SE_surface_map.png#small)

### Conclusion

{: .box-note}
**Scattered and noisy data from many individual, independent and non-uniformly sited PurpleAir sensors can be homogenized across a region using GPR interpolation. The resulting aerosol concentration field can be visualized easily with contour and surface plots.**

- GPR provides a powerful way to interpolate aerosol concentration values across a grid of points.

- The extensive spatial coverage of the low-cost PurpleAir sensors can be leveraged to provide a level of geographic detail that is difficult to obtain using a much smaller number of expensive regulator monitors.

- The high time resolution (2 minutes) of the low-cost sensors makes it possible to obtain a picture of how aerosol concentration fields evovle with time, which is not possible with the regulatory monitors.

---

### MATLAB script 

