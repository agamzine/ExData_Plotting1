#Load Data
raw_df <- read.table("./Datasets/household_power_consumption.txt", header = TRUE, sep = ";")

#Tidy Data
raw_df$Date <- as.Date(raw_df$Date,tryFormats = c("%d/%m/%Y"))
raw_df$datetime <- as.POSIXct(paste(raw_df$Date, raw_df$Time), format = "%Y-%m-%d %H:%M:%S")

df <- subset(raw_df, Date >= "2007-02-01" & Date <= "2007-02-02")
df$Global_active_power <- as.numeric(df$Global_active_power)

#Make plot
png("plot2.png", width = 480, height = 480)
plot(df$datetime, df$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(df$datetime, df$Global_active_power)
dev.off()