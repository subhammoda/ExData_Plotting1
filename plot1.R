#Readind the data set as table
tab <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#converting columns to proper class
tab[,"Date"] <- as.Date(tab[,"Date"],"%d/%m/%Y")
tab[,"Global_active_power"] <- as.numeric(tab[,"Global_active_power"]) 

#subseting table for required dates
tab <- tab[tab$Date == as.Date("2007-02-01", "%Y-%m-%d") | tab$Date == as.Date("2007-02-02", "%Y-%m-%d"), ]

#creatong the required histogram
hist(tab$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)",col = "Red")

#copying the required plot to png
dev.copy(png, file = "plot1.png", width= 480, height= 480)
dev.off()
