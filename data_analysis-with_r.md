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

