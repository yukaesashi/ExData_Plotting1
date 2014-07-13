data <- read.table("~/desktop/household_power_consumption.txt", header=TRUE, sep = ";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H")
data1 <-subset(data,Date=="2007-02-01")
data2 <-subset(data,Date=="2007-02-02")
data3 <- rbind(data1,data2)

hist(as.numeric(as.character(data3$Global_active_power)), col="red", breaks=12, xlab="Global Active Power (kilowatts)", main="Global Active Power", cex.axis=0.75, cex.lab=0.75, cex.main=0.9)

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()