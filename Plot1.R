#Loadig the data table library
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
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# plots into file the chart
hist(Data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

#Close the device
dev.off()

 
 

 
 
 
 