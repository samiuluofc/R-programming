# Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Selecting only coal combustion-related sources
code <- subset(SCC, EI.Sector == "Fuel Comb - Comm/Institutional - Coal")
comb_coal <- merge(NEI, code, by = "SCC")

# Converting year into a factor variable
comb_coal[, "year"] <- as.factor(paste(comb_coal[, "year"]))

# Sumup all Emission values yearwise
int_res <- aggregate(data = comb_coal, Emissions ~ year, FUN=sum)

# Open png graphics device, and write the barplot
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")
barplot(int_res[, "Emissions"], names.arg=c("1999", "2002", "2005", "2008"), xlab = "Years", ylab = "Total PM2.5 Emissions (in Tons)", col = 34, main = "Total PM2.5 Emissions (from coal combustion-related sources)")
dev.off()