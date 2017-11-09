# set WD
setwd("~/RProjects/Coursera/ExploratoryAnalysis Course4")

# Read in data files and format dates
full <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
full$DateTime <- strptime(paste(full$Date, full$Time), "%d/%m/%Y %T", tz="GMT")

# subset the data to the dates of interest
data <- subset(full, as.Date(DateTime)>="2007-02-01" & as.Date(DateTime)<="2007-02-02")

#plot #3
plot(x = data$DateTime, 
     y = data$Sub_metering_1, 
     type="l", 
     xlab="", ylab="Energy sub metering")

lines(x = data$DateTime, 
      y = data$Sub_metering_2, 
      type="l", col="red")

lines(x = data$DateTime, 
      y = data$Sub_metering_3, 
      type="l", col="blue")

legend("topright",
      c("sub_metering_1", "sub_metering_2", "sub_metering_3"), 
      lty="solid",
      col=c("black", "red", "blue"))

png("plot3.png", width = 480, height = 480)

dev.off()
