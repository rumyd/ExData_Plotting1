# Function to plot Energy consumed by sub meters

plot3 <- function () {

# Read the url to get data
    df <- read.csv(getZip("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"), 
                   sep = ";", header = TRUE)
# Subset data to filter on dates needed for plotting    
    df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

# Concatenate date and time so that time function can be used to create
# data for plotting
    df$Date <- paste(df$Date, " ", df$Time)

#Open file device PNG to save to local file
    png(file = "plot3.png")

# plot line chart and use different submeters as individual series 
    plot(strptime(df$Date, "%d/%m/%Y %T"), as.numeric(df$Sub_metering_1), 
         type = "l", xlab = " ", ylab = "Energy sub metering", col = "black")
    lines(strptime(df$Date, "%d/%m/%Y %T"), as.numeric(df$Sub_metering_2), 
          type = "l", xlab = " ", ylab = "Energy sub metering", col = "red")
    lines(strptime(df$Date, "%d/%m/%Y %T"), as.numeric(df$Sub_metering_3), 
          type = "l", xlab = " ", ylab = "Energy sub metering", col = "blue")

# provide legend to the plot
    legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
           col = c("black", "red", "blue"), lty=c(1,1))

# close file device PNG
    dev.off()
}