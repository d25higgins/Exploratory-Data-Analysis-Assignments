
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'power.zip')

unzip('power.zip')

powerData <- read.delim('household_power_consumption.txt', header=TRUE, sep=";", quote="\"", dec=".", stringsAsFactors = FALSE)

powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")

powerData <- powerData[powerData$Date == as.Date('2/1/2007','%m/%d/%Y') | powerData$Date == as.Date('2/2/2007','%m/%d/%Y'),]

powerData$Global_active_power <- as.numeric(powerData$Global_active_power)

png('plot1.png', width=480, height=480, units='px') #, bg="white")

hist(powerData$Global_active_power, main = "Global Active Power", ylab="Frequency", xlab = "Global Active Power (kilowatts)", col="red")

dev.off()

