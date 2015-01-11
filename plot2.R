##############################
# Exploratory Data Analysis
# Course Project 1
# Jason Green
# 1/11/2015
# Plot 2
##############################

# Set the working directory.
setwd("~/GitHub/ExData_Plotting1/")

# Download and Unzip data file:
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE,sep=";", na.strings = '?')
unlink(temp)

# Subset to only the 2 dates required:
data <- data[data$Date == '1/2/2007'|data$Date == '2/2/2007',]

# Combine Date and Time into a single variable.
data$DateTime <- paste(data$Date, data$Time)

# Format the DateTime field as date and time.
data$DateTime <- strptime(data$DateTime, format='%d/%m/%Y %H:%M:%S')

# Plot the chart.
plot(data$DateTime,data$Global_active_power, xlab='', ylab='Global Active Power (kilowatts)', main='', type='line')

# Create a PNG file from the plot.
dev.copy(png, file="plot2.png", height=480, width=480, units='px')
dev.off()

