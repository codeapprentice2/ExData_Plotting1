
##########################################################
#read in, subset and structure data
##########################################################

ph <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

pset <- subset(ph, ph$Date == "1/2/2007" | ph$Date == "2/2/2007")

pset$DaTime <- strptime(paste(pset$Date, pset$Time), "%d/%m/%Y %H:%M:%S")


#########################################################
#plot 2
#########################################################
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(x=pset$DaTime, y = pset$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(x=pset$DaTime, y = pset$Sub_metering_2, type = "l", col = "red")
lines(x=pset$DaTime, y = pset$Sub_metering_3, type = "l", col = "blue")
 
legend("topright", lty = 1, lwd = 1, 
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
