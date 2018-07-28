wdPath <- '/Users/jeongwhanchoi/GitHub/Data-Analysis-with-R/eda-course/lesson2'

setwd(wdPath)
getwd()

stateInfo <- read.csv('stateData.csv')

stateSubset <- subset(stateInfo, state.region==1)
head(stateSubset,2)
dim(stateSubset)

stateSubsetBracket <- stateInfo[stateInfo$state.region==1, ]
head(stateSubsetBracket,2)
dim(stateSubsetBracket)
