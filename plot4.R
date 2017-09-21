# Read data
hpc <- read.csv("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";", stringsAsFactors = FALSE)
# Subset the date for specific date
hpc_sel <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))
# Combine Date and Time column and parse it to datetime
datetime <- paste(hpc_sel$Date, hpc_sel$Time)
hpc_sel$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Remove NA value
hpc_sel <- na.omit(hpc_sel)
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2))
# Draw plot at position (1,1)
with(hpc_sel, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l"))

# Draw plot at position (2,1)
with(hpc_sel, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
with(hpc_sel, lines(DateTime, Sub_metering_2, col = "red"))
with(hpc_sel, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

# Draw plot at position (1,2)
with(hpc_sel, plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))

# Draw plot at position (2,2)
with(hpc_sel, plot(DateTime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l"))

dev.off()
