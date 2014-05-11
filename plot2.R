
##########################################################
#read in, subset and structure data
##########################################################

ph <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

pset <- subset(ph, ph$Date == "1/2/2007" | ph$Date == "2/2/2007")

pset$DaTime <- strptime(paste(pset$Date, pset$Time), "%d/%m/%Y %H:%M:%S")


#########################################################
#plot 2
#########################################################
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(x=pset$DaTime, y = pset$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)") 
dev.off()
