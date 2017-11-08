#setWD
setwd("~/RProjects/Coursera/ExploratoryAnalysis Course4")

#Read in full data file and format dates
full<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
full$Date <- strptime(full$Date, "%d/%m/%Y")

#subset the data set for months of interest
data <- subset(full, Date >= "2007-02-01" & Date <= "2007-02-02")

#Create histogram and plot1.png file

hist(data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")

  png("plot1.png", width=480, height=480, units="px")
  
  dev.off()
