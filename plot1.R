## plot1.R
##
## This script is to reproduce plot1.png in assignment #1
##
## First the data is read into R using the read.table() command
## This command assumes that the script is run from a working directory that 
## contains the household_power_consumption.txt file
##
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")
##
## the data in the Date column is then converted from Character class to Date class
##
data$Date <- as.Date(data$Date, "%d/%m/%Y")
## 
## the data for the dates Feb. 1, 2007 through Feb. 2, 2007 are selected from the data table
##
data1 <- subset(data, Date >= "2007-02-01" & Date < "2007-02-03")
##
## the png() command initializes the output to a png file that is 480 x 480 pixels
##
png("./plot1.png", width = 480, height = 480, units = "px", pointsize = 10, bg = "white", res = NA)
##
## the hist() function creates a histogram using the data, converted to numeric format
## from the Global_active_power column of the data1 data table.
##
hist(as.numeric(data1$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
##
## need to exit the png device after writing the file
dev.off()