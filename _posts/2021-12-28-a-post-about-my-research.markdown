---
layout: post
title:  "MATLAB Featured Function: waitbar()"
subtitle: "Have you ever run a script and then waited and waited?"
date:   2021-12-28 13:37:06 -0500
categories: MATLAB
tags: featured-function waitbar
use_math: true
---
![waitingbar](/test-blog/assets/waitbar.jpg)

## **Have you ever run a script and then waited and waited wondering if it was actually running?**

Wouldn't it be great to have some sort of indication of the progress being made?

Well, fortunately MATLAB has a convenient function for creating a progress bar: `waitbar()`!

See the code snippet below for an example of how to use the  `waitbar()` function to display progress with a lengthy calculation (the Taylor series expansion of the exponential function):

$$
e^x \simeq f\left( x \right) = \sum_{i=0}^{lim} \frac{x^i}{i!}
$$

``` matlab
%% MATLAB snippet to calculate Taylor expansion of the exponential
%% function highlighting use of 'waitbar()' to generate a progress bar

lim = 5000;   % # of terms in expansion
x = 0.2;   % value of exponent
taylor = 0;

f = waitbar(0,'Progress');   % establish progress bar

for i = 0:lim
   waitbar(i/lim,f,'Progress');    % update progress bar
   taylor = taylor + x^i/factorial(i);   % add term to expansion
end

close(f)   % close progress bar
```
---


To use `waitbar()`, we must first initialize it and assign it a handle so that we can refer to it later. In the example, we assign the handle to the variable `f`. The text string, `'Progress'`, is what is to be displayed in the progress bar window:

``` matlab
f = waitbar(0,'Progress');   % establish progress bar
 ```
Then, any time we want to update the progress bar we call `waitbar()` again using the handle:

``` matlab
waitbar(i/lim,f,'Progress');    % update progress bar
```
Finally, when we are done with the calculation we close the progress bar window:

``` matlab
close(f)   % close progress bar
```


---

Read more at the official MathWorks documentation for the [waitbar() function](https://www.mathworks.com/help/matlab/ref/waitbar.html).

[waitbar-doc]: https://www.mathworks.com/help/matlab/ref/waitbar.html
