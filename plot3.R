# Setting the working directory
setwd("~/Documents/Online Classes/Coursera/Exploratory Data Analysis/")
# Getting the number of lines that meet the dates being observed
lines = grep("^[1|2]/2/2007", readLines("./household_power_consumption.txt"))
# Read it into a data frame
df = read.table("./household_power_consumption.txt",sep=";",skip=(lines[1]-1),nrow=length(lines))
# Set the column names
colnames(df) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# Format the date
df$Date = as.character.Date(df$Date)
df$Date = as.Date(df$Date, format="%d/%m/%Y")
df$Time = paste(df$Date,df$Time)
df$Time = as.POSIXlt(df$Time)
# Build the plot from data frame
par(bg=NA,cex.lab=2)
plot(df$Time,df$Sub_metering_1,type="l",lwd=1, xlab="", ylab="Energy sub metering",col="black")
lines(df$Time,df$Sub_metering_2,type="l",lty=1,col="red")
lines(df$Time,df$Sub_metering_3,type="l",lty=1,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=.7,text.font=2)
# Copy the output to a png file
dev.copy(png, file="plot3.png", height=480, width=480, units="px")
dev.off()
