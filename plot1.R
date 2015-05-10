# Function to plot histogram for Active Power for select dates in 2007
plot1 <- function () {
  # Read the file using given url  
    df <- read.csv(getZip("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"), 
                   sep = ";", header = TRUE)
 # subset the data frame for two dates in Feb 2007
    df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
 
 # Open file device PNG to write to local file
    png(file = "plot1.png")
 
 # Plot Histogram for Active Power
    hist((as.numeric(df$Global_active_power))/1000, col = "red", 
         xlab = "Global Active Power (kilowatts)",main = "Global Active Power",
         xlim = c(0,6))
 
 # Close the device PNG
    dev.off()
}