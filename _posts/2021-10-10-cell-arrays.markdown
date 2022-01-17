---
layout: post
title:  "Cell arrays"
subtitle: "Arrays of anything!"
cover-img: "/assets/img/binary_dark.jpeg"
thumbnail-img: "/assets/img/cell_array.png"
thumbnail-img-source: "author"
date:   2021-10-10 13:37:06 -0500
tags: [MATLAB, tips & tricks, 10 things]
comments: false
readtime: true
---
{: .box-note}
NOTE: This is the eight in my series of ["10 things I wish I had known when I started using MATLAB"]({{ site.baseurl }}{% post_url 2021-08-15-10-things-I-wish-I-had-known %}).

MATLAB has a wide variety of variable types available, but one that took me an _embarassingly_ long time to learn about and appreciate is the `cell array`.

The `cell array` is one of the most flexible ways to store data because it can contain data of different types. So, a `cell array` could contain a text string, a number, a matrix, and even another cell array!

Here's an example of a `cell array`:

``` matlab
cell_array = {"Douglas", 48, [1,0;0,1]};
```

You can address elements of a cell array numerically by their position. For example, `cell_array{1}` returns `"Douglas"`.

Note the use of "{ }" brackets denoting the cell array and distinguishing it from regular arrays (which are defined using "[ ]" brackets and are referenced using "( )" brackets).

Now, to be 100% correct, you can use "( )" to address cells - you'll just get a subset of the cell array back, not the _values_ of those elements in the cell array. Confusing? Here's another example: if I type `cell_array(1)` I get `{"Douglas"}` back. See how what was returned was a cell array, itself? 

---

Read more about [cell arrays](https://www.mathworks.com/help/matlab/cell-arrays.html?s_tid=CRUX_lftnav){:target="_blank"} in the official MathWorks documentation.