power_data <- read.table("household_power_consumption.txt",sep=";",header = TRUE,colClasses = c(rep("character", 9)),na.strings = "?")
power_data$Date <- as.Date(power_data$Date,'%d/%m/%Y')
two_days <- subset(power_data,Date=='2007-02-01' | Date=='2007-02-02')
#Plot 1
png("plot1.png", width = 480,height =480, units = 'px')
hist(as.numeric(two_days$Global_active_power),breaks=20,col='red', main='Global Active Power',xlab='Global Active Power (Kilowatts)')
dev.off()