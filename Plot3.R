household_power_consumption <- read.csv("C:/Users/Gina/Desktop/Coursera/household_power_consumption.txt", sep=";")

household_power_consumption$datetime<-as.POSIXct(paste(household_power_consumption$Date, 
                                                       household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")

household_power_consumption$day <- weekdays(as.Date(household_power_consumption$datetime))

household_power_consumption$Sm1 <- as.numeric(as.character(household_power_consumption$Sub_metering_1)) 
household_power_consumption$Sm2 <- as.numeric(as.character(household_power_consumption$Sub_metering_2)) 
household_power_consumption$Sm3 <- as.numeric(as.character(household_power_consumption$Sub_metering_3)) 

x<-subset(household_power_consumption, Date=="1/2/2007"|Date=="2/2/2007")

plot(x$datetime,x$Sm1, type="l",xlab="", ylab="Energy sub metering")
lines(x$datetime,x$Sm2, col="red")
lines(x$datetime,x$Sm3, col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       y.intersp=0.5, x.intersp=0.5,cex=0.6, col=c("black","red","blue"),lty=c(1,1,1))

dev.copy(png, file="Plot3.png")
dev.off()

