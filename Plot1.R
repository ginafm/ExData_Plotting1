
household_power_consumption <- read.csv("C:/Users/Gina/Desktop/Coursera/household_power_consumption.txt", sep=";")

hpc<-subset(household_power_consumption, Date=="1/2/2007"|Date=="2/2/2007")

hpc$Gap <- as.numeric(as.character(hpc$Global_active_power)) 

hist(hpc$Gap, col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.copy(png, file="Plot1.png")
dev.off()
