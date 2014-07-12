# Setting the working directory to the git repository
setwd("~/Documents/Online Classes/Coursera/Exploratory Data Analysis/ExData_Plotting1/")
# Getting the number of lines that meet the dates being observed
lines = grep("^[1|2]/2/2007", readLines("./household_power_consumption.txt"))
# Read it into a data frame
df = read.table("./household_power_consumption.txt",sep=";",skip=(lines[1]-1),nrow=length(lines))
# Set the column names
colnames(df) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# Format the date
df$Date = as.character.Date(df$Date)
df$Date = as.Date(df$Date, format="%d/%m/%Y")
# Build histogram from data frame
hist(df$Global_active_power,col="red",main="Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
# Copy the plot to a png file
dev.copy(png, file="plot1.png", height=480, width=480, units="px")
dev.off()