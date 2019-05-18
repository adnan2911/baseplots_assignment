power_data <- read.table("household_power_consumption.txt",sep=";",header = TRUE,colClasses = c(rep("character", 9)),na.strings = "?")
power_data$Date <- as.Date(power_data$Date,'%d/%m/%Y')
two_days <- subset(power_data,Date=='2007-02-01' | Date=='2007-02-02')

timedate <- paste(two_days$Date,two_days$Time)
time_xaxis <- strptime(timedate,"%Y-%m-%d %H:%M:%S")

#Plot4
png("plot4.png",width=480,height=480, units ="px")
par(mfrow=c(2,2),cex=0.8,mar=c(4,4,4,4))
plot(time_xaxis,as.numeric(two_days$Global_active_power),type="l",ylab="Global Active Powe",xlab="")

plot(time_xaxis,as.numeric(two_days$Voltage),type="l",ylab="Voltage",xlab="datetime")

plot(time_xaxis,as.numeric(two_days$Sub_metering_1), type="l",xlab='',ylab='Energy sub metering')
lines(time_xaxis,as.numeric(two_days$Sub_metering_2), type="l" , col='red')
lines(time_xaxis,as.numeric(two_days$Sub_metering_3), type="l" , col='blue' )
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"),cex=0.9,lwd=0.4,bty='n')

plot(time_xaxis,as.numeric(two_days$Global_reactive_power),type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()