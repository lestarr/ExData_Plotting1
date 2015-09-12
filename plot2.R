## Plot 2
source("C:/2Projects/DataAnalysis/Rprogs/wdir/getDataProject1.R")

filepath <- "plot2.png"
png(file = filepath)

f <- "data/household_power_consumption.txt"
data <- getData(f)

data[, "datetime"] <- paste(data$Date, data$Time)
posix <- strptime(data$datetime, format = "%Y-%m-%d %H:%M:%S")                            


plot(posix, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n")
lines(posix, data$Global_active_power)

dev.off()

