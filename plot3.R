#################################################################################
#
# Exploratory Data Analysis: Course Project 1
#
####################################################################################


## Change the directory
getwd()
setwd("./Online Courses/Exploratory Data Analysis/Week1")
getwd()

## Import the Electric power consumption Data set
power <- read.csv("C:/Users/Auguste Ba/Documents/Online Courses/Exploratory Data Analysis/Week1/household_power_consumption.txt", sep=";", header=T, na.strings="?")

# Change the Date Format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# Let print few rows
head(power)

## Let select the  data from the dates 2007-02-01 and 2007-02-02
power_comsumption <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
str(power_comsumption)

## Remove the original data from the Disk
rm(power)

## Let Convert date and time 
date_time <- paste(as.Date(power_comsumption$Date), power_comsumption$Time)
power_comsumption$Date_time <- as.POSIXct(date_time)

## Plot 3
with(power_comsumption, {
  plot(Sub_metering_1~Date_time, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Date_time,col='Red')
  lines(Sub_metering_3~Date_time,col='Blue')})

## Adding Legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Let Export the graph to a file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

