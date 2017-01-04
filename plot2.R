## This file reproduces the second plot for assignment one. Namely a 
## time series of the global active power usage from the 
## "Individual household elevctric power consumption Data Set"
## found on the UC Irvine Machine Learning Repository 
## http://archive.ics.uci.edu/ml/


## Loads the downloaded data from the working directory obtained 
## from the aforementioned source
all_data <- read.csv("household_power_consumption.txt", 
                     sep=";", stringsAsFactors=FALSE)

## Formats the data as correct class
all_data$Date <- as.Date(all_data$Date, "%d/%m/%Y")
all_data$Global_active_power <- as.numeric(
                            all_data$Global_active_power)


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

### Plot 2 - Time series 

## Saves "plot2.png" to the working directory as a time series
## of Global Active Power, with labeled y axis and no background
png("plot2.png", width = 480, height =480)
par(bg = NA)
plot(household_data$Time, household_data$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)")
dev.off()