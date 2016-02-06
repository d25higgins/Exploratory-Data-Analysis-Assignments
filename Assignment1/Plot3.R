
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'power.zip')

unzip('power.zip')

powerData <- read.delim('household_power_consumption.txt', header=TRUE, sep=";", quote="\"", dec=".", stringsAsFactors = FALSE)

powerData$Date2 <- as.Date(powerData$Date, "%d/%m/%Y")

powerData <- powerData[powerData$Date2 == as.Date('2/1/2007','%m/%d/%Y') | powerData$Date2 == as.Date('2/2/2007','%m/%d/%Y'),]

powerData$DateTime <- paste(powerData$Date, powerData$Time)

powerData$DateTime <- strptime(powerData$DateTime, "%d/%m/%Y %H:%M:%OS")

powerData$DayOfWeek <- weekdays(powerData$Date2)

powerData$Global_active_power <- as.numeric(powerData$Global_active_power)
powerData$Sub_metering_1 <- as.numeric(powerData$Sub_metering_1)
powerData$Sub_metering_2 <- as.numeric(powerData$Sub_metering_2)
powerData$Sub_metering_3 <- as.numeric(powerData$Sub_metering_3)


png('plot3.png', width=480, height=480, units='px') 
#windows()

plot(powerData$DateTime, powerData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(powerData$DateTime, powerData$Sub_metering_2, col="red")
lines(powerData$DateTime, powerData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))


dev.off()
