setwd("C:/Users/pc/Desktop/RProgram/YouTubeTerrorism")
getwd()

library(readxl)
library(tidyverse)

coltypes=c("text", "date", "numeric", "numeric", "numeric", "numeric", "numeric", 
           "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", 
           "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", 
           "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", 
           "numeric", "numeric")
dataset <- read_excel("RBasic_data.xlsx", col_types = coltypes) 

## Assignment 1
## (1) Dataframe1 including all the tweets in 2016.
Dataframe1 <- filter (dataset, date >= as.POSIXct("2016-01-01") & date <= as.POSIXct("2016-12-31"))       

## (2) Dataframe2 including variables: date, like, retweet, reply.
Dataframe2 <- dataset[1:1236, 2:7]



## Assignment 2
## (1) Label the values in the variable ¡°generic¡±. 
dataset$generic <- ordered (dataset$generic,
                            levels = c (1,2,3,4,5,6,99),
                            labels = c ("Conflict", "Human interest", "Economic consequence",
                                        "Responsibility", "Morality", "Technology", "Other"))
addmargins(table(dataset$generic))

## (2) Show the percentage distribution of the variable ¡°generic¡±.
round(prop.table(table(dataset$generic))*100,1)



## Assignment 3
## (1) A bar chart illustrating the ¡°generic¡± variable.
barplot_data <- as.data.frame(table(dataset$generic)) 
names(barplot_data) <- c("Generic", "Frequency") 

ggplot(aes(x = Generic, y = Frequency), data = barplot_data) +  
  geom_bar(stat="identity", fill="steelblue")+ 
  ggtitle("Barplot", subtitle = "The bar chart of generic frames") 


## (2) A line chart showing the distribution of ¡°retweet¡± numbers during 2015-2019.
ggplot(data=dataset, aes(x=date, y=retweet, group=1)) +
  geom_line()

## Extra£ºmulti-groups by media
ggplot(dataset, aes(x=date, y=retweet, group=media)) +
  geom_line(aes(color=media))

