## Read Full data
fulldata <- "./household_power_consumption.txt"
data <- read.table(fulldata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subsetdata
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalactivepower <- as.numeric(subsetdata$Global_active_power)

## plot and save
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png,file ="plot1.png", width=480, height=480)
dev.off()