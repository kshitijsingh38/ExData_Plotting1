setwd("C:/KSHITIJ/MIS/MIS Coursework/Exploratory Data Analysis")
housepc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
house <- housepc[housepc$Date %in% c("1/2/2007","2/2/2007"),]
TimeNew <-strptime(paste(house$Date, house$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
NewData <- cbind(TimeNew, house)
hist(NewData$Global_active_power,col="red",xlab="Global Active Power",main = "Global Active Power")
dev.copy(png,'plot1.png',width=480,height=480)
dev.off()