power_data <- read.table("household_power_consumption.txt",sep=";",header = TRUE,colClasses = c(rep("character", 9)),na.strings = "?")
power_data$Date <- as.Date(power_data$Date,'%d/%m/%Y')
two_days <- subset(power_data,Date=='2007-02-01' | Date=='2007-02-02')


#Plot 2
timedate <- paste(two_days$Date,two_days$Time)
time_xaxis <- strptime(timedate,"%Y-%m-%d %H:%M:%S")
png("plot2.png",width=480,height=480, units ="px")
par(cex=0.9)
plot(time_xaxis,as.numeric(two_days$Global_active_power),type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
