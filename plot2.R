##read the file
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep=";",
                   nrows=70000,
                   colClasses = c("character"))

##extract rows whose date is 2/2/2007 or 1/2/2007
data1 <- subset(data,data$Date=="2/2/2007"|data$Date=="1/2/2007")

##plot 2
library(lubridate)
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")
png("plot2.png", width = 480, height = 480)
Time <- paste(data1[,1],data1[,2])
plot(dmy_hms(Time),as.numeric(data1[,3]), type= "l", 
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()