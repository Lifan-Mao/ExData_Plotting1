## This R Script is used to load data from Coursera course project
## function download_data will download zip file from an url
## function getSubset_data will subset the data we need from the download data

#download zip file from an url
download_data <- function(fileUrl, fileName) {
    if (!file.exists(fileName)) {
        download.file(fileUrl, destfile = fileName)
    }
    fileName
}

getSubset_data <- function() {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    fileName <- "household_power_consumption.zip"
    csvfileName <- "plotdata.csv"
    #if data file exists, then load it
    if (file.exists(csvfileName)) {
        data <- read.csv(csvfileName)
        #datetime will be used in plot2, plot3, plot4
        data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    } else {
        #download zip file
        zipfile <- download_data(fileUrl, fileName)
        #unzip
        unzipfile <- unzip(zipfile, files = "household_power_consumption.txt")
        data <- read.table(unzipfile, header = T, sep = ";", na.strings = "?", 
                           colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        #subset data
        data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
        #datetime will be used in plot2, plot3, plot4
        data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
        #save to the csv file
        write.csv(data, csvfileName)
    }
    #return csv data
    data
}