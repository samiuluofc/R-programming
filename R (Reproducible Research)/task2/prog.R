
# Title     : Analysis of NOAA Storm Database
# Analyst   : Samiul Azam, University of Calgary
# Date      : 18 September 2018

# Abstract:
#
#
#


# Adding library
library(ggplot2)
library(plyr)




## Data Processing Section

# Reading the Dataset
data_raw <- read.csv("FStormData.csv.bz2")

# Copying the raw data into another object
storm <- data_raw

# Selecting only the important variables for the analysis
storm <- subset(storm, select=c("EVTYPE", "FATALITIES", "INJURIES", "PROPDMGEXP", "PROPDMG", "CROPDMGEXP", "CROPDMG"))

# Check for NA values
sum(is.na(storm[,"FATALITIES"]))
sum(is.na(storm[,"INJURIES"]))
sum(is.na(storm[,"PROPDMGEXP"]))
sum(is.na(storm[,"PROPDMG"]))
sum(is.na(storm[,"CROPDMGEXP"]))
sum(is.na(storm[,"CROPDMG"]))
sum(is.na(storm[,"EVTYPE"]))

# Summary of variables (except "EVTYPE")
summary(storm$PROPDMGEXP)
summary(storm$CROPDMGEXP)
summary(storm$PROPDMG)
summary(storm$CROPDMG)
summary(storm$FATALITIES)
summary(storm$INJURIES)

# From the above summary, CROPDMGEXP and PROPDMGEXP contain the exponential term
# as factor variable. Preprocessing is needed to make them correct and consistent.

# Replacing factors with numbers
storm$PROPDMGEXP <- revalue(storm$PROPDMGEXP, c("M"="6", "m"="6", "K"="3", "B"="9", "+"="1", "?"="1", "h"="2", "H"="2", "-"="1"))
PROPDMG_COST <- storm$PROPDMG*(10^as.numeric(storm$PROPDMGEXP))
storm$CROPDMGEXP <- revalue(storm$CROPDMGEXP, c("M"="6", "m"="6", "K"="3", "B"="9", "k"="3", "?"="1"))
CROPDMG_COST <- storm$CROPDMG*(10^as.numeric(storm$CROPDMGEXP))
storm$DMG_COST <- PROPDMG_COST + CROPDMG_COST

# Total affected lifes
storm$LIFE_COST = storm$FATALITIES + storm$INJURIES

## Result Section

# Answer of Question 1: 
# Select only the variables "EVTYPE" and "LIFE_COST"
storm_temp1 <- subset(storm, select=c("EVTYPE", "LIFE_COST"))

# Aggregate LIFE_COST for each type of disaster event (across the US)
plot_data_1 <- aggregate(data = storm_temp1, LIFE_COST ~ EVTYPE, FUN = sum)

# Sort the (in descending order) table according to LIFE_COST
plot_data_1 <- plot_data_1[order(plot_data_1$LIFE_COST, decreasing = TRUE),]

# Select top 20
plot_data <- plot_data_1[1:20,]

# Bar ploting
g <- ggplot(plot_data, aes(EVTYPE, LIFE_COST))
g <- g + geom_bar(stat='identity')
g <- g + xlab("Disaster Event Type") + ylab("Number of Fatalities and Injuries") + ggtitle( "Top 20 harmful disasters(1950 to November 2011)")
g <- g + theme(axis.text.x=element_text(angle = 90, hjust = 1))
print(g)

# Question 2:
# Across the United States, which types of events have the greatest economic consequences?
# Select only the variables "EVTYPE" and "LIFE_COST"
storm_temp2 <- subset(storm, select=c("EVTYPE", "DMG_COST"))

# Aggregate LIFE_COST for each type of disaster event (across the US)
plot_data_2 <- aggregate(data = storm_temp2, DMG_COST ~ EVTYPE, FUN = sum)

# Sort the (in descending order) table according to LIFE_COST
plot_data_2 <- plot_data_2[order(plot_data_2$DMG_COST, decreasing = TRUE),]

# Select top 20
plot_data <- plot_data_2[1:20,]

# Convert the amount into Billion $
plot_data$DMG_COST <- plot_data$DMG_COST/1000000000


# Bar ploting
g <- ggplot(plot_data, aes(EVTYPE, DMG_COST))
g <- g + geom_bar(stat='identity')
g <- g + xlab("Disaster Event Type") + ylab("Amount of Damage in Billion $") + ggtitle( "Top 20 economically harmful disasters(1950 to November 2011)")
g <- g + theme(axis.text.x=element_text(angle = 90, hjust = 1))
print(g)


