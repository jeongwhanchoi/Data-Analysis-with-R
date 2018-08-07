# Data Analysis with R

This repository is the documented lesson resources based on [Data Analysis with R](https://classroom.udacity.com/courses/ud651) at [Udacity](https://classroom.udacity.com/courses/ud651).

This link is the **[main document](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#data-analysis-with-r)**.

## Table of Contents

### **[Main Document](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#data-analysis-with-r)**

- [R Basics](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#r-basics)
  - [Install R Studio on a Mac](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#install-r-studio-on-a-mac)
  - [R Studio Layout](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#r-studio-layout)
  - [Swirl](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#swirl)
  - [Read and Subset Data](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#read-and-subset-data)
  - [R Markdown Documents](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#r-markdown-documents)
  - [Factor Variables](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#factor-variables)
  - [Ordered Factors](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#ordered-factors)
  - [Data Munging](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#data-munging)
- [Explore One Variable](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#explore-one-variable)
  - [Pseudo Facebook User Data](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#pseudo-facebook-user-data)
  - [Histogram of Users' Birthdays](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#histogram-of-users-birthdays)
  - [Faceting](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#faceting)
  - [Friend Count](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#friend-count)
  - [Limiting the Axes](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#limiting-the-axes)
  - [Adjusting the Bin Width](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#adjusting-the-bin-width)
  - [Omitting NA Observations](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#omitting-na-observations)
  - [Tenure](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#tenure)
  - [User Ages](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#user-ages)
  - [Transforming Data](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#transforming-data)
  - [Add a Scaling Layer](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#add-a-scaling-layer)
  - [Frequency Polygons](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#frequency-polygons)
  - [Likes on the Web](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#likes-on-the-web)
  - [Box Plots](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#box-plots)
  - [Box Plots, Quartiles and Friendships](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#box-plots-quartiles-and-friendships)
  - [Getting Logical](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#getting-logical)
- [Explore Two Variables](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#explore-two-variables)
  - [Scatterplots](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#scatterplots)
  - [ggplot Syntax](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#ggplot-syntax)
  - [Overplotting](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#overplotting)
  - [coord_trans()](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#coord_trans)
  - [Alpha and Jitter](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#alpha-and-jitter)
  - [Overplotting and Domain Knowledge](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#overplotting-and-domain-knowledge)
  - [Conditional Means](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#conditional-means)
  - [Overlaying Summaries with Raw Data](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#overlaying-summaries-with-raw-data)
  - [Correlation](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#correlation)
  - [Correlation on Subsets](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#correlation-on-subsets)
  - [Correlation Methods](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#correlation-methods)
  - [Create Scatterplots](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#create-scatterplots)
  - [Strong Correlations](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#strong-correlations)
  - [More Caution with Correlation](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#more-caution-with-correlation)
  - [Noisy Scatterplots](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#noisy-scatterplots)
  - [Making Sense of Data](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#making-sense-of-data)
  - [A New Perspective](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#a-new-perspective)
  - [Understanding Noise: Age to Age Months](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#understanding-noise-age-to-age-months)
  - [Age with Months Means](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#age-with-months-means)
  - [Noise in Conditional Means](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#noise-in-conditional-means)
  - [Smoothing Conditional Means](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/data_analysis-with_r.md#smoothing-conditional-means)

### [Issues](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/r_issue.md)

- [ERROR](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/r_issue.md#error)
  - [LOCALE ERROR](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/r_issue.md#locale-error)
  - [Pipe Operator Error in dplyr](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/r_issue.md#pipe-operator-error-in-dplyr)
- [WARNING](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/r_issue.md#warning)
  - [Warning message: package 'ggplot'](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/r_issue.md#warning-message-package-ggplot)
  - [Syntax warning in 'geom_line'](https://github.com/jeongwhanchoi/Data-Analysis-with-R/blob/master/r_issue.md#Syntax-warning-in-geom_line)

