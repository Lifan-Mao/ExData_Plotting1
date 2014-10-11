## plot2
## Global Active Power(by time)
## data using:"household_power_consumption.txt" data from Coursera
## And it's a subset from UC Irvine Machine Learning Repository
## NOTE: please ensure the "load_data.R" script was sourced

#source the "load_data.R" script
source("load_data.R")

#function to make plot2
makePlot_2 <- function() {
    #get the subset data(the function was in "load_data.R")
    csvdata <- getSubset_data()
    
    #open device
    png(filename = "plot2.png", width = 480, height = 480)
    
    #make the plot
    plot(csvdata$DateTime, csvdata$Global_active_power, 
         type = "l", 
         xlab = "", 
         ylab = "Global Active Power (kilowatts)", 
         col = "Black")
    
    #close device
    dev.off()
}

#call the function
makePlot_2()