## Plot 4
source("C:/2Projects/DataAnalysis/Rprogs/wdir/getDataProject1.R")

filepath <- "plot4.png"
png(file = filepath)

f <- "data/household_power_consumption.txt"
data <- getData(f)

data[, "datetime"] <- paste(data$Date, data$Time)
data$posix <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S") 

par(mfrow = c(2,2))
##plot1
plot(data$posix, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n")
lines(data$posix, data$Global_active_power)
##plot2
plot(data$posix, data$Voltage, ylab = "Voltage", xlab = "datetime", type = "n")
with(data, lines(posix, Voltage))
##plot3
plot(data$posix, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(data$posix, data$Sub_metering_1, col= "black")
lines(data$posix, data$Sub_metering_2, col = "red")
lines(data$posix, data$Sub_metering_3, col = "blue")
legend("topright",  lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##plot4
plot(data$posix, data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "n")

with(data, lines(posix, Global_reactive_power))

dev.off()



