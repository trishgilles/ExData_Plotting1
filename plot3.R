# Script to create png file of plot3

# setwd("C:/Users/trish/Desktop/coursera/rprogram/exploratory data analysis")
#
# read data
#
rawdata<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", as.is=c(1,2))

req_data<-subset(rawdata, (Date=="1/2/2007")|(Date=="2/2/2007"))
a<-paste(req_data[,1],req_data[,2])
dtime=strptime(a, format="%d/%m/%Y %H:%M:%S", tz="US/Eastern")



plot(dtime,req_data$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="") 
points(dtime,req_data$Sub_metering_3, type="l",col="blue")
points(dtime,req_data$Sub_metering_2, type="l",col="red")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), merge=TRUE,col=c("black", "red", "blue"), lwd=1, xjust=0)
dev.print(png, file = "plot3.png", width = 480, height = 480)
