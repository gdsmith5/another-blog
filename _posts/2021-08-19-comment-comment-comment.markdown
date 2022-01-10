---
layout: post
title:  "Comment, comment, comment!"
subtitle: "A little time now saves a lot of time later."
cover-img: "/assets/img/binary_dark.jpeg"
thumbnail-img: "/assets/img/comment.jpg"
thumbnail-img-source: "author"
date:   2021-08-19 13:37:06 -0500
categories: MATLAB
tags: [MATLAB, tips & tricks, 10 things]
comments: false
readtime: true
---
{: .box-note}
NOTE: This is the first in my series of "10 things I wish I had known when I started using MATLAB."

When you're busy writing your script and are focused on how to implement something or what the correct syntax for a particular function is or you're just debugging, it can be hard to stop your flow to comment your code. You may feel like you want to wait until it's perfect before adding comments because why comment something that doesn't end up making into the final version? Or, what you are writing seems so obvious that you think "how could anyone, myself included, need an explanation for this?"

Believe me, I've been there. In fact, I never used to comment my code (in any language, not just MATLAB) ... I get it!

However, I'm a reformed commenter, and I'm here to tell you that **you should comment!!!**

There are a multitude of reasons why you should comment:
{: style="color:red; font-size: 120%;"}

> Commenting makes it easier for others to read, understand and modify your code.

Even if you think you are just writing your script for your own use, you never know if it is something that you will want to share with others down the road. And, often the people using your script will want to know not just how to run it but how it works as well. Comments defining key variables and important sections will help get them oriented.

example:
``` matlab
lim = 10; % this is the number of iterations to perform
```
<br />

> Commenting helps you when you come back to your script.

You may need a little help understanding your _own_ code down the road, too! When you are knee deep in a project it can be difficult to appreciate how hard it may be to come back to your code and pick up where you left off. Do your future self a **big** favor and comment what you are doing and, ideally, why you are doing it. You'll thank yourself later.

example:
``` matlab
% calculate the Taylor series expansion
for i = 0:lim 
   taylor = taylor + x^i/factorial(i);
end
```
<br />

> Commenting forces you to articulate what you are doing.

_**This is the biggest benefit that I have derived from commenting more prolifically**_. Especially when I start a new section, I almost always make myself stop and think about what this section is going to be about. This helps me focus on the "bite-sized" chunk of code that I want to include in that section. By doing this, I often realize that what I originally had in mind is actually a little too large for a single section (many bites!). This practice has also helped me from kind of meandering as I write the code. And, of course, the comments at the beginning of a section serve the dual purpose of providing a nice summary when you (or someone else) comes across to that section later.

example:
``` matlab
%% This section calculates the Taylor series expansion for e^x

taylor = 0;
lim = 10;
x = 0.2;

% calculate the Taylor series expansion for e^x using 'lim' number of terms
for i = 0:lim 
   taylor = taylor + x^i/factorial(i);
end
```
<br />

> Commenting helps define sections of your script.

As I alluded to above, commenting helps define sections within your script ... literally! In MATLAB, comments are indicated with a leading "%" symbol - everything on that line after that symbol is a comment that is not parsed by MATLAB. Two of these, "%%", indicate the beginning of a new section, and any comment on that line after them is bolded. Thus, you can quickly and easily see where section are and read what they do.

example:
``` matlab
%% This section calculates the Taylor series expansion for e^x

taylor = 0;
lim = 10;
x = 0.2;

% calculate the Taylor series expansion for e^x using 'lim' number of terms
for i = 0:lim 
   taylor = taylor + x^i/factorial(i);
end

%% This section calculates the difference between the Taylor expansion and the calculated value of e^x

difference = taylor - exp(x);
```
<br />

> Commenting provides a convenient way to parts of the script that you want to remove temporarily.

Sometimes you're debugging your script and you think the problem is on a certain line or set of lines. You can comment them out and then re-run the script to see how it does. Then, it's very easy to uncomment them if you decide you want to keep them. That way, you don't have to worry about losing something if you temporarily delete it as you debug.

example:
``` matlab
%% This section calculates the Taylor series expansion for e^x

taylor = 0;
lim = 10;
x = 0.2;

% calculate the Taylor series expansion for e^x using 'lim' number of terms
for i = 0:lim 
   taylor = taylor + x^i/factorial(i);
end

%% This section calulates the difference between the Taylor expansion and the calculated value of e^x

% difference = taylor - exp(x);   commented out to see if this is slowing it down
```
<br />

---

{: .box-note}
Did you know that there are keyboard shortcuts in MATLAB that make it super easy to comment or uncomment lines?

`⌘`+`/` (on a Mac) or `Ctrl`+`/` (on a PC) will comment the current line or selected lines.

Likewise, `⌘`+`t` (on a Mac) or `Ctrl`+`t` (on a PC) will uncomment the current line or selected lines.

---

Learn more about [commenting in MATLAB][link_id]{:target="_blank"} on the MathWorks site.

[link_id]: https://www.mathworks.com/help/matlab/matlab_prog/comments.html