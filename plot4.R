data <- read.table("~/desktop/household_power_consumption.txt", header=TRUE, sep = ";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H")
data1 <-subset(data,Date=="2007-02-01")
data2 <-subset(data,Date=="2007-02-02")
data3 <- rbind(data1,data2)

par(mfrow=c(2,2))

plot(as.numeric(as.character(data3$Global_active_power)), type="l", xlab="", ylab="Global Active Power", xaxt="n",cex.axis=0.75, cex.lab=0.75, cex.main=0.9)
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"), cex.axis=0.75)

plot(as.numeric(as.character(data3$Voltage)), type="l", ylab="Voltage", xlab="datetime", xaxt="n", cex.axis=0.75, cex.lab=0.75)
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"), cex.axis=0.75)

plot(as.numeric(as.character(data3$Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", xaxt="n", cex.axis=0.75, cex.lab=0.75, cex.main=0.9)
lines(as.numeric(as.character(data3$Sub_metering_2)), type="l", col="red")
lines(as.numeric(as.character(data3$Sub_metering_3)), type="l", col="blue")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"), cex.axis=0.75)
legend("topright", col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty="solid", cex=0.7, x.intersp=0.1, bty="n")

plot(as.numeric(as.character(data3$Global_reactive_power)), type="l", ylab="Global_reactive_power", xlab="datetime", xaxt="n", cex.axis=0.75, cex.lab=0.75)
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"), cex.axis=0.75)

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
