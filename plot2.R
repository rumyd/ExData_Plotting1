# Function to plot line chart for Active Power during 2 days in feb

plot2 <- function () {
  
# Read file from url provided    
    df <- read.csv(getZip("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"), 
                   sep = ";", header = TRUE)
    
#Subset for 2 days that need to be plotted
    df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
    
# Concatenate date and time in the data to be able to use strptime function for 
# plotting
    df$Date <- paste(df$Date, " ", df$Time)

#Open file device PNG to save to local file
    png(file = "plot2.png")

#Plot line chart with time on x axis and Active Power on y axis
    plot(strptime(df$Date, "%d/%m/%Y %T"), (as.numeric(df$Global_active_power)/1000), 
         type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

# close device PNG
dev.off()
}