plot2 <- function () {
    
    df <- read.csv(getZip("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"), 
                   sep = ";", header = TRUE)
    df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
    df$Date <- paste(df$Date, " ", df$Time)
    png(file = "plot2.png")
    plot(strptime(df$Date, "%d/%m/%Y %T"), (as.numeric(df$Global_active_power)/1000), 
         type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
    dev.off()
}