# Read and Subset Data
library(dplyr)
d1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

dateList <- c("1/2/2007","2/2/2007")
df <- d1 %>% filter(Date %in% dateList)

# Plot Global Active Power
df$Global_active_power <- as.numeric(df$Global_active_power)
png("plot1.png", width=480, height=480)
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()