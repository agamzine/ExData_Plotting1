#Load Data
raw_df <- read.table("./Datasets/household_power_consumption.txt", header = TRUE, sep = ";")

#Tidy Data
raw_df$Date <- as.Date(raw_df$Date,tryFormats = c("%d/%m/%Y"))
raw_df$datetime <- as.POSIXct(paste(raw_df$Date, raw_df$Time), format = "%Y-%m-%d %H:%M:%S")

df <- subset(raw_df, Date >= "2007-02-01" & Date <= "2007-02-02")
df$Global_active_power <- as.numeric(df$Global_active_power)

#Make plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(df, {
  plot(datetime, Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(datetime, Global_active_power)
  plot(datetime, Voltage, type = "n", ylab = "Voltage")
  lines(datetime, Voltage)
  plot(datetime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
  lines(datetime, Sub_metering_1)
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lwd = 2, col = c("black", "red", "blue"))
  plot(datetime, Global_reactive_power, type = "n")
  lines(datetime, Global_reactive_power)
})
dev.off()