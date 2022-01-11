---
layout: post
title:  "Minimize number of variables"
subtitle: "Keep your workspace from getting out of control."
cover-img: "/assets/img/binary_dark.jpeg"
thumbnail-img: "/assets/img/word_cloud.png"
thumbnail-img-source: "worditout.com"
thumbnail-img-link: "https://worditout.com/word-cloud/3676183"
date:   2021-08-23 13:37:06 -0500
tags: [MATLAB, tips & tricks, 10 things]
comments: false
readtime: true
---
{: .box-note}
NOTE: This is the second in my series of ["10 things I wish I had known when I started using MATLAB"]({% post_url 2021-08-15-10-things-I-wish-I-had-known %}).

You start out with your nice blank slate of a script and just start adding a few lines. You aren't sure exactly where you're going with it, so you just keep adding and adding. Then, you look up and your workspace is full of dozens of variables, some of which have super informative names like "temp" and "data." Sound familiar? We've all been there, believe me!

One of the great things about the MATLAB IDE (integrated development environment) is the workspace and the ability to see at a glance all of your variables, their types, their dimensions and even their contents (for small enough items). But that workspace gets harder and harder to use when its filled with dozens and dozens (don't judge me!) of variables.

So, what are we to do?

It seems so obvious ... just don't use so many variables. But, like I said, it's easy to look up and find that you've been coding along and filling up your workspace. Don't worry, there are things you can do to rectify the situation.

There are a couple of things you can do to keep the variable "bloat" down:

* recycle variables
* use arrays
* use structures
* clear variables

---

> Recycle variables

Sometimes you use variables for counting or for holding values temporarily. These are easily "recycled" to be used in a different situation. For example, you have a `for` loop with a counter `i`:

``` matlab
for i=1:10
   a(i) = a^i;
end
```

Later on, you need a loop to do something different, but you don't need to use a separate variable for the loop counter - just "recycle" `i`!

``` matlab
x=0.2;
for i=1:40
   taylor(i) = x^i/fact(i);
end
```
<br />

> Use arrays to "package" variables

Sometimes you find yourself with a couple of vectors that are all the same dimension. These are easily grouped together into a single array. For example:

``` matlab
names1 = ["Gary", "Donna", "Richard", "Antonia"];
names2 = ["Stephanie", "Raoul", "Herman", "Carter"];
names3 = ["Mary", "Stuart", "Arthur", "Gwendolyn"];
```

We can replace these by a single array:

``` matlab
names = [names1; names2; names3];
```

(obviously, the variables `names1`, `names2`, `names3` are still cluttering up the workspace; but, we can clear them (see below) as long as we don't need them again)

<br />

> Use structures to "package" variables

Another way to group variables into a single variable is with the `structure` variable type. As opposed to the `array` type, the different elements of a structure don't have to be of the same type. Each element of the structure is called a `field` and is accessed through "dot notation." For example:

``` matlab
people.names = ["Gary", "Donna", "Richard", "Antonia"];
people.ages = [24, 43, 17, 65];
people.state = ["Georgia", "Massachusetts", "New York", "Oregon"];
```

Now, there is just one variable in the workspace: `people`, and we can see its contents by typing `people` at the command line:

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/people_structure.png#small)

<br />

> Clear variables when you're done with them

This one is so obvious, but I had been using MATLAB for an embarassinglly long time before I realized I could do this. In fact, to be honest, I learned this trick from grading one of my students' homework scripts!

If a variable is no longer needed in your script, just clear it and it will be removed from the workspace:

``` matlab
clearvars names1 names2 names3
```

You can also clear all variables _except_ for certain variables:

``` matlab
clearvars -except people
```

Just make sure you don't type `clearvars` with no variable names because that will clear the entire workspace!



---