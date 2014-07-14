##Exploratory Data Analysis Project 1

#Read Data

power.consumption5 <- read.table("~/Data Science/Coursera/Exploratory Data Analysis/ExData_Plotting1/household_power_consumption.txt", 
                                 header= TRUE, sep = ";", nrows = 5)
classes <- sapply(power.consumption, class)

power.consumption <- read.table("~/Data Science/Coursera/Exploratory Data Analysis/ExData_Plotting1/household_power_consumption.txt", 
                                header= TRUE, sep = ";", colClasses = classes, na.strings = "?")

head(power.consumption)

# convert date and time

power.consumption$Date <- as.Date(power.consumption$Date, "%d/%m/%Y")

#Get Subset of data

power.consumption07 <- power.consumption[power.consumption$Date >="2007-02-01" & power.consumption$Date <= "2007-02-02",]

head(power.consumption)


#plot3

plot(power.consumption07$Sub_metering_1 , type = "l", ylab ="Energy Sub Metering", col ="black")
lines(power.consumption07$Sub_metering_2 , type = "l",col ="red")
lines(power.consumption07$Sub_metering_3 , type = "l", col ="blue")
legend("topright",bty ="n", lty = c(1,1,2), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", 
                                                                                        "Sub_metering_3"),lwd=c(2.5,2.5,2.5))
dev.copy(png,"plot3.png", width = 480, height = 480)
dev.off()

