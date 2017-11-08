# set WD
setwd("~/RProjects/Coursera/ExploratoryAnalysis Course4")

# Read in data files and format dates
full <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
full$DateTime <- strptime(paste(full$Date, full$Time), "%d/%m/%Y %T", tz="GMT")

# subset the data to the dates of interest
data <- subset(full, as.Date(DateTime)>="2007-02-01" & as.Date(DateTime)<="2007-02-02")

## Plot #2
# plot of Global Active Power over time

plot(x = data$DateTime, y = data$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

png("plot2.png", width = 480, height = 480)

dev.off()
