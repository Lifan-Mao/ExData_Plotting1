## plot3
## Energy sub metering
## data using:"household_power_consumption.txt" data from Coursera
## And it's a subset from UC Irvine Machine Learning Repository
## NOTE: please ensure the "load_data.R" script was sourced

#source the "load_data.R" script
source("load_data.R")

#function to make plot1
makePlot_3 <- function() {
    #get the subset data(the function was in "load_data.R")
    csvdata <- getSubset_data()
    
    #open device
    png(filename = "plot3.png", width = 480, height = 480)
    
    #make the plot, the black line
    plot(csvdata$DateTime, csvdata$Sub_metering_1,
         type = "l", 
         xlab = "", 
         ylab = "Energy sub metering", 
         col = "Black")
    
    #add red line
    lines(csvdata$DateTime, csvdata$Sub_metering_2,
          type = "l", 
          col = "Red")
    
    #add blue line
    lines(csvdata$DateTime, csvdata$Sub_metering_3,
          type = "l", 
          col = "Blue")
    
    #add legend
    legend("topright", lty = 1, lwd = 1, 
           col = c("Black","Red","Blue"), 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    #close device
    dev.off()
}

#call the function
makePlot_3()