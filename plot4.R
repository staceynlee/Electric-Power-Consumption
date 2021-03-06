# Read and Subset Data
library(dplyr)
d1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

dateList <- c("1/2/2007","2/2/2007")
df <- d1 %>% filter(Date %in% dateList)

# Convert data types
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

df$datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot data
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(df$datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(df$datetime, df$Voltage, type="l", xlab="Time", ylab="Voltage")

plot(df$datetime, df$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="Time")
lines(df$datetime, df$Sub_metering_2, type="l", col="red")
lines(df$datetime, df$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(df$datetime, df$Global_reactive_power, type="l", xlab="Time", ylab="Global_reactive_power")

dev.off()

