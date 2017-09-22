rankhospital <- function(state, outcome, num = "best") 
{
      data <- read.csv("G:/SAMIUL/BSc_MSc/Professional Development/Data_Science_Specialization/Course_2_R_Programming/Week_4/Assignment_3/outcome-of-care-measures.csv", colClasses = "character")
      #View(data)
      
      sta <- data[,"State"]
      bin <- sta == state
      res <- sum(bin)
      if(res == 0) stop("invalid state")
      
      out <- c("heart attack","heart failure","pneumonia")
      bin <- out == outcome
      res <- sum(bin)
      if(res == 0) stop("invalid outcome")
      
      if(outcome == "heart attack") col <- 11
      else if(outcome == "heart failure") col <- 17
      else if(outcome == "pneumonia") col <- 23
      
      
      data_state <- data[data[,7] == state, ] # Select rows of the given state
      
      #print(!is.na(data_state[,col]))
      data_state <- data_state[!(data_state[,col] == "Not Available"),] # remove the NA data
      
      order_rows <- order(as.numeric(data_state[,col]), data_state[,2])
      
      hos <- data_state[order_rows,2]
      
      if (num == "best") num = 1
      if (num == "worst")num = length(hos)
      #print(num)
      hos[num]
      
}