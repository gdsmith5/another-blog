---
layout: post
title:  "Run code in sections"
subtitle: "Sometimes you just want to run part of your script."
cover-img: "/assets/img/binary_dark.jpeg"
thumbnail-img: "/assets/img/matlab_run_section.png"
thumbnail-img-source: "author"
date:   2021-10-02 13:37:06 -0500
tags: [MATLAB, tips & tricks, 10 things]
comments: false
readtime: true
---
{: .box-note}
NOTE: This is the seventh in my series of ["10 things I wish I had known when I started using MATLAB"]({{ site.baseurl }}{% post_url 2021-08-15-10-things-I-wish-I-had-known %}).

One convenient feature of the MATLAB IDE (integrated development environment) that I use all the time is the ability to run just a single section instead of the whole script.

"Why would you want to do that?", I hear you asking. Well, you might want to run just one section so that you can

- debug that part of your script
- play around with some value/function/model and see how it changes the results
- speed up script execution (if preceding part of script takes a long time to run)

### How to run a section

Running just a section is easy as long as the cursor is in any part of the section. Just click on the "Run Section" button (shown below) or use the keyboard shortcut, `⌘` + `⏎`.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/matlab_run_button.png#small)

### Example

Here is an example of how I used code "folding" to hide sections of the script that I didn't need to look at and then I ran just the section that was "unfolded." This is a great example of how useful sections in a script can be for compartmentalizing your code and making it easier to focus on just one part. (read more about code "folding" in this [post]({{ site.baseurl }}{% post_url 2021-09-20-code-folding %}))

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/in_class_activity_folded.png)

In this example, I've already run Sections 1 ("Collect Data and Explore") and 2 ("Feature Selection"). Now, I want to play around with different models to fit to my data, so I will change which model I choose (lines 36-38) and re-run this section - there's no need to collect the data, explore it and select features (Sections 1 and 2) all over again.

{: .box-note}
You can get the script for this in-class activity and the accompanying instructions at the [GitHub repository](https://github.com/gdsmith5/CHEM-8860/tree/main/CHEM-8860-Activities){:target="_blank"} for the course.

### How to run a section ... and then keep going

In the example, above, I wanted to change the model I was using and then fit the data to that model (Section 3). But, maybe I also wanted to test that new model and do cross validation on it. There's a very easy way to do that in MATLAB, just select the "Run to End" button (see screenshot, above). 

---

Read more about [running sections](https://www.mathworks.com/help/matlab/matlab_prog/create-and-run-sections.html#responsive_offcanvas){:target="_blank"} in the official MathWorks documentation.