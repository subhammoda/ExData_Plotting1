#Readind the data set as table
tab2 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#subseting table for required dates
tab2 <- tab2[tab2$Date %in% c("1/2/2007","2/2/2007") , ]

#creating datetime variable
datetime <- strptime(paste(tab2$Date, tab2$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#converting columns to proper class
tab2[,"Date"] <- as.Date(tab2[,"Date"],"%d/%m/%Y")
tab2[, "Time"] <- format(tab2$Time, format = "%H:%M:%S")
tab2$Sub_metering_1 <- as.numeric(as.character(tab2$Sub_metering_1))
tab2$Sub_metering_2 <- as.numeric(as.character(tab2$Sub_metering_2))
tab2$Sub_metering_3 <- as.numeric(as.character(tab2$Sub_metering_3))

#plotting the graph
plot(datetime, tab2$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
with(tab2, lines(datetime, tab2$Sub_metering_1))
with(tab2, lines(datetime, tab2$Sub_metering_2, col = "Red"))
with(tab2, lines(datetime, tab2$Sub_metering_3, col = "Blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#copying the required plot to png
dev.copy(png, file = "plot3.png", width= 480, height= 480)
dev.off()
