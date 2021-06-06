#Load data
data <-read.csv("household_power_consumption.txt", sep =";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")


#Subset data (2 days)
plot_data <- subset(data,Date == c("2007-02-01", "2007-02-02"))

#Convert Time and Date
plot_data$Time <- strptime(plot_data$Time, format ="%H:%M:%S")
plot_data$Date <- as.factor(weekdays(plot_data$Date))



#Open device
png("Plot4.png")

par(mfrow= c(2,2))

#Plot Plot1
plot(x = seq(1,length(plot_data$Time)), y = plot_data$Global_active_power, 
     type = "l",xaxt = "n",yaxt = "n", xlab = "",ylab = "Global Active Power (kilowatts)", ylim = c(0,8))
axis(side=1, labels = c("Thu","Fri","Sat"), at=c(1,721,1441))
axis(side=2,at=c(0,2,4,6), lwd = 2)

#Plot Plot2

plot(x = seq(1,length(plot_data$Time)), y = plot_data$Voltage, 
     type = "l",xaxt = "n",yaxt = "n", xlab = "datetime",ylab = "Voltage", ylim = c(233,247))
axis(side=1, labels = c("Thu","Fri","Sat"), at=c(1,721,1441))
axis(side=2,at=c(seq(234,246,2)), lwd = 2)

#Plot Plot3

plot(x = seq(1,length(plot_data$Time)), y = plot_data$Sub_metering_1,type = "n",
     xaxt = "n",yaxt = "n", xlab = "",ylab = "Energy sub metering", ylim = c(0,40))
axis(side=1, labels = c("Thu","Fri","Sat"), at=c(1,721,1441))
axis(side=2,at=c(0,10,20,30), lwd = 2)

with(plot_data, points(x = seq(1,length(plot_data$Time)),plot_data$Sub_metering_1, col = "black", type = "l"))
with(plot_data, points(x = seq(1,length(plot_data$Time)),plot_data$Sub_metering_2, col = "red", type = "l"))
with(plot_data, points(x = seq(1,length(plot_data$Time)),plot_data$Sub_metering_3, col = "blue", type = "l"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black","blue", "red"), bty= "n")

#Plot Plot4

plot(x = seq(1,length(plot_data$Time)), y = plot_data$Global_reactive_power, 
     type = "l",xaxt = "n",yaxt = "n", xlab = "datetime",ylab = "Global reactive power", ylim = c(0,0.5))
axis(side=1, labels = c("Thu","Fri","Sat"), at=c(1,721,1441))
axis(side=2,at=c(seq(0,0.5,0.1)), lwd = 2)

#Close device
dev.off()



      