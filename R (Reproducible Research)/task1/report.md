Adding libraries
----------------

``` r
library(lubridate)
```

    ## 
    ## Attaching package: 'lubridate'

    ## The following object is masked from 'package:base':
    ## 
    ##     date

``` r
library(ggplot2)
```

Loading and preprocessing the data
----------------------------------

``` r
# Load the database
act_data <- read.csv("activity.csv")

# Removing rows having NA values
na_rows <- !is.na(act_data[, "steps"])
no_na_data <- act_data[na_rows,]

summary(no_na_data)
```

    ##      steps                date          interval     
    ##  Min.   :  0.00   2012-10-02:  288   Min.   :   0.0  
    ##  1st Qu.:  0.00   2012-10-03:  288   1st Qu.: 588.8  
    ##  Median :  0.00   2012-10-04:  288   Median :1177.5  
    ##  Mean   : 37.38   2012-10-05:  288   Mean   :1177.5  
    ##  3rd Qu.: 12.00   2012-10-06:  288   3rd Qu.:1766.2  
    ##  Max.   :806.00   2012-10-07:  288   Max.   :2355.0  
    ##                   (Other)   :13536

``` r
dim(no_na_data)
```

    ## [1] 15264     3

What is mean total number of steps taken per day?
-------------------------------------------------

``` r
# Calculate the total number of steps taken per day
total_per_day <- aggregate(data = no_na_data, steps ~ date, FUN=sum)

# Calculate and report the mean and median of the total number of steps taken per day
sprintf("MEAN of the total number of steps taken per day: %s", mean(total_per_day$steps))
```

    ## [1] "MEAN of the total number of steps taken per day: 10766.1886792453"

``` r
sprintf("MEDIAN of the total number of steps taken per day: %s", median(total_per_day$steps))
```

    ## [1] "MEDIAN of the total number of steps taken per day: 10765"

``` r
# Make a histogram of the total number of steps taken each day
g <- ggplot(data = total_per_day, aes(x = steps))
g <- g + geom_histogram(binwidth = 1000, boundary = 0)
g <- g + xlab("Total steps per day") + ylab("Frequency") + ggtitle( "Histogram of the total number of steps taken each day")
g <- g + scale_x_continuous(breaks=seq(0,24000,1000)) + theme(axis.text.x=element_text(angle=90))
g <- g + geom_vline(aes(xintercept = mean(total_per_day$steps), color="mean"), size = 0.5)
g <- g + geom_vline(aes(xintercept = median(total_per_day$steps), color="median"), size = 0.5)
g <- g + scale_color_manual(name = "Legend", values = c(median = "blue", mean = "red"))
print(g)
```

![](report_files/figure-markdown_github/question%201-1.png)

What is the average daily activity pattern?
-------------------------------------------

``` r
avg_interval <- aggregate(data = no_na_data, steps ~ interval, FUN=mean)

temp <- sprintf("%04d", avg_interval$interval)
avg_interval$interval <- strptime(temp, format="%H%M")
avg_interval$interval <- hour(avg_interval$interval) * 60 + minute(avg_interval$interval) 

# a time series plot of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
g <- ggplot(avg_interval, aes(interval, steps)) + geom_line()
g <- g + xlab("Time intervals (5 minutes)") + ylab("Number of Steps") + ggtitle( "Time series plot of the 5-minute interval and the average number of steps")
g <- g + scale_x_continuous(breaks=seq(0,1435,60)) + theme(axis.text.x=element_text(angle=90))
g <- g + geom_vline(aes(xintercept = avg_interval$interval[which.max(avg_interval$steps)], color="maximum"), size = 0.5)
g <- g + scale_color_manual(name = "Legend", values = c(maximum = "blue"))
print(g)
```

![](report_files/figure-markdown_github/question%202-1.png)

``` r
#Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
# Answer:
h <- avg_interval$interval[which.max(avg_interval$steps)]
sprintf("Maximum steps at the interval: %s hours %s minutes",h%/%60,h%%60)
```

    ## [1] "Maximum steps at the interval: 8 hours 35 minutes"

Imputing missing values
-----------------------

