#load data
powercon <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(powercon) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subset data
powercon2007 <- subset(powercon,powercon$Date=="1/2/2007" | powercon$Date =="2/2/2007")

#convert data to correct format
datetime <- strptime(paste(powercon2007$Date, powercon2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalactivepower <- as.numeric(powercon2007$Global_active_power)

submetering1 <- as.numeric(powercon2007$Sub_metering_1)

submetering2 <- as.numeric(powercon2007$Sub_metering_2)

submetering3 <- as.numeric(powercon2007$Sub_metering_3)

globalreactivePower <- as.numeric(subSetData$Global_reactive_power)

voltage <- as.numeric(powercon2007$Voltage)

#call plot functions

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalreactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
