#Load data
data <-read.csv("household_power_consumption.txt", sep =";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")


#Subset data (2 days)
plot_data <- subset(data,Date == c("2007-02-01", "2007-02-02"))

#Convert Time and Date
plot_data$Time <- strptime(plot_data$Time, format ="%H:%M:%S")
plot_data$Date <- as.factor(weekdays(plot_data$Date))

#Open device
png("plot2.png")

#Plot
plot(x = seq(1,length(plot_data$Time)), y = plot_data$Global_active_power, 
type = "l",xaxt = "n",yaxt = "n", xlab = "",ylab = "Global Active Power (kilowatts)", ylim = c(0,8))
axis(side=1, labels = c("Thu","Fri","Sat"), at=c(1,721,1441))
axis(side=2,at=c(0,2,4,6), lwd = 2)

#Close devide
dev.off()
