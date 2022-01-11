---
layout: post
title:  "What is a model?"
subtitle: "All models are wrong, but some are useful!"
cover-img: "/assets/img/ML_dark.jpeg"
thumbnail-img: "/assets/img/gases_animated.gif"
thumbnail-img-source: "A. Greg from Wikipedia"
thumbnail-img-link: "https://en.wikipedia.org/wiki/Kinetic_theory_of_gases#/media/File:Translational_motion.gif"
date:   2021-08-07 13:37:06 -0500
tags: [Machine Learning, models]
comments: false
readtime: true
---

If you've done any reading about machine learning, you've probably come across the term "model" many times. You may be wondering what a model is and why is that term used. It's one of those things that is so commonplace that people forget that there was a time when they, too, didn't know what was meant by "model!"

Before we get to machine learning models, let's look at scientific models. Now, in science the term "model" is used to denote a representation of some system or process. That might not mean much to you, so let me give you a concrete example from physical chemistry (a subject that I happen to teach): Ideal Gases.

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/gases_animated.gif)

{:.center}
A box of ideal gas molecules.\\
[_Image by A. Greg from Wikipedia_](https://en.wikipedia.org/wiki/Kinetic_theory_of_gases#/media/File:Translational_motion.gif){:target="_blank"}

### Ideal Gases

#### Lots of molecules far apart
Gases are made up many, many individual atoms or molecules. Think about air - it's made up of a lot of nitrogen ($N_2$) and oxygen ($O_2$) molecules with trace amounts of other things. In fact, there are $2.5 x 10^{19}$ (25 trillion, trillion!) molecules in a cube with sides of only 1 cm. Nevertheless, most of what is inside that box is empty space. In other words, those molecules are really far apart from one another.

#### Billiard balls

And, even though at room temperature they are zipping around at about 500 m/sec. (over 1100 miles per hour!), they still don't run into each other that often. _And_, it turns out, when they do they don't do much to each other other than knock each other out of the way, kind of like billiard balls bouncing around on a billiard table. Those balls don't stick together (i.e. form bonds) or othewise alter each other's shapes or properties. Well, the same goes for those air molecules.

#### Real molecules aren't billiard balls
What does all of this have to do with a "model?" Well, thinking of the molecules in this way constitutes a model for how molecules behave. A model is like a cartoon representation of something that is easier to understand than the full-blown description, which may be very difficult, if not impossible, to know, anyway.

In reality, _real_ gas molecules don't behave exactly like this because they do, in fact, interact with each other when they get close to each other. But to describe that interaction requires us to know a lot more about the molecules and a lot more math. So, instead, we settle for a model that isn't quite as accurate but does a pretty good job under a lot of the kinds of conditions (e.g. temperatures and pressures) that we care about. And that model is represented by a simple equation that is convenient and easy to use:

$$
pV = nRT
$$

where $p$ is the pressure of the gas, $V$ is volume occupied by the gas, $n$ is the number of moles (quantity of molecules) of molecules, $R$ is the universal gas constant and $T$ is the temperature.

So, knowing three of the quantities, for example pressure, volume and temperature, we can calculate the other one, how many gas molecules (moles) there are.

{: .box-note}
The model is wrong (i.e. not exactly correct) but it is useful.

This model is not exactly correct because we have ignored interactions between molecules. Nonetheless, it is useful because we can calculate some property of the gas (e.g. number of molecules) knowing a few other easily measured quantities (e.g. $p$,$V$ and $T$). And, the degree to which it is "wrong" is miniscule and therefore acceptable over a wide range of condition that we typically consider.

---

So, now that we've seen what a _physical_ model is and how it is useful, let's look at [models in machine learning]({{ site.baseurl }}{% post_url 2021-08-12-models-in-machine-learning %}) ...