
library(lubridate)

# Reading the whole dataset
whole_data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

# Converting into Date datatype
whole_data[, "Date"] <- dmy(whole_data[, "Date"])

# Subsetting only the 2007-02-01 and 2007-02-02
data <- subset(whole_data, Date == "2007-02-01" | Date == "2007-02-02")

# Converting Global_active_power into floating point number
data[, "Global_active_power"] <- as.numeric(paste(data[, "Global_active_power"]))


# Open png graphics device, and write the histogram
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")
hist(data[, "Global_active_power"], xlab = "Global Active Power (kilowatts)", col = 34, main = "Global Active Power")
dev.off()