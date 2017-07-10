dataFile <- "../household_power_consumption.txt"
powerData <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE)

powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")

subsetData <- subset(powerData, powerData$Date == '2007-02-01' | powerData$Date == '2007-02-02')

date.Time <- as.POSIXct(paste(subsetData$Date, subsetData$Time, sep=" "))

global.Active.Power <- as.numeric(subsetData$Global_active_power)

plot(date.Time, global.Active.Power, type="l", xlab = " ", ylab = "Global Active Poweer (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
