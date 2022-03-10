---
layout: page
title: Who is Dale Murphy?
subtitle: If Murph was playing today, who would he be?
tags: [Python, scikit-learn, Pandas, PCA]
---

{: .box-note}
In this project, I wanted to use Python with statistics from FanGraphs to find out which 2021 MLB player most resembles Dale Murphy in each of his full seasons (1978-1991).

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/Dale_Murphy.jpeg#tiny)

{:.center}
[Image from Wikipedia](https://commons.wikimedia.org/wiki/File:Dale_Murphy_1984_Braves_Police_Set_(cropped).jpg){:target="_blank"}

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

When I was a kid growing up in Atlanta, there was no bigger Brave than Murph. Every kid wanted to be him with his long, lanky stride and graceful swing. He was a bright spot (_the_ bright spot?) on an otherwise lackluster Braves team for several years. Except for a short stretch from 1982 to 1984, the Braves never finished higher than _4th_ in the NL West while Murphy was with the team.

Yeah, I kind of liked Bruce Benedict and the way the fans always cheered his name and it sounded like they were booing him!  I liked Bob Horner and Glenn Hubbard, too, but nobody could compare to Murphy. I would have given you all of the Braves cards I had back then if you'd just give me the Dale Murphy card!

Despite his immense and enduring popularity in Atlanta, I've been finding that many of the students who take my freshman baseball statistics class, "Baseball by the Numbers," don't really know much about Murph. It doesn't help that he has been overlooked for induction into the Hall of Fame for many years.

So, I thought I would use the magic of machine learning to bring Dale Muprhy into the 2021 MLB season. Not really, of course, but I thought that if I could determine which 2021 players are most like Dale Murphy in each of his seasons, maybe my students could relate to him better and better appreciate his career. We'll see ...

### Objective

My objective with this project was to calculate a similarity score between Dale Murphy's seasonal stats and those of the 2021 MLB players. I then used those scores to find out who he most resembled year by year in his career.

I used PCA (Principal Components Analysis) to "project" Murphy onto today's players. Then, I determined which 2021 players were closest to him in this "PCA space" for each of his 14 seasons.

### Approach

The overall approach I took consisted of the following steps:

1. get statistics from FanGraphs for 2021 MLB players and for Dale Murphy (1978-1991)
2. put statistics on an equal footing by normalizing them with zero mean and unit standard deviation
3. reduce dimensionality of dataset by using PCA (principal components analysis)
4. calculate distances between all 2021 MLB players and each Dale Murphy season
5. find three closest 2021 MLB players for each season

### Statistics

For this project, I chose to use a set of statistics that were adjusted for the ballparks and eras in which the players played. The game has changed a lot over the past 30+ years, and using these stats allowed me to compare "apples to apples" when comparing Murphy's stats from the 1980s to those of the 2021 players.

The eight stats I used are:

* `WAR`   Wins Above Replacement
* `wRC+`  Weighted Runs Created, adjusted
* `BsR`   Baserunning Runs
* `Def`   Defensive Runs Saved
* `BB%+`  Percent of PAs with BB, adjusted
* `K%+`   Percent of PAs with K, adjusted
* `OBP+`  On-base Percentage, adjusted
* `SLG+`  Slugging Percentage, adjusted

Only `Def` and `BsR` are not adjusted, but I thought it was important to include statistics that directly quantify the players' defensive and baseruning contributions.


### Data Visualization

First, I'm going to represent the 262 MLB 2021 players according to their stats on a single plot. Then, I'm going to overlay Dale Murphy's individual season stats to visualize where they land relative to the 2021 players.

#### 2021 MLB Players

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/PCA_scores_2021.png)

{:.center}
Representation of 2021 MLB players by statistics with size of dot proportional to wRC+ and colored by Defensive Runs Saved.

In this representation, each dot represents an individual player from 2021 using something called _PCA_ (Principal Components Analysis). The x-axis ("PC 1") and y-axis ("PC 2") represent new coordinates that are better at separating the players than the original stats. In fact, these new coordinates are _linear combinations_ of those stats.

We notice a few things looking at this plot:

* wRC+, a measure of offensive performance, (represented by size of dot) tends to increase going from left to right (increasing PC 1)
* Defensive Runs Saved (represented by color of dot) tends to increase in going from bottom to top (increasing PC 2)

This tells us that PC 1 mostly represents offensive production and PC 2 represents defensive production. Of course, it's a little more nuanced than that, but this gives us a way to think about what the plot is showing us.

{:.box-note}
I used PCA (principal components analysis) to reduce the dimensionality from eight (statistics) to four. This works particularly well for a dataset like this one in which a lot of the variables co-vary; for example, WAR is made up of offensive, defensive and baserunning contributions, so of course it will co-vary with the individual statistics. You can read more about PCA in my post [here]({{ site.baseurl }}{% post_url 2021-09-17-PCA-in-a-nutshell %}).

#### Dale Murphy's Seasons

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/DM_PCA_scores.png)

{:.center}
Same as above but with Dale Murphy's statistics from individual seasons overlayed.

What we notice from this plot is that:

* **Murphy's defense wasn't stellar** (PC 2 values below 0)
* **He had some really good offensive seasons, 1982-1987** (PC 1 values > 3).

### Dale Murphy Similarity Scores

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/PCA_DM_zoom.png)

{:.center}
Same as above but zoomed in on Dale Murphy's best seasons (1982 - 1987).


### Conclusion

{: .box-note}
**Scattered and noisy data from many individual, independent and non-uniformly sited PurpleAir sensors can be homogenized across a region using GPR interpolation. The resulting aerosol concentration field can be visualized easily with contour and surface plots.**

- GPR provides a powerful way to interpolate aerosol concentration values across a grid of points.

- The extensive spatial coverage of the low-cost PurpleAir sensors can be leveraged to provide a level of geographic detail that is difficult to obtain using a much smaller number of expensive regulatory monitors.

- The high time resolution (2 minutes) of the low-cost sensors makes it possible to obtain a picture of how aerosol concentration fields evovle with time, which is not possible with the regulatory monitors.

---