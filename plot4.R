# Importing the data 
    exdata <- read.delim("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?")

# Filter for Date Feb 1 2007 and Feb 2 2007 and convdert date and time
    exdata1 <- exdata[(exdata$Date=="1/2/2007"|exdata$Date=="2/2/2007"),]
    exdata1$dt <- as.POSIXct(strptime(paste(exdata1$Date,exdata1$Time),"%d/%m/%Y %H:%M:%S"))

# Draw the graph
  
  # Set the par factors
  par(mfcol=c(2,2))
  
    
  plot(exdata1$Global_active_power~exdata1$dt, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(exdata1$Sub_metering_1~exdata1$dt, type="n", ylab="Energy sub metering", xlab="")
  lines(exdata1$Sub_metering_1~exdata1$dt)
  lines(exdata1$Sub_metering_2~exdata1$dt, col='Red')
  lines(exdata1$Sub_metering_3~exdata1$dt, col='Blue')
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
         ,col=c("Black","Red","Blue"),border="White",,lty=1,cex=0.489,lwd=1)
  
  plot(exdata1$Voltage ~exdata1$dt, type="l", ylab="Voltage", xlab="datetime")
  
  plot(exdata1$Global_reactive_power~exdata1$dt, type="l", ylab="Global_reactive_power", xlab="datetime")
  
  
  
  dev.copy(png, file="ExData_Plotting1/plot4.png", height=480, width=480)
  dev.off()
  