``` r
# Replacing NA values with the mean for that 5-minute interval value
# So, first calculate the average steps as per interval
avg_steps_per_intterval <- aggregate(data = no_na_data, steps ~ interval, FUN=mean)
join_data <- merge(act_data,avg_steps_per_intterval, by = "interval")

# Calculate and report the total number of missing values in the dataset 
na_rows <- is.na(join_data[, "steps.x"])
sprintf("Number of NA rows: %s", sum(na_rows))
```

    ## [1] "Number of NA rows: 2304"

``` r
# Replacing NA values
join_data[na_rows,"steps.x"] <- join_data[na_rows,"steps.y"]

# Create a new dataset 
new_act_data <- join_data[,c(1,2,3)]
names(new_act_data) <- c("interval","steps","date")

summary(new_act_data)
```

    ##     interval          steps                date      
    ##  Min.   :   0.0   Min.   :  0.00   2012-10-01:  288  
    ##  1st Qu.: 588.8   1st Qu.:  0.00   2012-10-02:  288  
    ##  Median :1177.5   Median :  0.00   2012-10-03:  288  
    ##  Mean   :1177.5   Mean   : 37.38   2012-10-04:  288  
    ##  3rd Qu.:1766.2   3rd Qu.: 27.00   2012-10-05:  288  
    ##  Max.   :2355.0   Max.   :806.00   2012-10-06:  288  
    ##                                    (Other)   :15840

``` r
dim(new_act_data)
```

    ## [1] 17568     3

``` r
# Make a histogram of the total number of steps taken each day
# Calculate the total number of steps taken per day
total_per_day <- aggregate(data = new_act_data, steps ~ date, FUN=sum)

g <- ggplot(data = total_per_day, aes(x = steps))
g <- g + geom_histogram(binwidth = 1000, boundary = 0)
g <- g + xlab("Total steps per day") + ylab("Frequency") + ggtitle( "Histogram of the total number of steps taken each day (After replacing NA's)")
g <- g + scale_x_continuous(breaks=seq(0,24000,1000)) + theme(axis.text.x=element_text(angle=90))
g <- g + geom_vline(aes(xintercept = mean(total_per_day$steps), color="mean"), size = 0.5)
g <- g + geom_vline(aes(xintercept = median(total_per_day$steps), color="median"), size = 0.5)
g <- g + scale_color_manual(name = "Legend", values = c(median = "blue", mean = "red"))
print(g)
```

![](report_files/figure-markdown_github/question%203-1.png)

``` r
# Calculate and report the mean and median of the total number of steps taken per day for the new data
sprintf("MEAN of the total number of steps taken per day: %s", mean(total_per_day$steps))
```

    ## [1] "MEAN of the total number of steps taken per day: 10766.1886792453"

``` r
sprintf("MEDIAN of the total number of steps taken per day: %s", median(total_per_day$steps))
```

    ## [1] "MEDIAN of the total number of steps taken per day: 10766.1886792453"

``` r
# Comments: There is no significant change in the Mean and the Median values of the new data compare to the first one. However, histogram of the new data contains additional frequencies in its bins.
```

Are there differences in activity patterns between weekdays and weekends?
-------------------------------------------------------------------------

``` r
# Create a new factor variable in the dataset with two levels - "weekday" and "weekend" 
new_act_data$date <- as.Date(new_act_data$date)
weekdays1 <- c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
new_act_data$wdays <- factor((weekdays(new_act_data$date) %in% weekdays1), levels=c(FALSE, TRUE), labels=c('weekend', 'weekday'))

# Calculate the total average steps taken per interval (subsetting to wdays factor)
avg_interval <- aggregate(data = new_act_data, steps ~ interval + wdays, FUN=mean)

temp <- sprintf("%04d", avg_interval$interval)
avg_interval$interval <- strptime(temp, format="%H%M")
avg_interval$interval <- hour(avg_interval$interval) * 60 + minute(avg_interval$interval) 

# Make a panel plot containing a time series plot of the 5-minute interval (x-axis) and the average 
# number of steps taken, averaged across all weekday days or weekend days (y-axis).

g <- ggplot(avg_interval, aes(interval, steps)) + geom_line()
g <- g + xlab("Time intervals (5 minutes)") + ylab("Number of Steps") + ggtitle( "Activity patterns between weekdays and weekends")
g <- g + scale_x_continuous(breaks=seq(0,1435,60)) + theme(axis.text.x=element_text(angle=90))
g <- g + facet_wrap(~wdays, nrow = 2, ncol = 1)
print(g)
```

![](report_files/figure-markdown_github/question%204-1.png)
