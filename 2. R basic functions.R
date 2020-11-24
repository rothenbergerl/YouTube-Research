## Set working directory on your computer
## Alternative way: create a project
setwd("")
getwd()

## R packages used for Part 1 and Part 2
## If you have installed these R packages before, you just activate them by library() code.
install.packages("readxl")
install.packages("tidyverse")

library(readxl)
library(tidyverse)



## Part 1: Data frame and subset
## (1) Create a data frame by typing data, name it as "example"
typedata <-data.frame (x1 = c(1,3,5,2,4),
                       x2 = c(2,4,4,3,1),
                       x3 = c(4,1,3,5,2),
                       x4 = c(3,5,1,4,3))
## See the dataframe by View() code, or click the data in Environment
View(typedata)

## Extract the subset by columns
## Name the new data frame as "example1"
subset(typedata, select = c("x1", "x3"))
example1 <- subset(typedata, select = c("x1", "x3"))



## (2) Create a data frame by importing data from Excel
## First define the formaiton of each column
coltypes=c("text", "date", "numeric", "numeric", "numeric", "numeric", "numeric", 
           "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", 
           "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", 
           "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", 
           "numeric", "numeric")
## And then import the Excel data, name it as "dataset"
dataset <- read_excel("RBasic_data.xlsx", col_types = coltypes) 

## Tip: If you don't want to define the formation of each column
## First, save the excel file as CSV file.
## And then, read_csv()


## a. Build a new data frame by selected time
year2019 <- filter (dataset, date >= as.POSIXct("2019-01-01") & date <= as.POSIXct("2019-12-31"))       

## b. Build a new data frame by selecting rows and columns
example2 <- dataset[1:1236, 1:7]



## Part 2: Descriptive results
## (1) sum
summary(dataset$like)
## (2) frequency
addmargins(table(dataset$media))
## (3) percentage
round(prop.table(table(dataset$media))*100,1)

## (4) label values in a variable
dataset$media <- ordered (dataset$media,
                          levels = c (1,2),
                          labels = c ("New York Times", "Wall Street Journal"))
addmargins(table(dataset$media))



## Part 3: Plot diagram
# R package "ggplot2" is required to plot" diagram
# But this funciton has been included by R package "tidyverse"

## a. Simple bar chart of variable "media"
barplot_data <- as.data.frame(table(dataset$media)) # make plot data
names(barplot_data) <- c("Media", "Freq") # change col name

ggplot(aes(x = Media, y = Freq), data = barplot_data) +  # to fit plot function
  geom_bar(stat="identity", fill="steelblue")+ # adjust bar
  ggtitle("Barplot example", subtitle = "this is subtitle") # add some title


## b. Line chart of "like" number during 2015-2019

## plot in uni-group: group = 1
ggplot(data=dataset, aes(x=date, y=like, group=1)) +
  geom_line()

## plot in multi-groups: group = media
ggplot(dataset, aes(x=date, y=like, group=media)) +
  geom_line(aes(color=media))

