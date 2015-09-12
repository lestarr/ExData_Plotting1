## Plot 3
source("C:/2Projects/DataAnalysis/Rprogs/wdir/getDataProject1.R")

filepath <- "plot3.png"
png(file = filepath)

f <- "data/household_power_consumption.txt"
data <- getData(f)

data[, "datetime"] <- paste(data$Date, data$Time)
posix <- strptime(data$datetime, format = "%Y-%m-%d %H:%M:%S") 

plot(posix, dd$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(posix, dd$Sub_metering_1, col= "black")
lines(posix, dd$Sub_metering_2, col = "red")
lines(posix, dd$Sub_metering_3, col = "blue")
legend("topright",  lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()



