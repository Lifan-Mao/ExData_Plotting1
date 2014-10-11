## plot4
## make matrix plot
## data using:"household_power_consumption.txt" data from Coursera
## And it's a subset from UC Irvine Machine Learning Repository
## NOTE: please ensure the "load_data.R" script was sourced

#source the "load_data.R" script
source("load_data.R")

#function to make plot4
makePlot_4 <- function() {
    #get the subset data(the function was in "load_data.R")
    csvdata <- getSubset_data()
    
    #open device
    png(filename = "plot4.png", width = 480, height = 480)
    
    #set matrix of 2x2 plots
    par(mfrow = c(2, 2))
    
    #make plot(1, 1) - Global Active Power
    plot(csvdata$DateTime, csvdata$Global_active_power, 
         type = "l", 
         main = "", 
         xlab = "", 
         ylab = "Global Active Power")
    
    #make plot(1, 2) - Voltage
    plot(csvdata$DateTime, csvdata$Voltage, 
         type = "l", 
         xlab = "datetime", 
         ylab = "Voltage")
    
    #make plot(2, 1) - Energy sub metering
    plot(csvdata$DateTime, csvdata$Sub_metering_1, 
         type = "l", 
         xlab = "", 
         ylab = "Energy sub metering", 
         col = "Black")
    
    lines(csvdata$DateTime, csvdata$Sub_metering_2, 
          type = "l", 
          col = "Red")
    
    lines(csvdata$DateTime, csvdata$Sub_metering_3, 
          type = "l", 
          col = "Blue")
    
    legend("topright", bty="n", #bty=n to turns off the legend box
           lty = 1, 
           lwd = 1, 
           col = c("Black","Red","Blue"), 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    #make plot(2, 2) - Global reactive power
    plot(csvdata$DateTime, csvdata$Global_reactive_power, 
         type = "l", 
         xlab = "datetime", 
         ylab = "Global_reactive_power")
    
    #close device
    dev.off()
}

#call the function
makePlot_4()