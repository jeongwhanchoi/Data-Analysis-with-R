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

