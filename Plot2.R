powercon <- read.table("household_power_consumption.txt",skip=1,sep=";")

powercon2007 <- powercon[powercon$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(powercon2007$Date, powercon2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(powercon2007$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()