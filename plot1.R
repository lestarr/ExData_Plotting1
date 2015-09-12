## Plot 1
source("C:/2Projects/DataAnalysis/Rprogs/wdir/getDataProject1.R")

filepath <- "plot1.png"
png(file = filepath)

f <- "data/household_power_consumption.txt"
data <- getData(f)

hist(data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)"
     )

dev.off()

