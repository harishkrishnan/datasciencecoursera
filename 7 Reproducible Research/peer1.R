library(dplyr)
library(ggplot2)

afile <- read.csv("./activity.csv", na.strings = "NA")

# What is mean total number of steps taken per day?
#1 Calculate the total steps
afile <- group_by(afile, date)
sfile <- summarise(afile,sum(steps,na.rm = TRUE))
names(sfile) <- c("date","steps")

#2 Plot the histogram
hist(sfile$steps, breaks = 20, xlab = "steps taken",main = "Histogram of steps")

#3 Calculate and report the mean and median of the total number of steps taken per day
peer1_mean <- mean(sfile$steps)
peer1_median <- median(sfile$steps)

#What is the average daily activity pattern?
#1 Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
bfile <- group_by(afile,interval)
bfile <- summarise(bfile,mean(steps,na.rm = TRUE))
names(bfile) <- c("interval","average_steps")
plot(bfile$interval,bfile$average_steps, type = "l", main = "Time Series Plot", xlab = "Interval", ylab = "Average Steps")
steps_max<-filter(bfile,average_steps == max(bfile$average_steps))



#Imputing missing values
#1 Calculate and report the total number of missing values in the dataset
missing_values <- nrow(afile) - sum(complete.cases(afile))

#2 Devise a strategy for filling in all of the missing values in the dataset.
# fill the NA with the average of the 5 minute interval
new_file <- merge(afile,bfile, by = "interval")
new_file <- arrange(new_file,date)

for (i in 1:nrow(new_file))
{
  if (is.na(new_file[i,2]))
  { new_file[i,2] = new_file[i,4]}
  else
  {
    new_file[i,2] = new_file[i,2]    
  }  

}

#3 Create a new dataset that is equal to the original dataset but with the missing data filled in
new1_file <- select(new_file,steps,date,interval)

# 4 histogram, mean, median
new1_file <- group_by(new_file,date)
new1_file <- summarise(new1_file,sum(steps))
names(new1_file) <- c("date","steps")
hist(new1_file$steps, breaks = 20, xlab = "steps taken",main = "Histogram of steps")
new_mean <- mean(new1_file$steps)
new_median <- median(new1_file$steps)


# Are there differences in activity patterns between weekdays and weekends?

#1 Create a new factor variable in the dataset with two levels - "weekday" and "weekend"
new_file$date <- as.Date(new_file$date)
new_file$isWeekday <- as.factor(ifelse(weekdays(new_file$date) %in% c("Saturday", "Sunday"), "Weekend", "Weekday"))

#2 Make a panel plot containing a time series plot 
new_file <- group_by(new_file,interval,isWeekday)
new_file <- summarise(new_file,steps=mean(steps))



print(qplot(interval, 
      steps, 
      data = new_file, 
      type = 'l', 
      geom=c("line"),
      xlab = "Interval", 
      ylab = "Number of steps", 
      main = "") +
  facet_wrap(~ isWeekday, ncol = 1))