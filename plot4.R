##read the file
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep=";",
                   nrows=70000,
                   colClasses = c("character"))

##extract rows whose date is 2/2/2007 or 1/2/2007
data1 <- subset(data,data$Date=="2/2/2007"|data$Date=="1/2/2007")

library(lubridate)
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
Time <- paste(data1[,1],data1[,2])
plot(dmy_hms(Time),as.numeric(data1[,3]), type= "l", 
     ylab="Global Active Power",xlab="")

plot(dmy_hms(Time),as.numeric(data1[,5]), type= "l", 
     ylab="Voltage",xlab="datetime")

plot(dmy_hms(Time),as.numeric(data1[,7]), type= "l",
     ylab="Energy sub metering",xlab="")
lines(dmy_hms(Time),as.numeric(data1[,8]), type= "l", col="red")
lines(dmy_hms(Time),as.numeric(data1[,9]), type= "l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"),bty="n",
       legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))

plot(dmy_hms(Time),as.numeric(data1[,4]), type= "l", 
     ylab="Global_reactive_power",xlab="datetime")
dev.off()
