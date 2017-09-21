# Read data
hpc <- read.csv("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";", stringsAsFactors = FALSE)
# Subset the date for specific date
hpc_sel <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))
# Combine Date and Time column and parse it to datetime
datetime <- paste(hpc_sel$Date, hpc_sel$Time)
hpc_sel$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Remove NA value
hpc_sel <- na.omit(hpc_sel)
png(file = "plot1.png", width = 480, height = 480, units = "px")
with(hpc_sel, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()
