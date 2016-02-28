

household_power_consumption <- read.csv("C:/Users/Gina/Desktop/Coursera/household_power_consumption.txt", sep=";")

household_power_consumption$datetime<-as.POSIXct(paste(household_power_consumption$Date, 
                        household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")

household_power_consumption$day <- weekdays(as.Date(household_power_consumption$datetime))

household_power_consumption$Gap <- as.numeric(as.character(household_power_consumption$Global_active_power)) 

x<-subset(household_power_consumption, Date=="1/2/2007"|Date=="2/2/2007")

plot(x$datetime,x$Gap, type="l",xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="Plot2.png")
dev.off()
