## Read Full data
fulldata <- "./household_power_consumption.txt"
data <- read.table(fulldata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subsetdata
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submetering1 <- as.numeric(subsetdata$Sub_metering_1)
submetering2 <- as.numeric(subsetdata$Sub_metering_2)
submetering3 <- as.numeric(subsetdata$Sub_metering_3)

## plot and save
plot(datetime, submetering1, type="l", col="black",ylab="Energy Submetering", xlab="DAY")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))

dev.copy(png,file ="plot3.png", width=480, height=480)
dev.off()