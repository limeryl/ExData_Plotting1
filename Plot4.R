##Loadig the Data table library
library(data.table)

# read the source file  
Data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")) 

# Concate date and time
Data$Time <- strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S") 

# clean date and time
Data$Date <- as.Date(Data$Date, "%d/%m/%Y") 

#Filter date as required by assignment
Data <- Data[Data$Date >= as.Date("2007-02-01") & Data$Date<=as.Date("2007-02-02"), ]



#Open PNG device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# plots into file the chart
 png("plot4.png", width=400, height=400) 
 
##################################### 
#Divide window in four subcharts
par(mfrow=c(2,2)) 
     
# First Chart	 
plot(Data$Time, Data$Global_active_power, type="l", xlab="", ylab="Global Active Power") 

# Second Chart
plot(Data$Time, Data$Voltage, type="l", xlab="datetime", ylab="Voltage") 

# Third Chart
plot(Data$Time, Data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering") 
lines(Data$Time, Data$Sub_metering_2, col="red") 
lines(Data$Time, Data$Sub_metering_3, col="blue") 
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, box.lwd = 0, cex = 0.7) 

# Fourth Chart
 plot(Data$Time, Data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power") 
 lines(Data$Time, Data$Global_reactive_power) 


#Close the device
dev.off()

 
 

 
 
 
 