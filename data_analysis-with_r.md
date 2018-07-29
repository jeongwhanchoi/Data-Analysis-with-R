# Data Analysis with R

## R Basics

### Install R Studio on a Mac

- Download and install the R programming language **FIRST** at [http://cran.rstudio.com](http://cran.rstudio.com/).   
- After you install R, you can download and install RStudio from [http://www.rstudio.com](http://www.rstudio.com/). 

**I do not recommend installing R and RStudio using Homebrew or MacPorts**.

### R Studio Layout

- All four panels are configurable. The layout discussed is the default layout for RStudio. 
- You can change the default layout by going to Tools -> Options…

![RStudio_layout](./img/RStudio_layout.png)

[Quick Guide to R Layout](http://dss.princeton.edu/training/RStudio101.pdf) by Oscar Torres-Reyna.

### Swirl

I recommend anyone new to R and RStudio to try [**Swirl**](https://swirlstats.com) (statistics with interactive R learning). Swirl is a software package for the R statistical programming language. Its purpose is to teach statistics and R commands interactively.

Type the following commands in the **Console**, pressing Enter or Return after each line:

```R
install.packages("swirl")
library(swirl)
swirl()
```

Note that the `>` symbol at the beginning of the line is R's prompt for you type something into the console. I include it here so you know that the above commands are to be typed into the console and not elsewhere. The part you type begins after `>`. 

#### Exit swirl

If you want to exit swirl, type the code below:

```r
bye()
```

Then leaving swirl now. Type `swirl()` to resume.

### Read and Subset Data

Read [this tutorial](http://flowingdata.com/2015/02/18/loading-data-and-basic-formatting-in-r/) on loading data into R by Nathan Yau.

[How to Subset Data](http://www.statmethods.net/management/subset.html)

#### Setting Workspace

```r
getwd() # print the current working directory - cwd 
ls()    # list the objects in the current workspace
```

```r
setwd(mydirectory)      # change to mydirectory
setwd("/usr/rob/mydir")
```

#### Read Data

```r
stateInfo <- read.csv('stateData.csv')
```

When I run this code above, I can see that `stateInfo` appears in my environment layout. I can double click on my data frame in the workspace, and this will let me see the table of values in RStudio. 

![read_subset_data](./img/read_subset_data.png)

#### Subset Data

Here I'm passing the data frame, `stateInfo` to subset and I'm asking for it to retrieve any states that have a `state.region` equal to `1`. 

```r
subset(stateInfo, state.region==1)
```

When I run this code above, I can see the output down below.

![subset_1](./img/subset_1.png)

Now, there is another way to subset this data frame.

It uses bracket notation, where I have the name of my dataset followed by two brackets.

```r
dataset[ROWS, COLUMNS]
```

The first spot is for the rows of my dataset that I want to keep, and the second spot is for the columns that I want to keep. So if I want only the states in the Northeast, I would write this code below.

```r
stateInfo[stateInfo$state.region==1, ]
```

The name of this dataset is `stateInfo` and then I want the rows that have a `state.region` equal to `1`. Now, I can't use just `state.region` here, I need to access the actual variable, so I have to put `stateInfo` and the `$` sign. This gives me the actual variable value, and I can see if it's equal to `1`. If it's equal to `1`, I want to return every single column in the data frame. So for example, with `Connecticut` if it's `state.region` is equal to one, I want to return every single column in this row. To return all the columns, I'll just leave this blank.

![connecticut](./img/connecticut.png)

So this code searches for rows that have a `state.region` equal to `1`. And then it takes all the columns in that row. All of this will be sent to the console as a new data frame. Now it might not be so helpful to have this output just in the console. 

![subset_2](./img/subset_2.png)

So I can save these subsets into new variables. I'm also going to include some functions to print out the first two rows of each data frame, and also their dimensions.

![subset_3](./img/subset_3.png)

Now, I really want you to pay careful attention to the syntax in both of these examples. I tend to make use of the subset command, but there might be instances where I use this.

```r
stateSubset <- subset(stateInfo, state.region==1)

stateSubsetBracket <- stateInfo[stateInfo$state.region==1, ]
```

### R Markdown Documents

Markdown is a simple formatting syntax for authoring web pages (click the **Help** toolbar button for more details on using R Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document.

The file, [demystifyingR2.Rmd](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/eda-course/lesson2/demystifyingR2.Rmd), is the example R Markdown with some codes. 
There is a difference between using the hash or pound symbol`#`inside and outside of a `{r}` block of code.

```
​```{r}
# The hash or pound symbol inside the r block creates
# a comment. These three lines of are not code and cannot be # executed.
x <- [1:10]
mean(x)
​```
```

If you use the `#` symbol outside of an `{r}` block of code, you can create headers of text. 

[Markdown Tutorial](https://www.youtube.com/watch?v=6A5EpqqDOdk): You can also use Markdown to format your posts in the discussions. 
I need to install and load the package `knitr` in order to use the **KNIT HTML** button . Run the following commands in the RStudio console to install and load knitr. 

```r
install.packages('knitr', dependencies = T)
library(knitr)
```

Here is the fantastic [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/). 

### Factor Variables

- Read in the file. (Check your current working directory again everytime!)

```R
reddit <- read.csv('reddit.csv')
```

- Running the `str()` command, we can see that there's lots of data here.

```r
str(data)
```

![str_data](./img/str_data.png)

```r
str(reddit)
```

![str_reddit](./img/str_reddit.png)

Most of these variables have a type of factor. Now, a factor's a categorical variable that has different flavors or levels to it. An example of this would be emplyment status. This variable has many different levels such as employed full time, or employed part time, or not working. One thing we might be ineterest in is how many people are in each group of employment status. We can table that variable to see the number in each of these groups. 

```
$ employment.status: Factor w/ 6 levels "Employed full time",..: 1 1 2 2 1 1 1 4 1 2 ...
```

Running this code:

```R
table(reddit$employment.status)
```

 I can see the table like this below:

![reddit_table_emp](./img/reddit_table_emp.png)

We can also get these counts and other data points  by running the summary function on our data frame. In addition to factor variables like employment status, the R programming language also has other data types like list and matices.

Learn more about [Data Types](https://www.statmethods.net/input/datatypes.html).

### Ordered Factors

Now, I want to draw your attention to the `age.range` variable right here.

```
$ age.range        : Factor w/ 7 levels "18-24","25-34",..: 2 2 1 2 2 2 2 1 3 2 ...
```

Notice that it says that we have a factor variable with seven different levels. We can examin the levels of a varible, by typing in the command levels and thewn putting it the variable right here.

```R
levels(reddit$age.range)
```

In the console we can see the seven levels of the `age.range` varible. 

![reddit_levels](./img/reddit_levels.png)

Now, instead of creating a table of the `age.range` variable, let's create a plot that shows how many users are in each bin. That is, we want to figure out how many surveyed respondents are between the ages of 18 and 24,25 and 34, and so on. 

I'm going to create this plot using the `ggplot2 package`, and the qplot function that comes with it. 

> **Install ggplot2 package**
>
> To run the `qplot` function you must have the `ggplot2` library installed and loaded. You can do that by running these two lines of code.
>```r
>install.packages('ggplot2', >dependencies = T)
>library(ggplot2)
>```
>
>For those on Mac OS X 10.9 (or more recent OS X updates), the above line of code may display an error in the Console and fail to load ggplot2. This is due to a recent software update deleting the X11 symlink. You will need to *reinstall* XQuartz from <http://xquartz.macosforge.org/> and then run the following lines of code: 
>
>```r
>install.packages('devtools', >dependencies = T)
>library(devtools)
>install_version("colorspace","1.2-4")
>```

When I run this code,

```r
qplot(data = reddit, x = age.range)
```

 I get my plot over here. Zoooming in on this plot, I want you to notice that the age groups appear to be in order.

![reddit_plot](./img/reddit_age_plot.png)

This is true for everyone except the survey takers who are under the age of 18. Now, it would be really hepful if this bagr was really oriented overe left side. That way we could make comparisons across the groups more easily. Now this is why we would want to have ordered factors. The variable `age.range` just contains factors with seven levels, but these levels aren't arranged in any particular order. Sometimes you want to introduce order into our dataset. So that way we can make more readable plots. 

### Setting Levels of Ordered Factors

![reddit_ggplot_entire](./img/reddit_ggplot_entire.png)

If we try to see the amount of users in each age group, it's hard to compare immediately. This problem is even more noticeable on a different plot. If we try to create the same plot for users in each income bracket, we see a very similar problem.

![reddit_income_plot](./img/reddit_income_plot.png)

And here it's much worse. These first two bins are for a 100,000 and over 150,000, and this last bin is for people who make under 20,000. Our eyes tend to read pages from left to right, so this graph is pretty hard to interpret. Or even better said, it's very hard to make comparisons naturally with our eyes. We have to always scan down to the bottom to figure out what group we're in. So let's order the factors in our age.range varibale.

#### Solution

[How to set and order factor levels](http://stats.idre.ucla.edu/r/modules/factor-variables/).

One way to do this is to use the `ordered()` funtion on the varible. We'll use the `ordered()` funtion on `age.range`,  and then we'll set the levels. I can run all this code below to set the levels, 

```r
reddit$age.range <- ordered(reddit$age.range, levels = c('under 18', '18-24', '25-34', '35-44', '45-54', '55-64', '65 of Above'))
```

and then, I can make my  plot again.

![reddit_age_ordered_plot](./img/reddit_age_ordered_plot.png)

#### Alternate Solution

Another way to achieve the same result would be to use this code. Here, we're using the `factor()`. We're taking our `age.range` variable, setting the levels, and then making the order be ture since we want these ordered.

```r
reddit$age.range <- factor(reddit$age.range, levels = c('under 18', '18-24', '25-34', '35-44', '45-54', '55-64', '65 of Above'), ordered = T)
```



### Data Munging

It's important to note that many of the datasets that we've used so far are what I would call tidy datasets. What I mean is that these data sets were manipulated into a specified format of rows and columns. This is what allowed us to so easily important these datasets into R. You should know that not all datasets are going to be so nice. Sometimes, you may be pulling data from different sourves, like webpages, audio files, or even PDFs. Other times, you may need to reshape or rearrange your data into different formats.

The important thing to know is that this is a necessary step prior to conducting EDA and it's called data munching. There are plenty of tools for doing this kind of work, and if you're interested in learning more about how to wrangle and adjust data, check out the links below to.

> [Data Wrangling with MongoDB: Data Manipulation and Retrieval](https://www.udacity.com/course/ud032)
>
> Read this [fantastic tutorial](http://flowingdata.com/2015/02/18/loading-data-and-basic-formatting-in-r/) on loading data into R by Nathan Yau.
>
> [Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf) by Hadley Wickham
>
> [Tidy Data Presentation](http://courses.had.co.nz.s3-website-us-east-1.amazonaws.com/12-rice-bdsi/slides/07-tidy-data.pdf) by Hadley Wickham (June 2012)

---



## Explore One Variable

### Pseudo-Facebook User Data

I can use the `list.files()` command to figure out what that files are within this directory.

```r
list.files()
```
To read in the dataset I'm going to use the `read.csv()` command. But, I need to be a little bit careful. I need to indicate that the separator is really a tab, and that's because we're working with a tab separated values file. 

```r
pf <- read.csv('pseudo_facebook.tsv', sep ='\t')
```

Running the command, I can see that I get my data set up in R. Now this dataset is similar to the kind that data scientists see from time to time at Facebook, and it's especially the type of data that they'll use when doing EDA. 

This file has approximately 99,000 rows or observations in it with 15 variables. Each observation represents a user and that user wil have different information such as their age, their name or their date of birth.

![pf_rows](./img/pf_rows.png)

We can see by running the names command.

```R
names(pf)
```

Now in this entire process our goal is to understand our user's behavior and their demographics. We're going to want to understand what they're doing on Facebook and what they use. This is why you see things like `friend_count`, `www_likes` and `mobile_likes`. 

![names(pf)](./img/names(pf).png)



> You could also use the following code to load the Pseudo Facebook data. 
> `read.delim('pseudo_facebook.tsv')` 
>
> The `read.delim()` function defaults to the tab character as the separator between values and the period as the decimal character. Run `?read.csv` or `?read.delim` in the console for more details.



### Histogram of Users' Birthdays

The first thing we need to do is download and install the `ggplot2` library.


> **If you did not install the `ggplot`, type the code below.**
>
> ```R
> install.packages('ggplot2')
> ```

Now that we have got the `ggplot2` loaded, let's use the `qplot()` function to plot a histogram showing the number of users whose birthdays fall on any given day. I can run their `name(pf)` command to get an output of all my variables. 

![names(pf)](./img/names(pf).png)

Now, I'm trying to create the date of birth by day histogram for all my users.  So I'm going to use the `dob_day`.

For the `qplot()` function, I'll pass it two parameters, `x`, and `data`.  `x` is going to take the variable of `dob_day`, and `data`'s going to take the variable `pf`, which is where all my data comes from, from the pseudo Facebook dataset. 

```r
qplot(x = dob_day, data = pf)
```

Running this command, I see my histogram come out in a plot window below. 

![pf_dob_day_plot](./img/pf_dob_day_plot.png)

Now, you might notice that this plot is slightly different in color. If you're curious about setting color and themes in R, see this below.

> Run the following code in R to get other themes.
>
> ```
> install.packages('ggthemes', dependencies = TRUE)
> library(ggthemes)
> ```
>
> The ggthemes package was developed by Jeffery Arnold. Check out [examples](https://github.com/jrnold/ggthemes#examples) of the themes on the github page. 
> Chris is using `theme_minimal()`with the font size set to 24, which is why his output might look slightly different than yours. You can set the same theme in R by running the following code, or you can set the theme to a choice of your own. 
> `theme_set(theme_minimal(24))` 

Getting back our code in console, you can see that we get this warning message, when we run the code.

![qplot_err](./img/qplot_err.png)

This is fine for now but, you should think about what this warning message means.

Let's fix the label on the x axis, so we can see everyday of the month here. So to adjust the x axis, I'm going to add a `+` sign right after my code and then hit **Return**.

```r
qplot(x = dob_day, data = pf) +
	scale_x_continuous(breaks=1:31)
```

This immediately takes me down the next line with a little bit of indentation right here. I'm going to add the layer scale x discrete and then give it the priority order breaks from 1 t0 31. This is because I want all my days to be 1 to 31, the days of the month. And running this code, we can see we've done a little bit better.

![pf_dob_day_plot_31](./img/pf_dob_day_plot_31.png)

> Instead of using the `qplot()` function, you can also use the `ggplot()` function to create the histogram:
>
> ```
> ggplot(aes(x = dob_day), data = pf) +
>   geom_histogram(binwidth = 1) +
>   scale_x_continuous(breaks = 1:31)
> ```
>
> When you register at a websites, some sites have default setting that use the 1st day of the month under the birth day field. Some also use a default month of January.
>
> In the case of Facebook, Jan and the 1st are the first drop down items that appear on the site. It's important to think about such details and the data generating process when exploring data.

### Moira's Investigation

This paper below is whether people's perception of their audience on Facebook matches up to the reality. Who's actually seeing the content that they're sharing. Because who think is in your audience really affects how you present yourself. 

[Bernstein, M. S., Bakshy, E., Burke, M., & Karrer, B. (2013). Quantifying the invisible audience in social networks. In Proceedings of the SIGCHI Conference on Human Factors in Computing Systems (CHI 2013), pp. 21-30](http://hci.stanford.edu/publications/2013/invisibleaudience/invisibleaudience.pdf).

#### Perceived Audience Size

What she found, was that people dramatically underestimated the size of their audience. Typically, they guessed that their audience was about a quarter of the size that it actually was. When she first approached this problem, she plotted a bunch of histograms. She wanted to kwow how many people do people think are in their audience. So the first thing I did was, she know, she opened up R, and in `ggplot`, she plotted a histogra if people's guesses.

### Faceting

We can brek this histogram into twelve histograms, one for each month of the year. The code would look like this.

```r
qplot(x = dob_day, data = pf) + scale_x_continuous(breaks=1:31) +
facet_wrap(~dob_month, ncol = 3)
```

First, I'm going to add a layer and that layer is going to be called `facet_wrap()`.  `facet_wrap()` takes a formula where we have a tilde, and then we're going to use the variable that we're going to split our data over. In this case, `dob_month`. We have the number of columns set equal to three, and then we can run this code and see the ouput.

![pf_faceting_plot](./img/pf_faceting_plot.png)

So notice, we took our one histogram and split it into 12 histograms. Since we set `ncol` are the number of columns equal to three, we can see the three columns in our one plot. Now, this one stands for January. This two would be for Februart, and so on. And if I wanted to I have used `ncol` equals four. It would have just given me a slightly different plot with four columns. Before we keep coding anymore, I want to focus on this `facet_wrap()`. Specifically, this formula right here. In general, `face_wrap()`  takes in a formula inside of its parenthesis. The formula contains a tilde sign followed by the name of the variable that you want to facet over. This allows you to create the same type of plot for each level of your categorical variable. In our case, we wanted to make histograms of `dob_day`, one for each month of the year. A similar layer to `facet_wrap()` is `facet_grid()`.

```R
facet_wrap(formula)
facet_wrap(~variable)
```

`facet_grid()` also takes a formula, but it's in a little bit different form. It's formula contains variables that we want to split over in the vertical direction, followed by a tilde sigh, and then the name of the variables we want to split in the horizontal direction. In general, where you place the variables can change how the graph is laid out, and the orientation of them. Now, facet grid is generally more useful to use when you're passing over two or more variables. If it's just one I would use `facet_wrap()`. 

```R
facet_grid(formula)
facet_grid(vertical ~ horizontal)
```

> It's best to create the plot in RStudio on your computer and examine at full screen. [Faceting](http://www.cookbook-r.com/Graphs/Facets_(ggplot2)/) in ggplot2
>
> Equivalent ggplot syntax:
>
> ```r
> ggplot(data = pf, aes(x = dob_day)) +
>   geom_histogram(binwidth = 1) +
>   scale_x_continuous(breaks = 1:31) +
>   facet_wrap(~dob_month)
> ```

### Friend Count

```R
qplot(x = friend_count, data = pf)
```

When I run the code, I can get my histogram. Looking at the plot, we can see that the data is squished on the left side of the graph, just like Moira's plot, and this graph extends all the way to the 5000 mark. This is what we call long tail data. This data can be common for some user-level data. Most users have friends counts under 500, so we get really tall bins on the left.

![friend_count_plot](./img/friend_count_plot.png)

But there are a few users in our dataset with really high values. The higher values are closer to 5,000, which is the maximum number of friends a user can have.

> Create a histogram of friend_count using the `qplot()` syntax. We'll also accept the `ggplot()` syntax if you are familiar with it but additional parameters for setting the bin width or color won't be accepted. Keep it simple.
>
> You should create the histogram in R Studio on your computer first. Then, copy and paste your code into the {r} chunk.
>
> Remember to load the pseudo-facebook data set into a variable named `pf`. Otherwise, the grader will reject the answer. 
>
> Equivalent ggplot syntax for solution:
>
> ```r
> ggplot(aes(x = friend_count), data = pf) +
>   geom_histogram()
> ```

### Limiting the Axes

To avoid looking at all this long tail data, we can use the `xlim` parameter inside a `qplot()`. This parameter takes a vector where we have the start position and the ending position of our axes. In our case, we want to examine friend counts less than 1000. 

```r
qplot(x = friend_count, data = pf, xlim = c(0, 1000))
```

Running the code, I can see that I have my plot with friend counts less than 1000. Now there is another way to create the same plot.

```r
qplot(x = friend_count, data = pf) + scale_x_continous(limits = c(0,1000))
```

Here I won't use the `xlim` parameter. Instead I'm going to add a layer. I use limits instead of `xlim` as the parameter inside of here since I know this adjustment is already for the x axis. That's why its called `scale_x_continuos()`. There's also a counterpart for the y axis called scale y continuous. One of the neat concepts of `ggplot()` is that you can build up your plot in layers. We're going to discuss layers later, but for now I'm going to keep using the `qplot()` syntax.

![pf_limited_axes_plot](./img/pf_limited_axes_plot.png)

### Adjusting the Bin Width

Looking at the histogram we created earlier, we can see that it's skewed. We've just zoomed in on the left sied of the graph from the histogram from before. Working from the new histogram, let's add some better labels and some binning. To adjust the binwidth, I can pass the `binwidth` parameter to QPLY. And for this data, I'm going to choose a value of 25. That seems pretty reasonable since we're going from zero to 1000. The other thing that I want to do is break up this x axis every saved 50 units. To do that, I'm going to pass the breaks parameter to our scale to x scale continous layer. 

```r
qplot(x = friend_count, data = pf, binwidth = 25) +
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50))
```

Breaks is going to take sequence that has a starting point, an ending point, and a step or the interval space we want on our axis. So in this case, I'm going from zero to a 1000, and I want to step every 50 units.

![pf_binwidth_plot](./img/pf_binwidth_plot.png)

Let's take our histogram and split it up into two histograms for males and females. We do this by adding a facet wrap as another layer. This time, our `facet_wrap()` is going to take a formula where we have the tilde sign and then gender as our splitting variable, and when we run this code as you might find out, we get something quite unexpected. 

```r
qplot(x = friend_count, data = pf, binwidth = 25) +
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) + facet_wrap(~gender)
```

We don't just have two histograms, we have three. One for females, one for males, and one for NA.

![pf_binwidth_plot_facet](./img/pf_binwidth_plot_facet.png)

> Equivalent ggplot syntax:
>
> ```r
> ggplot(aes(x = friend_count), data = pf) +
>   geom_histogram(binwidth = 25) +
>   scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50))
> ```
>
> In the alternate solution below, the period or dot in the *formula* for `facet_grid()` represents all of the other variables in the data set. Essentially, this notation splits up the data by gender and produces three histograms, each having their own row.
>
> ```r
> qplot(x = friend_count, data = pf) +
>   facet_grid(gender ~ .)
> ```
>
> Equivalent ggplot syntax:
>
> ```r
> ggplot(aes(x = friend_count), data = pf) +
>   geom_histogram() +
>   scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) +
>   facet_wrap(~gender)
> ```

### Omitting NA Observations

We have one for females, one for NA. [NA](https://www.statmethods.net/input/missingdata.html) stands for Not Applicable. And the third histogram we just created contains users who are not labeled as male or female.  This is how R handles missing values. Missing values take on a value of NA.

Let's try creating our histogram for friend counts split by gender one more time. But this time we'll take a subset of our data and ignore the obsvervations where the gender is NA. To do thatm=, I'm going to subset our data. I can use the `subset()` command, and use a condition for the second parameter. The first parameter is just the dataset.

```r
qplot(x = friend_count, data = subset(pf, !is.na(gender)), binwidth = 10) + scale_x_continuous(lim = c(0,1000), breaks = seq(0,1000,50)) + facet_wrap(~gender)
```

![pf_omitted_NA_plot](./img/pf_omitted_NA_plot.png)

> Equivalent ggplot syntax:
>
> ```r
> ggplot(aes(x = friend_count), data = subset(pf, !is.na(gender))) +
>   geom_histogram() +
>   scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) +
>   facet_wrap(~gender)
> ```

### Statistics `by()` Gender

It might be hard to determine which gender has more friends on average. 

Instead of looking at these histograms, we can use the table command to see if there are more men versus women. 

```r
table(pf$gender)
```

When I run that command, I get this output.

| female | male  |
| :----: | :---: |
| 40254  | 58574 |

So, it liiks like there's slightly more males than females in our sample. To look at the average `friend_count` by `gender`, we'll need another new command. This command is the `by()` command. The `by()` command takes three inputs: a variable, a categorical variable, or a list of indices to subset over, and a function. In our case, we want to use the Summary as the funtion to get basic statistics on our `friend_count`. So, `friend_count`'s the variable, `gender` is our categorical variable, or the variable that contains our segments of users.

```R
by(pf$friend_count, pf$gender, summary)
```

And we want a summary of the `friend_count` by `gender`.

- pf$gender: female

| Min. | 1st Qu. | Median | Mean | 3rd Qu. | Max. |
| :--: | :-----: | :----: | :--: | :-----: | :--: |
|  0   |   37    |   96   | 242  |   244   | 4923 |

- pf$gender: male

| Min. | 1st Qu. | Median | Mean | 3rd Qu. | Max. |
| :--: | :-----: | :----: | :--: | :-----: | :--: |
|  0   |   27    |   74   | 165  |   182   | 4917 |

#### Who has more friends, males or females?

- Which gender on average has more friends?
  - female
- What's the difference between the median friend count for women and men?
  - 22
- Why would the median be a better measure than the mean?
  - The median is a better measure than mean because it's a more robust statistic. A few people with huge friend counts drag the mean upwards which isn't necessarily representative of most users. What's nice is that the median's resistant to change, since it marks the halfway point for all data points. So as long as we trust half of our values, we can report a reliable location of the center of our distribution.

### Tenure

I am going to examine the distribution of tenure, or how many days someone has been using Facebook. I'm also going to start introducing color to jazz up our plots a little bit. To do that I'm going to use the color and the fill parameter. 

```r
qplot(x = tenure, data = pf, color = I('black'), fill = I('#099DD9'))
```

If this code has thrown you for a loop, I don't want you to focus on it too much, you can really just ignore it. I'll typically include it as the second line of parameters inside of qplot. Running this code, you can see we get a nice histogram.

![pf_tenure_plot](./img/pf_tenure_plot.png)

And again, here the histogram has defaulted to the automatic bin width. I'm going to make one last adjustment and set it for ourselves. By setting the `binwidth` equal to 30, we can see we get a finer view of the distribution. 

```r
qplot(x = tenure, data = pf, binwidth=30, color = I('black'), fill = I('#099DD9'))
```

Let's see if you have a handle on histograms and bin width.

![pf_tenure_binwidth_plot](./img/pf_tenure_binwidth_plot.png)

You need to alter the variable tenure, so that way, it was measured in years instead of days. And this should make a lot of sense, since 365 days would be one year, and 730 days would be two years. Now for the binwidth, let's set it equal to one so we get  a count for yearly users. 

```r
qplot(x = tenure/365, data = pf, binwidth=.25, color = I('black'), fill = I('#F79420'))
```

Running this code, we can see our histogram. And notice here that we have a different color.

![pf_tenure_alter_binwidth_plot](./img/pf_tenure_alter_binwidth_plot.png)

 I did by changing the hex code. To get a finer view of our data, we could set the bandwidth equal to 0.25. It   looks like the bulk of our users had had less than two and a half years on Facebook. To improve this plot in one more way, I can change the x axis, so that way it increments by one year. 

```r
qplot(x = tenure/365, data = pf, binwidth=.25, color = I('black'), fill = I('#F79420')) + scale_x_continuous(breaks = seq(1,7,1), limits = c(0,7))
```

To do that, I can add the layer of `scale_x_continuous()` and set the `breaks` from one to seven. I'm also going to limit our data so that we only see users from zero to seven years. Writing this code, we can see we have a very nice histogram.

![pf_tenure_alter_binwidth_scaled_plot](./img/pf_tenure_alter_binwidth_scaled_plot.png)

> The parameter `color` determines the color **outline** of objects in a plot.
>
> The parameter `fill` determines the color of the **area** inside objects in a plot.
>
> You might notice how the color `black` and the [hex code](http://en.wikipedia.org/wiki/Web_colors) color of `#099DD9` (a shade of blue) are wrapped inside of `I()`. The `I()` functions stand for 'as is' and tells `qplot` to use them as colors.
>
> Learn more about what you can adjust in a plot by reading the [ggplot theme documentation](http://docs.ggplot2.org/0.9.2.1/theme.html)
>
> Equivalent ggplot syntax for plots:
>
> ```r
> ggplot(aes(x = tenure), data = pf) +
>   geom_histogram(binwidth = 30, color = 'black', fill = '#099DD9')
> 
> ggplot(aes(x = tenure/365), data = pf) +
>   geom_histogram(binwidth = .25, color = 'black', fill = '#F79420')
> ```

### Labeling Plots

```
qplot(x = tenure/365, data = pf, xlab = 'Number of years using Facebook', ylab = 'Number of users in sample', binwidth=.25, color = I('black'), fill = I('#F79420')) + scale_x_continuous(breaks = seq(1,7,1), limits = c(0,7))
```

We can use the `xlab` and `ylab` parameters. Now, making sure I have a comma after each of these new parameters, I can run this code and see the labels on their plot.

![pf_tenure_alter_binwidth_scaled_labeled_plot](./img/pf_tenure_alter_binwidth_scaled_labeled_plot.png)

> Equivalent ggplot syntax:
>
> ```r
> ggplot(aes(x = tenure / 365), data = pf) +
>   geom_histogram(color = 'black', fill = '#F79420') +
>   scale_x_continuous(breaks = seq(1, 7, 1), limits = c(0, 7)) +
>   xlab('Number of years using Facebook') +
>   ylab('Number of users in sample')
> ```

