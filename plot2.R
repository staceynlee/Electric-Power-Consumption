# Read and Subset Data
library(dplyr)
d1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

dateList <- c("1/2/2007","2/2/2007")
df <- d1 %>% filter(Date %in% dateList)

# Plot Global Active Power Line Graph
df$Global_active_power <- as.numeric(df$Global_active_power)
df$datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(df$datetime, df$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="Time", main="Global Active Power")
dev.off()
