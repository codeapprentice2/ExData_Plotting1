
##########################################################
#read in, subset and structure data
##########################################################

ph <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

pset <- subset(ph, ph$Date == "1/2/2007" | ph$Date == "2/2/2007")

pset$DaTime <- strptime(paste(pset$Date, pset$Time), "%d/%m/%Y %H:%M:%S")


#########################################################
#plot 2
#########################################################


#open png device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

#set par
mypar <- par(mfrow = c(2,2))

#plot global active power
plot(x=pset$DaTime, y = pset$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

#plot voltage
plot(x=pset$DaTime, y = pset$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

#plot submeters
plot(x=pset$DaTime, y = pset$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(x=pset$DaTime, y = pset$Sub_metering_2, type = "l", col = "red")
lines(x=pset$DaTime, y = pset$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, lwd = 1, bty = "n", cex = 0.8,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot global reactive power
plot(x=pset$DaTime, y = pset$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

#reset par
par(mypar)

#close png device
dev.off()
