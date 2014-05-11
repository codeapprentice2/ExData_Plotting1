
##########################################################
#read in, subset and structure data
##########################################################

ph <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

pset <- subset(ph, ph$Date == "1/2/2007" | ph$Date == "2/2/2007")

pset$DaTime <- strptime(paste(pset$Date, pset$Time), "%d/%m/%Y %H:%M:%S")


#########################################################
#plot 1
#########################################################
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(pset$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
