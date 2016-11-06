powercon <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(powercon) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

powercon2007 <- subset(powercon,powercon$Date=="1/2/2007" | powercon$Date =="2/2/2007")

png("plot1.png", width=480, height=480)

hist(as.numeric(as.character(powercon2007$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.off()