
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'power.zip')

unzip('power.zip')

powerData <- read.delim('household_power_consumption.txt', header=TRUE, sep=";", quote="\"", dec=".", stringsAsFactors = FALSE)

powerData$Date2 <- as.Date(powerData$Date, "%d/%m/%Y")

powerData <- powerData[powerData$Date2 == as.Date('2/1/2007','%m/%d/%Y') | powerData$Date2 == as.Date('2/2/2007','%m/%d/%Y'),]

powerData$DateTime <- paste(powerData$Date, powerData$Time)

powerData$DateTime <- strptime(powerData$DateTime, "%d/%m/%Y %H:%M:%OS")

powerData$DayOfWeek <- weekdays(powerData$Date2)

powerData$Global_active_power <- as.numeric(powerData$Global_active_power)


png('plot2.png', width=480, height=480, units='px') 
#windows()

plot(powerData$DateTime, powerData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")


dev.off()

