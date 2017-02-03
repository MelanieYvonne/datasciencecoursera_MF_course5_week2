###Loading the file

setwd('M:/03_Plan_net_media/13_Insights/02_Intelligence/04_Interne_Projekte/Melanie/Coursera/Kurs 5/Assigment1')
data <- read.csv("activity.csv")

# Calculate and report the total number of missing values in the dataset

data_na <- na.omit(data)

# df with missing data filled

gesamt_data_na <- aggregate(steps ~ date, data_na, sum)

###mean/median total numbers of steps per day

#Histogram
hist(
        gesamt_data_na$steps, 
        main = "total number of steps taken each day", 
        xlab="Steps per day", 
        ylab="Frequency", 
        col = "blue", 
        breaks = 15
)

#mean
meanx <- mean(gesamt_data_na$steps)
print(meanx)

#median
median <- median(gesamt_data_na$steps)
print(median)

###What is the average daily activity pattern?

##series plot
# Aggregate Data

serien <- aggregate(steps ~ interval, data = data, FUN = function(x) {
        mean(x, na.rm = TRUE)})

#plotten
ggplot(serien, aes(interval, steps)) + geom_line(colour = "green", 
                                                      lwd = 2) + labs(title = expression("5-minute interval"))

##5-minute interval, on average
serien[which.max(serien$steps),]

###Imputing missing values

# Calculate the total number
na<-sum(is.na(data))
part<-paste(round(100*(na/nrow(data)), 3), "%")
print(part)

#Devise a strategy for filling in all of the missing values in the dataset...
full_data <- data

# Replace each missing value with the mean value
fuehlenMean <- function(steps, interval) {
        fuehle <- NA
        if (!is.na(steps))
                fuehle <- c(steps)
        else
                fuehle <- (serien[serien$interval==interval, "steps"])
        return(fuehle)
}
full_data$steps <- mapply(fuehlenMean, full_data$steps, full_data$interval)

# Make a histogram of the total number
total <- tapply(full_data$steps, full_data$date, sum, na.rm=TRUE)
hist(total, main = 'total number of steps taken each day', col = "red")

# mean/median of the steps
mean1 <- mean(total, na.rm= TRUE)
print(mean1)

median1 <- median(total, na.rm= TRUE)
print(median1)

## Are there differences in activity patterns between weekdays and weekends

# Create a new weekday/Weekend variable in a df

df_new <- data
df_new$datum <- as.Date(strptime(df_new$date, format="%Y-%m-%d")) 
df_new$tag <-  factor(ifelse(as.POSIXlt(df_new$date)$wday %in% c(0,6), 'weekend', 'weekday'))

week_average_df <- aggregate(full_data$steps, list(interval = data$interval, day = df_new$tag), mean)
names(week_average_df) <- c("interval", "day", "steps")

ggplot(week_average_df, aes(interval, steps)) + geom_line(color = "purple3", lwd = 1) + 
        xlab("Interval: 5 minute") + ylab("Steps numbers") + facet_grid(day ~ .)
