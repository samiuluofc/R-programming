library(ggplot2)

# Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Converting year and type into factor variables
NEI[, "year"] <- as.factor(paste(NEI[, "year"]))
NEI[, "type"] <- as.factor(paste(NEI[, "type"]))

# Selecting only the Bultimore city
balti <- subset(NEI, fips == "24510") 

# Sumup all Emission values yearwise + 4 types
int_res <- aggregate(data = balti, Emissions ~ year + type, FUN=sum)

# Open png graphics device, and write the barplot (using ggplot2)
png(filename = "plot3.png", width = 1000, height = 400, bg = "transparent")
g <- ggplot(data = int_res, aes(year, Emissions))
g <- g + geom_bar(stat='identity') + facet_grid(. ~ type)
g <- g + xlab("Years") + ylab("Total PM2.5 Emissions (in Tons)") + ggtitle( "Emission at Baltimore City, Maryland")
print(g)
dev.off()

