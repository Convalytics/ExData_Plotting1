##############################
# Exploratory Data Analysis
# Course Project 1
# Jason Green
# 1/11/2015
# Plot 4
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

# Plot the charts.

old.par <- par(mfrow=c(2, 2))


#Chart 1
plot(data$DateTime,data$Global_active_power, xlab='', ylab='Global Active Power (kilowatts)', main='', type='line')


#Chart 2
plot(data$DateTime,data$Voltage, xlab='datetime', ylab='Voltage', main='', type='line')

#Chart 3
plot(data$DateTime,data$Sub_metering_1, xlab='', ylab='Energy sub metering', main='', type='line')
lines(data$DateTime,data$Sub_metering_2, col='red')
lines(data$DateTime,data$Sub_metering_3, col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3') , 
       lty=1, col=c('black', 'red', 'blue'), cex=0.5)


#Chart 4
plot(data$DateTime,data$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', main='', type='line')


# Create a PNG file from the plot.
dev.copy(png, file="plot4.png", height=480, width=480, units='px')
dev.off()

par(old.par)

