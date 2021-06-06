#Load data
data <-read.csv("household_power_consumption.txt", sep =";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Subset data (2 days)
plot_data <- subset(data,Date == c("2007-02-01", "2007-02-02"))

#Open device
png("plot1.png")

#Plot
with(plot_data, hist(Global_active_power,xlab = "Global Active Power (kilowatts)", col="red",main = "Global Active Power",breaks = 12, plot=TRUE,xlim=c(0,6), ylim = c(0,1200), xaxt = "n"))
axis(side=1, at=c(0,2,4,6))

#Close device
dev.off()

