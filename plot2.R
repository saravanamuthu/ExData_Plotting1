## Read Full data
fulldata <- "./household_power_consumption.txt"
data <- read.table(fulldata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subsetdata
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subsetdata$Global_active_power)

## plot and save
plot(datetime, globalactivepower, type="l", xlab="DAY", ylab="Global Active Power (kilowatts)")
dev.copy(png,file ="plot2.png", width=480, height=480)
dev.off()