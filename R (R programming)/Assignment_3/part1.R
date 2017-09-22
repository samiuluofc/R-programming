part1 <- function()
{
      outcome <- read.csv("G:/SAMIUL/BSc_MSc/Professional Development/Data_Science_Specialization/Course_2_R_Programming/Week_4/Assignment_3/outcome-of-care-measures.csv", colClasses = "character")
      print(nrow(outcome))
      print(ncol(outcome))
      #print(names(outcome))
      #print(head(outcome))
      
      outcome[, 11] <- as.numeric(outcome[, 11])
      
      hist(outcome[, 11])
}