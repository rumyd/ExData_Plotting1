plot4 <- function () {
    
    df <- read.csv(getZip("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"), 
                   sep = ";", header = TRUE)
    df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
    df$Date <- paste(df$Date, " ", df$Time)
    png(file = "plot4.png")
    
    par(mfrow = c(2, 2))
    
    plot(strptime(df$Date, "%d/%m/%Y %T"), (as.numeric(df$Global_active_power)/1000), 
         type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)",
         ylim = c(0, 4))
    
    plot(strptime(df$Date, "%d/%m/%Y %T"), (as.numeric(df$Voltage)/10), 
         type = "l", xlab = "datetime", ylab = "Voltage")
    
    plot(strptime(df$Date, "%d/%m/%Y %T"), as.numeric(df$Sub_metering_1), 
         type = "l", xlab = " ", ylab = "Energy sub metering", col = "black")
    lines(strptime(df$Date, "%d/%m/%Y %T"), as.numeric(df$Sub_metering_2), 
          type = "l", xlab = " ", ylab = "Energy sub metering", col = "red")
    lines(strptime(df$Date, "%d/%m/%Y %T"), as.numeric(df$Sub_metering_3), 
          type = "l", xlab = " ", ylab = "Energy sub metering", col = "blue")
    legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
           col = c("black", "red", "blue"), lty=c(1,1), cex = 0.6)
    
    plot(strptime(df$Date, "%d/%m/%Y %T"), (as.numeric(df$Global_reactive_power)/1000), 
         type = "l", xlab = "datetime", ylab = "Global_reactive_power", 
         ylim = c(0.0, 0.5))
    dev.off()
}