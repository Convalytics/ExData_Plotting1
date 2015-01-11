##############################
# Exploratory Data Analysis
# Course Project 1
# Jason Green
# 1/11/2015
# Plot 1
##############################

# Download and Unzip data file:
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE,sep=";")
unlink(temp)

# Subset to only the 2 dates required:
data <- data[data$Date == '1/2/2007'|data$Date == '2/2/2007',]
#data$Date <- as.Date(data$Date, format='%d/%m/%Y')

data$DateTime <- paste(data$Date, data$Time)

#head(data)
data$DateTime <- strptime(data$DateTime, format='%d/%m/%Y %H:%M:%S')

head(data)
