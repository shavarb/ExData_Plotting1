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


#plot4

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(power.consumption07, {
        plot(power.consumption07$Global_active_power, type = "l", ylab = "Global Active Power")
        plot(power.consumption07$Voltage, type ="l", ylab = "Voltage")
        plot(power.consumption07$Sub_metering_1 , type = "l", ylab ="Energy Sub Metering", col ="black")
        lines(power.consumption07$Sub_metering_2 , type = "l",col ="red")
        lines(power.consumption07$Sub_metering_3 , type = "l", col ="blue")
        plot(power.consumption07$Global_reactive_power, type ="l", ylab = "Global Reactive Power")
        
})

dev.copy(png,"plot4.png", width = 480, height = 480)
dev.off()