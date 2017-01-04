## This file reproduces the third plot for assignment one. Namely a 
## time series of the 3 submeters usage from the 
## "Individual household elevctric power consumption Data Set"
## found on the UC Irvine Machine Learning Repository 
## http://archive.ics.uci.edu/ml/


## Loads the downloaded data from the working directory obtained 
## from the aforementioned source
all_data <- read.csv("household_power_consumption.txt", 
                     sep=";", stringsAsFactors=FALSE)

## Formats the data as correct class
all_data$Date <- as.Date(all_data$Date, "%d/%m/%Y")
all_data$Sub_metering_1 <- as.numeric(all_data$Sub_metering_1)
all_data$Sub_metering_2 <- as.numeric(all_data$Sub_metering_2)
all_data$Sub_metering_3 <- as.numeric(all_data$Sub_metering_3)


## The used for the histogram is that from the two days
## 2007/02/01 and 2007/02/02, as such the data is subsetted
## based upon those criteria
date_lower <- as.Date("2007/02/01")
date_upper <- as.Date("2007/02/02")
case <- all_data$Date>= date1 & all_data$Date <= date2
household_data <- subset(all_data, case)

##Time is made into a single variable for time series analysis
household_data$Time <- strptime(paste(household_data$Date,
                                      household_data$Time),
                                format = "%Y-%m-%d %H:%M:%S")

### Plot 3 - Time series sub meters

## Saves "plot3.png" to the working directory as a time series
## of Sub metering data, with labeled y axis, no background
## and a legend
png("plot3.png", width = 480, height =480)
par(bg = NA)
plot(household_data$Time, household_data$Sub_metering_1,
     type = "l", ylab = "Energy sub metering")
lines(household_data$Time, household_data$Sub_metering_2,
      type = "l", col = "red")
lines(household_data$Time, household_data$Sub_metering_3,
      type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, col=c("black","red","blue"))
dev.off()