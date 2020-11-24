#creating a data frame out of the data file
dataT <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#subsetting and formatting dates
newData <- subset(dataT, Date %in% c("1/2/2007","2/2/2007"))
newData$Date <- as.Date(newData$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(newData$Date), newData$Time)
newData$Datetime <- as.POSIXct(datetime)

#open png graphic device and plot
png("plot2.png", width=480, height=480)
with(newData, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()