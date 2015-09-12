## Presumption: the data set is downloaded and unzipped into a working dir with the path "data/household_power_consumption.txt"
## the data is ordered by date, so we only need to identify, where the asked date starts and ends and 
## then read only a subset of a big table

getData <- function(file){
  ##file <- "data/household_power_consumption.txt"
  ## remember headers
  headers <- read.table(file, nrows = 1, sep = ";")

  ## read only the date column
  dates <- read.table(file, sep = ";", header = TRUE, colClasses = c("character", rep("NULL", 8)), na.strings = "?")
  ##convert values to Date
  dates[,1] <- as.Date(dates[,1], "%d/%m/%Y")
  
  ##
  myDates <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
  
  ind <- which(dates[,1] == myDates[1] | dates[,1] == myDates[2])
  
  ## read only the rows between start and end
  start <- ind[1]
  end <- ind[length(ind)]
  

  ##print(1+end-start)
  
  
  
  myData <- read.table(file, sep = ";", header = TRUE, 
                       colClasses = c("character", "character", rep(NA, 7)), 
                       na.strings = "?",
                       skip = start-1, nrows = 1+end-start
                       )
  
  ##set colnames
  colnames(myData) <- unlist(headers[1,])
  
  ##convert values to Date
  myData[,1] <- as.Date(myData[,1], "%d/%m/%Y")
  
  myData

}


