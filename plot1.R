plot1 <- function () {
    
    df <- read.csv(getZip("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"), 
                   sep = ";", header = TRUE)
    df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
    png(file = "plot1.png")
    hist((as.numeric(df$Global_active_power))/1000, col = "red", 
         xlab = "Global Active Power (kilowatts)",main = "Global Active Power",
         xlim = c(0,6))
    dev.off()
}