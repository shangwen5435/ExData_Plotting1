##read the file
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep=";",
                   nrows=70000,
                   colClasses = c("character"))

##extract rows whose date is 2/2/2007 or 1/2/2007
data1 <- subset(data,data$Date=="2/2/2007"|data$Date=="1/2/2007")

##plot 1
png("plot1.png", width = 480, height = 480)
hist(as.numeric(data[,3]),
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power"
)
dev.off()