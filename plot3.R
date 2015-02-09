#plot 3
#Reading the data
myData <-  read.table("PowerConsumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Removing NAs
myData <- na.omit(myData)
#subset
myData <- myData[myData$Date %in% c("1/2/2007", "2/2/2007"), ]
#Date conversion
myData$Date <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
#Creating plot device and and plot
png(filename = "plot3.png", height = 480, width = 480)
plot(c(myData$Date, myData$Date, myData$Date), c(myData$Sub_metering_1, myData$Sub_metering_2, myData$Sub_metering_3), type="n", xlab="Date time", ylab="Energy sub metering")
lines(myData$Date, myData$Sub_metering_1, col="black")
lines(myData$Date, myData$Sub_metering_2, col="red")
lines(myData$Date, myData$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="--", col=c("black", "red", "blue"))
dev.off()