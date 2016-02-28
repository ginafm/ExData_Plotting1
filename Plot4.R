household_power_consumption <- read.csv("C:/Users/Gina/Desktop/Coursera/household_power_consumption.txt", sep=";")

household_power_consumption$datetime<-as.POSIXct(paste(household_power_consumption$Date, 
                                                       household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")

household_power_consumption$day <- weekdays(as.Date(household_power_consumption$datetime))

x<-subset(household_power_consumption, Date=="1/2/2007"|Date=="2/2/2007")

household_power_consumption$Gap <- as.numeric(as.character(household_power_consumption$Global_active_power)) 

household_power_consumption$Sm1 <- as.numeric(as.character(household_power_consumption$Sub_metering_1)) 
household_power_consumption$Sm2 <- as.numeric(as.character(household_power_consumption$Sub_metering_2)) 
household_power_consumption$Sm3 <- as.numeric(as.character(household_power_consumption$Sub_metering_3)) 

household_power_consumption$V <- as.numeric(as.character(household_power_consumption$Voltage)) 
household_power_consumption$Grp <- as.numeric(as.character(household_power_consumption$Global_reactive_power)) 

par(mfrow=c(2,2), mar=c(5,5,2,2))

plot(x$datetime,x$Gap, type="l",xlab="", ylab="Global Active Power (kilowatts)")
plot(x$datetime,x$V, type="l",xlab="",ylab="Voltage")
mtext(c("datetime"),cex=0.7,side=1,line=3)
plot(x$datetime,x$Sm1, type="l",xlab="", ylab="Energy sub metering")
lines(x$datetime,x$Sm2, col="red")
lines(x$datetime,x$Sm3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       y.intersp=0.5, x.intersp=0.5,cex=0.6, col=c("black","red","blue"),lty=c(1,1,1))
plot(x$datetime,x$Grp, type="l",xlab="",ylab="Global_reactive_power")
mtext(c("datetime"),cex=0.7,side=1,line=3)


dev.copy(png, file="Plot4.png")
dev.off()
