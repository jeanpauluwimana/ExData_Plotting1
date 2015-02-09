#plot 2
#Reading the data
myData <-  read.table("PowerConsumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Removing NAs
myData <- na.omit(myData)
#subset
myData <- myData[myData$Date %in% c("1/2/2007", "2/2/2007"), ]
#Date conversion
myData$Date <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", height = 480, width = 480)
with(myData, plot(myData$Date, myData$Global_active_power, type = "l", xlab = "Days", ylab = "Global Active Power (Kilowatts)"))
#title(main = "Global Active Power", xlab = "Global Active Power", ylab = "Frequency")
dev.off()