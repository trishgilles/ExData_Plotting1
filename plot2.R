# Script to cerate png file of plot2

# setwd("C:/Users/trish/Desktop/coursera/rprogram/exploratory data analysis")
#
# read data
#
rawdata<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", as.is=c(1,2))
#rawdata[,1]<-as.Date(rawdata[,1])
req_data<-subset(rawdata, (Date=="1/2/2007")|(Date=="2/2/2007"))
a<-paste(req_data[,1],req_data[,2])
dtime=strptime(a, format="%d/%m/%Y %H:%M:%S", tz="US/Eastern")


plot(dtime,req_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
dev.print(png, file = "plot2.png", width = 480, height = 480)
dev.off()