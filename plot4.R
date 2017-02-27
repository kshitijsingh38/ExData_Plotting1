setwd("C:/KSHITIJ/MIS/MIS Coursework/Exploratory Data Analysis")
housepc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
house <- housepc[housepc$Date %in% c("1/2/2007","2/2/2007"),]
TimeNew <-strptime(paste(house$Date, house$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
NewData <- cbind(TimeNew, house)

par(mfcol=c(2,2))
plot(NewData$TimeNew,NewData$Global_active_power,type = "l",xlab="",ylab = "Global Active Power(kilowatts)")
plot(NewData$TimeNew, NewData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy Sub Metering")
lines(NewData$TimeNew, NewData$Sub_metering_2, col="red")
lines(NewData$TimeNew, NewData$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), cex=.25,lty=1)
plot(NewData$TimeNew, NewData$Voltage,type = "l", ylab = "Voltage", xlab = "datetime")
plot(NewData$TimeNew, NewData$Global_reactive_power,ylab = "Global_reactive_power", xlab = "datetime", type = "l")

dev.copy(png,'plot4.png',width=480,height=480)
dev.off()