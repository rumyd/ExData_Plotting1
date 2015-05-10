# function to plot multiple base plots

plot4 <- function () {

# read url provided to get the data for plotting
    df <- read.csv(getZip("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"), 
                   sep = ";", header = TRUE)
# Subset to filter on days needed for plotting
    df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

# concatenate date and time to haave meaningful time data for plotting
df$Date <- paste(df$Date, " ", df$Time)

# Open file device PNG for saving to local file
    png(file = "plot4.png")
    
#Use par function to determine 2 rows and 2 columns to house the plots 
par(mfrow = c(2, 2))

# Build four plots starting from row 1 col1, row 1, col2 and so on..
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

# close file device PNG
    dev.off()
}