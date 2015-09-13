fs <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(fs), value = TRUE), 
                 col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                 sep = ";", header = TRUE, na.strings="?")

hist(data$Global_active_power, main="Global Active Power",
     col="red",xlab = "Global Active Power (kilowatts)")

dev.copy(png,file="plot 1.png")
dev.off()

