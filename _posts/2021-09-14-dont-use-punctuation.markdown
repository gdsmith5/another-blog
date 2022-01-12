---
layout: post
title:  "Don't use punctuation or spaces in table names!"
subtitle: "MathWorks warned me ..."
cover-img: "/assets/img/binary_dark.jpeg"
thumbnail-img: "/assets/img/exclamation_point.png"
thumbnail-img-source: "author"
date:   2021-09-14 13:37:06 -0500
tags: [MATLAB, tips & tricks, 10 things]
comments: false
readtime: true
---
{: .box-note}
NOTE: This is the fifth in my series of ["10 things I wish I had known when I started using MATLAB"]({{ site.baseurl }}{% post_url 2021-08-15-10-things-I-wish-I-had-known %}).

This is one of those tips that's not really a tip at all. It's more like an admission of guilt and ignorance. I hope you learn from my mistakes!

---

#### Name your variables something meaningful

It's so obvious that it hardly bears mentioning, but ... you should _always_ try to name your variables with meaningful names. This will help you in so many ways, especially as your script develops and your workspace gets more and more crowded (side note: read my [post about avoiding workspace "bloat"]({{ site.baseurl }}{% post_url 2021-08-23-minimize-variables %})).

For example, maybe we have a vector of names, and instead of calling it something generic, like `data` or `vec` or, my personal favorite, `temp` (because I'm lazy), let's call it something that will remind us and/or inform someone else reading our script what the variable contains, like I don't know ... `names`:

``` matlab
names = ["Gary", "Donna", "Richard", "Antonia"];
```

That wasn't so hard, was it?!?!

---

#### Beware the punctuation

Sometimes, though, it can be easy to get carried away when naming variables and you start using punctuation or spaces. Well, to be technically accurate, you _can't_ use punctuation or spaces in variable names because MATLAB won't let you. For example, maybe we want to be really descriptive and call our vector of names `first names`; well, that's not allowed. MATLAB will only allow us to name variables according to these rules:

* the variable name must start with a letter
* the variable name can be followed by letters, digits or underscores
* the letters are case sensitive, so "a" is different than "A"

So, we could name our vector `first_names` (notice the underscore in place of the space).

We cannot name our vector `first_names!` or `first_names*` or anything else containing punctuation (other than the underscore character).

#### Super beware the punctuation in `tables`

I know, "super beware" is not a phrase, but maybe it will catch on. Anyhow, what about `tables`? `Tables` are great because we can assign a name to each column, and the variable types represented in each column can be different. So, we have a lot of flexibility in how we refer to our data (just remember that in a `table` each column must have the same number of rows).

Here's an example of a table with measurements of atmospheric particulate matter (PM) concentration made with different instruments (that we saw in a [previous post about using flags]({{ site.baseurl }}{% post_url 2021-09-07-use-flags %})):

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/PA_PM_data.png#small)

We can access data from this table by referring to row and/or column names. For example, if I want the set of measurements from the reference instrument ("PM_ref"):

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/PA_PM_table_entry.png#tiny)

Very handy because I don't have to remember that "PM_ref" is the fourth column. In fact, it could be moved around within the table and I could still refer to it as `PA_PM_data.PM_ref` because it would retain that name.

However, I ran into trouble when naming my columns because I was trying to be too descriptive and precise. Instead of calling the column "PM_ref", I called it "PM 2.5 ref". Why did I do this you ask? Because technically the quantity being measured is the particulate matter concentration of aerosol particles _less than 2.5 $\mu m$ in diameter_ - hence the "2.5" in the name. And the real problem is that MATLAB let me do it!

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/PA_PM_table_with_bad_name.png#small)

Now I can't refer to the "PM 2.5 ref" column as easily with `PA_PM_data.PM 2.5 ref` because my column name has **spaces** in it and a **period**! Doh!

I can still access that column by name, but it's a lot clunkier:

``` matlab
meas = PA_PM_data{:,'PM 2.5 ref'};
```

---

So, just don't use spaces or punctuation in your table names even though it is allowed. **Just don't do it!**