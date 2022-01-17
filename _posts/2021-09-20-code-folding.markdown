---
layout: post
title:  "Code 'folding'"
subtitle: "When you just don't want to see your code"
cover-img: "/assets/img/binary_dark.jpeg"
thumbnail-img: "/assets/img/fa_align_left.png"
thumbnail-img-source: "fontawesome.com"
thumbnail-img-link: "https://fontawesome.com/v4.7/icon/align-left"
date:   2021-09-20 13:37:06 -0500
tags: [MATLAB, tips & tricks, 10 things]
comments: false
readtime: true
---
{: .box-note}
NOTE: This is the sixth in my series of ["10 things I wish I had known when I started using MATLAB"]({{ site.baseurl }}{% post_url 2021-08-15-10-things-I-wish-I-had-known %}).

You're working along, and before you know it that minimalistic code snippet that you started writing just a little while ago has turned into a 100-line behemoth! Good coding practice would have you _refactor_ - that's a term from software design that basically means to clean up your code. Refactoring makes the code easier to:

* read
* maintain (i.e. fix problems)
* extend (i.e. add capabilities)

There are a lot of ways to clean up your code, including adding explanatory comments (see [post on that]({{ site.baseurl }}{% post_url 2021-08-19-comment-comment-comment %})!), extracting components as separate functions and the one I want to discuss here, code "folding."

#### Code folding

What do I mean by code "folding"? It's a very simple way to reduce the clutter in your editor. You simply hide away parts of the code that you don't currently need to look at. They aren't removed from the code, they are just sort of "folded up" until you need to look at them again. They are still run when you run your script. Here's an example from a script I wrote for an in-class activity from my _Machine Learning for Chemistry_ graduate course:

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/code_folding.png)

{: .box-note}
You can get the script for this in-class activity and the accompanying instructions at the [GitHub repository](https://github.com/gdsmith5/CHEM-8860/tree/main/CHEM-8860-Activities){:target="_blank"} for the course.

You notice that I've broken the script up into five different sections by using the `%%` notation to denote sections in MATLAB. The whole script is 58 lines long, and so to avoid having to scroll down a lot to get to the last section, "5. Cross Validation", I simply folded the other four sections up. Now, we just see their section headings without all of the associated lines of code.

Code folding in MATLAB is really easy because you just have to click the `-` you see next to the section. If you want to unfold it later, just click on the `+` next to a folded section.

You might also notice that there is a `-` next to the `for` loop; clicking on that will fold up the `for` loop to get it out of your way, too!

---

Read more about [code folding](https://www.mathworks.com/help/matlab/matlab_prog/edit-and-format-code.html#brazeg3-1){:target="_blank"} in the official MathWorks documentation on editing and formatting code.