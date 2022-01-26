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

### Results

{:.center}
![waitbar]({{ site.baseurl }}/assets/img/DM_PCA_scores.png)

{:.center}
Representation of 2021 MLB players (colored) and Dale Murphy's full seasons (1978-1991) (black).

#### Data



### Conclusion

{: .box-note}
**Scattered and noisy data from many individual, independent and non-uniformly sited PurpleAir sensors can be homogenized across a region using GPR interpolation. The resulting aerosol concentration field can be visualized easily with contour and surface plots.**

- GPR provides a powerful way to interpolate aerosol concentration values across a grid of points.

- The extensive spatial coverage of the low-cost PurpleAir sensors can be leveraged to provide a level of geographic detail that is difficult to obtain using a much smaller number of expensive regulatory monitors.

- The high time resolution (2 minutes) of the low-cost sensors makes it possible to obtain a picture of how aerosol concentration fields evovle with time, which is not possible with the regulatory monitors.

---