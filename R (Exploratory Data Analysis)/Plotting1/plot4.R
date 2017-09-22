library(lubridate)

# Reading the whole dataset
whole_data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

# Converting into Date datatype
whole_data[, "Date"] <- dmy(whole_data[, "Date"])

# Subsetting only the 2007-02-01 and 2007-02-02
data <- subset(whole_data, Date == "2007-02-01" | Date == "2007-02-02")

#Combining Data and Time
x <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")


# Converting display data into floating point number
data[, "Sub_metering_1"] <- as.numeric(paste(data[, "Sub_metering_1"]))
data[, "Sub_metering_2"] <- as.numeric(paste(data[, "Sub_metering_2"]))
data[, "Sub_metering_3"] <- as.numeric(paste(data[, "Sub_metering_3"]))
data[, "Global_active_power"] <- as.numeric(paste(data[, "Global_active_power"]))
data[, "Global_reactive_power"] <- as.numeric(paste(data[, "Global_reactive_power"]))
data[, "Voltage"] <- as.numeric(paste(data[, "Voltage"]))

# Open png graphics device, and write four target graphs
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2, 2))

######## Graph 01
plot(x, data[, "Global_active_power"], xlab = "", ylab = "Global Active Power (kilowatts)", col = "black", main = "", pch = "")
lines(x,data[, "Global_active_power"])

######## Graph 02
plot(x, data[, "Voltage"], xlab = "DateTime", ylab = "Voltage", col = "black", main = "", pch = "")
lines(x,data[, "Voltage"])

######## Graph 03
plot(x, data[, "Sub_metering_1"], xlab = "", ylab = "Energy sub metering", col = "black", main = "", pch = "")

lines(x,data[, "Sub_metering_1"], col = "black")
lines(x,data[, "Sub_metering_2"], col = "red")
lines(x,data[, "Sub_metering_3"], col = "blue")

legend("topright", bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid", col = c("black","red","blue"))

######## Graph 04
plot(x, data[, "Global_reactive_power"], xlab = "DateTime", ylab = "Global_reactive_power", col = "black", main = "", pch = "")
lines(x,data[, "Global_reactive_power"])

dev.off()