# Importing the data 
    exdata <- read.delim("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?")

# Filter for Date Feb 1 2007 and Feb 2 2007 and convdert date and time
    exdata1 <- exdata[(exdata$Date=="1/2/2007"|exdata$Date=="2/2/2007"),]
    exdata1$dt <- as.POSIXct(strptime(paste(exdata1$Date,exdata1$Time),"%d/%m/%Y %H:%M:%S"))

# Draw the graph
  
  plot(exdata1$Global_active_power~exdata1$dt, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    
  dev.copy(png, file="ExData_Plotting1/plot2.png", height=480, width=480)
  dev.off()
  
  