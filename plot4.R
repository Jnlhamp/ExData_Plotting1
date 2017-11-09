# set WD
setwd("~/RProjects/Coursera/ExploratoryAnalysis Course4")

# Read in data files and format dates
full <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
full$DateTime <- strptime(paste(full$Date, full$Time), "%d/%m/%Y %T", tz="GMT")

# subset the data to the dates of interest
data <- subset(full, as.Date(DateTime)>="2007-02-01" & as.Date(DateTime)<="2007-02-02")


# Plot #4, 2x2 plot

png("plot4.png", 
    width = 480,
    height = 480)

par(mfrow = c(2,2))

#top left
plot(x = data$DateTime, y = data$Global_active_power, 
     type="l", 
     xlab="",  ylab="Global Active Power (kilowatts)")

#top right
plot(x = data$DateTime, y = data$Voltage, 
     type = "l", 
     xlab="datetime",ylab="Voltage")

#bottom left
plot(x = data$DateTime, y = data$Sub_metering_1, 
     type="l", 
     xlab="", ylab="Energy sub metering")

points(x = data$DateTime, y = data$Sub_metering_2, 
       type = "l", col = "red")

points(x = data$DateTime, y = data$Sub_metering_3, 
       type = "l", col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = "solid", 
       col=c("black","red","blue"), bty="n")

#bottom right
plot(x = data$DateTime, y = data$Global_reactive_power, 
     type = "l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
