#plot 4
#Reading the data
myData <-  read.table("PowerConsumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Removing NAs
myData <- na.omit(myData)
#subset
myData <- myData[myData$Date %in% c("1/2/2007", "2/2/2007"), ]
#Date conversion
myData$Date <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
#par(mfrow = c(2, 2))
png(filename = "plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2))
with(myData, 
   {
     plot(myData$Date, myData$Global_active_power, type = "l", xlab = "Date time", ylab = "Global Active Power")
     plot(myData$Date, myData$Voltage, type = "l", xlab = "Date time", ylab = "Voltage")
     plot(myData$Date, myData$Sub_metering_2, type = "l", xlab = "Date time", ylab = "Energy sub metering")
     plot(myData$Date, myData$Global_reactive_power, type = "l", xlab = "Date time", ylab = "Global reactive power")
     
   })
dev.off()