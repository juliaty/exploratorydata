fs <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(fs), value = TRUE), 
                 col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                 sep = ";", header = TRUE, na.strings="?")

data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Date2 <- as.POSIXct(paste(data$Date,data$Time))

plot(x=data$Date2,y=data$Sub_metering_1,
     type="l",xlab="",ylab="Energy sub metering")
plot1<-lines(x=data$Date2,y=data$Sub_metering_2,col="red")
plot1<-lines(x=data$Date2,y=data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"),lty=1,lwd=2)
 
dev.copy(png,file="plot 3.png")

dev.off()
