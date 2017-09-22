# Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Converting year into a factor variable
NEI[, "year"] <- as.factor(paste(NEI[, "year"]))

# Selecting only the Bultimore city
balti <- subset(NEI, fips == "24510") 

# Sumup all Emission values yearwise
int_res <- aggregate(data = balti, Emissions ~ year, FUN=sum)

# Open png graphics device, and write the barplot
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
barplot(int_res[, "Emissions"], names.arg=c("1999", "2002", "2005", "2008"), xlab = "Years", ylab = "Total PM2.5 Emissions (in Tons)", col = 34, main = "Total PM2.5 Emissions at Baltimore City, Maryland")
dev.off()