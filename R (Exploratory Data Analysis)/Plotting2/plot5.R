# Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Selecting only motor vehicle sources
veh_comb <- subset(NEI, type == "ON-ROAD")

# Selecting only the Baltimore city
veh_comb <- subset(veh_comb, fips == "24510") 

# Converting year into a factor variable
veh_comb[, "year"] <- as.factor(paste(veh_comb[, "year"]))

# Sumup all Emission values yearwise
int_res <- aggregate(data = veh_comb, Emissions ~ year, FUN=sum)

# Open png graphics device, and write the barplot
png(filename = "plot5.png", width = 480, height = 480, bg = "transparent")
barplot(int_res[, "Emissions"], names.arg=c("1999", "2002", "2005", "2008"), xlab = "Years", ylab = "Total PM2.5 Emissions (in Tons)", col = 34, main = "Total PM2.5 Emissions in Baltimore (from motor vehicle sources)")
dev.off()