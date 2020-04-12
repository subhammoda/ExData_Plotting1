#Readind the data set as table
tab2 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#subseting table for required dates
tab2 <- tab2[tab2$Date %in% c("1/2/2007","2/2/2007") , ]

#creating datetime variable
datetime <- strptime(paste(tab2$Date, tab2$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#converting columns to proper class
tab2[,"Date"] <- as.Date(tab2[,"Date"],"%d/%m/%Y")
tab2[, "Time"] <- format(tab2$Time, format = "%H:%M:%S")
tab2[,"Global_active_power"] <- as.numeric(as.character(tab2[,"Global_active_power"])) 

#plotting the graph
plot(datetime,tab2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#copying the required plot to png
dev.copy(png, file = "plot2.png", width= 480, height= 480)
dev.off()
