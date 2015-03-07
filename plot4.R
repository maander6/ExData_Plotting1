## plot4.R
##
## This script is to reproduce plot4.png in assignment #1
##
## First the data is read into R using the read.table() command
## This command assumes that the script is run from a working directory that 
## contains the household_power_consumption.txt file
##
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")
##
## the data in the Date column and the Time column are then concatenated using the paste()
## function and placed in vector d1.  The vector d1 is then coverted to POSIXlt 
## format using the strptime() command
##
d1 <- paste(data$Date, data$Time, sep=" ")
d1 <- strptime(d1, format="%d/%m/%Y %H:%M:%S")
##
## a new data table is created by column binding the original data table (data)
## and the vector d1.  This creates a column, d1, that contains the date and time
## in POSIXlt format for the power data
##
data1 <- cbind(data, d1)
## 
## the data for the dates Feb. 1, 2007 through Feb. 2, 2007 are selected from the data table
##
data1 <- subset(data1, d1>="2007-02-01" & d1<"2007-02-03")
##
## the png() command initializes the output to a png file that is 480 x 480 pixels
##
png("./plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA)
##
## The par() function sets up the plot function into a 2X2 matrix so that multiple
## plots can be placed in the same device (in this case the png file)
##
par(mfrow=c(2,2))
##
## Plot the first x-y plot in row 1, column 1
##
plot(data1$d1, as.numeric(data1$Global_active_power), type="l", ylab="Global Active Power", xlab="")
##
## Plot the second x-y plot in row 1, Column 2
##
plot(data1$d1, as.numeric(data1$Voltage), col="black", type="l", ylab="Voltage", xlab="datetime")
##
## Plot the third x-y graph in row 2, Column 1
##
plot(data1$d1, as.numeric(data1$Sub_metering_1), type="n", ylab="Energy sub metering", xlab="")
lines(data1$d1, as.numeric(data1$Sub_metering_1), col="black")
lines(data1$d1, as.numeric(data1$Sub_metering_2), col="red")
lines(data1$d1, as.numeric(data1$Sub_metering_3), col="blue")
legend("topright",col=c("black", "red", "blue"), lwd=1, legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex=0.85, bty="n")
##
## Plot the fourth x-y graph in row 2, column 2
##
plot(data1$d1, as.numeric(data1$Global_reactive_power), col="black", type="l", ylab="Global_reactive_power", xlab="datetime")
##
## need to exit the png device after writing the file
##
dev.off()