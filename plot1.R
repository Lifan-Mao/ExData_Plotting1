## plot1
## Global Active Power
## data using:"household_power_consumption.txt" data from Coursera
## And it's a subset from UC Irvine Machine Learning Repository
## NOTE: please ensure the "load_data.R" script was sourced

#source the "load_data.R" script
source("load_data.R")

#function to make plot1
makePlot_1 <- function() {
    #get the subset data(the function was in "load_data.R")
    csvdata <- getSubset_data()
    
    #open device
    png(filename = "plot1.png", width = 480, height = 480)
    
    #make the plot
    hist(csvdata$Global_active_power, 
         main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)", 
         col = "Red")
    
    #close device
    dev.off()
}

#call the function
makePlot_1()