##Exploratory Data Analysis Project 1

#Read Dat

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


#plot1

hist(power.consumption07$Global_active_power, col = 'red',xlab = "Global Active Power (kilowatts)", main="Global Active Power" )

dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()