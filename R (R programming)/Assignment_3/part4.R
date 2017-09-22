rankall <- function(outcome, num = "best") 
{
     
      data <- read.csv("G:/SAMIUL/BSc_MSc/Professional Development/Data_Science_Specialization/Course_2_R_Programming/Week_4/Assignment_3/outcome-of-care-measures.csv", colClasses = "character")
      #View(data)
      
      data_hospital <- unique(data[,"State"])
      
      sta <- sort(unique(data_hospital))
      
      i <- 1
      
      total_sta <- length(sta)
      h <- c(rep("NA",total_sta))
      
      while (i <= total_sta)
      {
            h[i] <- rankhospital(sta[i], outcome, num)
            i = i + 1
      }
      
      df <- data.frame(h,sta, row.names = c("hospital","state"))
      df
}