# Script to create png file of plot1

# setwd("C:/Users/trish/Desktop/coursera/rprogram/exploratory data analysis")
#
# read data
#
rawdata<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", as.is=c(1,2))
req_data<-subset(rawdata, (Date=="1/2/2007")|(Date=="2/2/2007"))

hist(req_data$Global_active_power, col="red", xlab=" Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power", xlim=c(0,6) ,ylim=c(0,1200))
dev.print(png, file = "plot1.png", width = 480, height = 480)