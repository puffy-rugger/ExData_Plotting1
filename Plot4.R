dataFile <- "../household_power_consumption.txt"
powerData <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE)

powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")

subsetData <- subset(powerData, powerData$Date == '2007-02-01' | powerData$Date == '2007-02-02')

date.Time <- as.POSIXct(paste(subsetData$Date, subsetData$Time, sep=" "))

global.Active.Power <- as.numeric(subsetData$Global_active_power)

sub.Metering.1 <- as.numeric(subsetData$Sub_metering_1)
sub.Metering.2 <- as.numeric(subsetData$Sub_metering_2)
sub.Metering.3 <- as.numeric(subsetData$Sub_metering_3)

voltage <- as.numeric(subsetData$Voltage)

global.Reactive.Power <- as.numeric(subsetData$Global_reactive_power)

par(mfrow = c(2,2))
plot(date.Time, global.Active.Power, type="l", xlab = " ", ylab = "Global Active Poweer")

plot(date.Time, voltage, type="l", xlab = "datetime", ylab = "Voltage")

with (subsetData, {
    plot(sub.Metering.1~date.Time, type = "l", xlab = " ", ylab = "Energy sub metering")
    lines(sub.Metering.2~date.Time, col = "red")
    lines(sub.Metering.3~date.Time, col = "blue")
    }
)
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, cex = 0.8)

plot(date.Time, global.Reactive.Power, type="l", xlab = "datetime", ylab = "Global_reactive_power")


dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()

par(mfrow = c(1,1))
