# Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Selecting only motor vehicle sources
veh_comb <- subset(NEI, type == "ON-ROAD")

# Selecting only the Baltimore and Los Angels
veh_comb <- subset(veh_comb, fips == "24510"| fips == "06037") 

# Converting year and fips into a factor variable
veh_comb[, "year"] <- as.factor(paste(veh_comb[, "year"]))
veh_comb[, "fips"] <- as.factor(paste(veh_comb[, "fips"]))

# Sumup all Emission values yearwise + fips
int_res <- aggregate(data = veh_comb, Emissions ~ year + fips, FUN=sum)

# Change the labels from number to word
levels(int_res$fips) <- c("Los Angeles", "Baltimore")

# Open png graphics device, and write the barplot (using ggplot2)
png(filename = "plot6.png", width = 600, height = 400, bg = "transparent")
g <- ggplot(data = int_res, aes(year, Emissions))
g <- g + geom_bar(stat='identity') + facet_grid(. ~ fips)
g <- g + xlab("Years") + ylab("Total PM2.5 Emissions (in Tons)") + ggtitle( "Emission from motor vehicle sources")
print(g)
dev.off()