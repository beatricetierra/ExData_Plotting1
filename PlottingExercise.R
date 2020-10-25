## Read and filter table
#Read table 
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# Convert data column to date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Filter Feb. 1, 2007 to Feb. 2, 2007
filtered <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Plot 1
hist(filtered$Global_active_power, main="Global Active Power", xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency' , col="red")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

## Plot 2
dateTime <- as.POSIXct(paste(filtered$Date, filtered$Time), format="%Y-%m-%d %H:%M:%S")
plot(filtered$Global_active_power~dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

## Plot 3
plot(filtered$Sub_metering_1~dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(filtered$Sub_metering_2~dateTime, type="l", col="red",lty=2)
lines(filtered$Sub_metering_3~dateTime, type="l", col="blue",lty=3)
legend("topright", lwd=c(2,2,2), col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

## Plot 4  
par(mfrow=c(2,2))

plot(filtered$Global_active_power~dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(filtered$Voltage~dateTime, type="l", ylab="Voltage (volt)", xlab="")

plot(filtered$Sub_metering_1~dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(filtered$Sub_metering_2~dateTime,col='Red')
lines(filtered$Sub_metering_3~dateTime,col='Blue')
legend("topright", col=c("black", "red", "blue"), bty="n", lwd=c(2,2,2), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(filtered$Global_reactive_power~dateTime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()