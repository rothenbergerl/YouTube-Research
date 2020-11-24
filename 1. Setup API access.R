setwd("")
getwd()

# installing the tuber package
install.packages("tuber")

# loading tuber package
library(tuber)

### Testing Access ###

# Your Credentials (NEVER SHARE THIS INFORMATION)
ID <- "INSERT YOUR ID"
secret <- "INSERT YOUR SECRET"

# authentication
yt_oauth(ID,secret)
# You will be asked in the R-console to save an access token: Select no
# You will be send to your browser to login with your account

### Test API call ###

# get statistics of 1 video
get_stats(video_id="HluANRwPyNo")


