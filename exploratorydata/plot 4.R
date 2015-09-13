fs <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(fs), value = TRUE), 
                 col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                 sep = ";", header = TRUE, na.strings="?")

data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Date2 <- as.POSIXct(paste(data$Date,data$Time))

par(mfcol=c(2,2), mar = c(4,4,2,1))

plot(x=data$Date2,y=data$Global_active_power,
     type="l",xlab="",ylab="Global Active Power")

plot(x=data$Date2,y=data$Sub_metering_1,
     type="l",xlab="",ylab="Energy sub metering")
lines(x=data$Date2,y=data$Sub_metering_2,col="red")
lines(x=data$Date2,y=data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       bty="n")

plot(x=data$Date2,y=data$Voltage,
     type="l",xlab="datetime",ylab="Voltage")

plot(x=data$Date2,y=data$Global_reactive_power,
                          type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,file="plot 4.png")
dev.off()