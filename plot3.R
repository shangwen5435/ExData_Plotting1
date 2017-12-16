##read the file
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep=";",
                   nrows=70000,
                   colClasses = c("character"))

##extract rows whose date is 2/2/2007 or 1/2/2007
data1 <- subset(data,data$Date=="2/2/2007"|data$Date=="1/2/2007")

library(lubridate)
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")

##plot 3
png("plot3.png", width = 480, height = 480)
plot(dmy_hms(Time),as.numeric(data1[,7]), type= "l",
     ylab="Energy sub metering",xlab="")
lines(dmy_hms(Time),as.numeric(data1[,8]), type= "l", col="red")
lines(dmy_hms(Time),as.numeric(data1[,9]), type= "l", col="blue")
legend("topright",lwd=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()