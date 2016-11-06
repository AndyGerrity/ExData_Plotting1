powercon <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(powercon) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

powercon2007 <- subset(powercon,powercon$Date=="1/2/2007" | powercon$Date =="2/2/2007")


datetime <- strptime(paste(powercon2007$Date, powercon2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalactivepower <- as.numeric(powercon2007$Global_active_power)

submetering1 <- as.numeric(powercon2007$Sub_metering_1)

submetering2 <- as.numeric(powercon2007$Sub_metering_2)

submetering3 <- as.numeric(powercon2007$Sub_metering_3)


# calling the basic plot functions
png("plot3.png", width=480, height=480)

plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
