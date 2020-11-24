#creating a data frame out of the data file
dataT <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#subsetting and formatting dates
newData<- subset(dataT, Date %in% c("1/2/2007","2/2/2007"))
newData$Date <- as.Date(newData$Date, format="%d/%m/%Y")

#open png graphic device and plot
png("plot1.png", width=480, height=480)
hist(newData$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="Red")
dev.off()