plot3 <- function () {
    
    df <- read.csv(getZip("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"), 
                   sep = ";", header = TRUE)
    df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
    df$Date <- paste(df$Date, " ", df$Time)
    png(file = "plot3.png")
    plot(strptime(df$Date, "%d/%m/%Y %T"), as.numeric(df$Sub_metering_1), 
         type = "l", xlab = " ", ylab = "Energy sub metering", col = "black")
    lines(strptime(df$Date, "%d/%m/%Y %T"), as.numeric(df$Sub_metering_2), 
          type = "l", xlab = " ", ylab = "Energy sub metering", col = "red")
    lines(strptime(df$Date, "%d/%m/%Y %T"), as.numeric(df$Sub_metering_3), 
          type = "l", xlab = " ", ylab = "Energy sub metering", col = "blue")
    legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
           col = c("black", "red", "blue"), lty=c(1,1))
    dev.off()
}