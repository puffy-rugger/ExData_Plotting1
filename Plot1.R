dataFile <- "../household_power_consumption.txt"
powerData <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE)

powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")

subsetData <- subset(powerData, powerData$Date == '2007-02-01' | powerData$Date == '2007-02-02')

hist(as.numeric(subsetData$Global_active_power), xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', main = 'Global Active Power', col = 'red')

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()
