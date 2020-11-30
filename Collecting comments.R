setwd("")
getwd()

library(tuber)
library(tidyverse)
options(stringsAsFactors = FALSE)

## Insert your own app ID and Secret, imput the OAUTH 
app_id <- "UseYourAppID"
app_secret <- "UseYourAppSecret"

yt_oauth(app_id, app_secret)


## EXAMPLE: FRANCE 24 English, channel_id: UCQfwfsi5VrQ8yKZ-UWmAEFg
## 1. Channel Statistics
hadley_stats <- get_channel_stats("UCQfwfsi5VrQ8yKZ-UWmAEFg")

## 2. Video Statistics, example: 34ApQH_MBxQ
dayum_stats <- get_stats("34ApQH_MBxQ")
dayum_stats <- dayum_stats %>%
  as_tibble() %>% 
  mutate_at(vars(-id), as.numeric)
dayum_stats

## There are two functions for collecting viewer comments for specific videos.
## (1) get_comment_threads() collects the 100 most recent comments for a video by default.
##     NB: This function does not collect replies to comments.

## (2) get_all_comments() collects all comments for a video, including replies to comments. 
##     NB: For some reason, this function only collects up to 5 replies per comment.

## Depending on the number of comments for a video, running this function can take some time 
## and might also deplete your API quota limit.

## Important notice:
## Your daily API quota limit is very likely not allow you to collect 
## all comments for videoswith a high number of comments.


## Import video list file
France24 <- read_csv("France24_terrorism.csv")

## Sort dataframe by time
France24_copy <- France24[order(France24$publishedAt),]

## Use 10 most recent videos as a test example
## Replace this command if you want to collect the comments of all the videos
## BUT DO remember the API limits
x <- tail(France24_copy, 10)

## Collect most recent 20 comments
## Change the parameter of max_results, if you want to add more comments.

comments <- data.frame()

for (i in x$video_id) {
  comment <- get_comment_threads(filter = c(video_id = i), max_results = 20)
  comments <- bind_rows(comments, comment)
}

## have a look at the 
head(comments)

## Output the comments as csv file
write.csv(comments, "comments.csv", row.names = FALSE)
