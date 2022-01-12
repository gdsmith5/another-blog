---
layout: post
title:  "Avoid for loops, if possible"
subtitle: "Unleash the power of vectorization!"
cover-img: "/assets/img/binary_dark.jpeg"
thumbnail-img: "/assets/img/end_for.png"
thumbnail-img-source: "author"
date:   2021-08-27 13:37:06 -0500
tags: [MATLAB, tips & tricks, 10 things]
comments: false
readtime: true
---
{: .box-note}
NOTE: This is the third in my series of ["10 things I wish I had known when I started using MATLAB"]({{ site.baseurl }}{% post_url 2021-08-15-10-things-I-wish-I-had-known %}).

MATLAB is set up to run very efficiently on what is called _vectorized_ code. What that means is that it carries out computations in a matrix- or vector-based way.

Practically, what this means is that it is often more efficient to replace a `for` loop with its vectorized equivalent. Maybe an example will help.

In a [previous post]({{ site.baseurl }}{% post_url 2021-09-03-waitbar %}), we calculated the value of $e^{0.2}$ using the Taylor series expansion:

``` matlab
lim = 5000;   % # of terms in expansion
x = 0.2;   % value of exponent
taylor = 0;

tic
for i = 0:lim
   taylor = taylor + x^i/factorial(i);   % add term to Taylor expansion
end
toc
```

As implemented with this `for` loop, this calculation takes 12 milliseconds on my computer (read the [post on the `tic()` and `toc()` functions]({{ site.baseurl }}{% post_url 2021-09-10-tic-toc %})).

Now, what if we vectorize this to get rid of the `for` loop?

``` matlab
tic
i = 0:5000;
taylor = sum(x.^i./factorial(i));
toc
```

It takes a measly 0.8 milliseconds! **Over an order of magnitude improvement in efficiency just by vectorizing!!!**

Not only do we get an improvement in speed, but it takes one less line.

---

Read more at the official MathWorks documentation about [vectorization](https://www.mathworks.com/help/matlab/matlab_prog/vectorization.html){:target="_blank"}.