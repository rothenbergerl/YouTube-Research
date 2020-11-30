setwd("")
getwd()

install.packages("tuber")
install.packages("youtubecaption")
install.packages("tidyverse")

library(tuber)
library(youtubecaption) 
library(tidyverse)

## Insert your own app ID and Secret, imput the OAUTH 
app_id <- "UseYourAppID"
app_secret <- "UseYourAppSecret"

yt_oauth(app_id, app_secret)


## Search for the key term from youtube channel
## Define the timeframe of data collection 
## Don't forget to get the chennel_id on YouTube
## EXAMPLE: FRANCE 24 English, channel_id: UCQfwfsi5VrQ8yKZ-UWmAEFg

## 1. Dataframe: channel_keyword
####  Try the first keyword: terrorism
France24_terrorism <- yt_search(term = "terrorism",
                                channel_id = "UCQfwfsi5VrQ8yKZ-UWmAEFg", 
                                published_after = "2015-01-01T00:00:00Z", 
                                published_before = "2020-11-01T00:00:00Z")
## Output the video list as csv file
write.csv(France24_terrorism, "France24_terrorism.csv", row.names = FALSE)

## 2. Try the second keyword: terror
France24_terror <- yt_search(term = "terror",
                             channel_id = "UCQfwfsi5VrQ8yKZ-UWmAEFg", 
                             published_after = "2015-01-01T00:00:00Z", 
                             published_before = "2020-11-01T00:00:00Z")
## Output the video list as csv file
write.csv(France24_terror, "France24_terror.csv", row.names = FALSE)

## 3. Try the third keyword: terrorist
France24_terrorist <- yt_search(term = "terrorist",
                                channel_id = "UCQfwfsi5VrQ8yKZ-UWmAEFg", 
                                published_after = "2015-01-01T00:00:00Z", 
                                published_before = "2020-11-01T00:00:00Z")
## Output the video list as csv file
write.csv(France24_terrorist, "France24_terrorist.csv", row.names = FALSE)


