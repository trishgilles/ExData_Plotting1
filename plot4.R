# Script to cerate png file of plot4

# setwd("C:/Users/trish/Desktop/coursera/rprogram/exploratory data analysis")
#
# read data
#
rawdata<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", as.is=c(1,2))
req_data<-subset(rawdata, (Date=="1/2/2007")|(Date=="2/2/2007"))
a<-paste(req_data[,1],req_data[,2])
dtime=strptime(a, format="%d/%m/%Y %H:%M:%S", tz="US/Eastern")

par(mfrow=c(2,2))
#plot1
hist(req_data$Global_active_power, col="red", xlab=" Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power", xlim=c(0,6) ,ylim=c(0,1200))
#plot2
plot(dtime,req_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
#plot 3
plot(dtime,req_data$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="") 
points(dtime,req_data$Sub_metering_3, type="l",col="blue")
points(dtime,req_data$Sub_metering_2, type="l",col="red")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), merge=TRUE,col=c("black", "red", "blue"), lwd=1, xjust=0)
#plot4 
plot(dtime,req_data$Global_reactive_power, type="l", ylab="Global Reactive Power (kilowatts)", xlab="datetime") 


#create png file
dev.print(png, file = "plot4.png", width = 480, height = 480)
