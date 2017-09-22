best <- function(state, outcome)
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
      
      #print(data_state[,col])
      
      
      min_rate <- min(as.numeric(data_state[,col]))
      #print(min_rate)
      
      #data_state[,c(2,col)]
      hos <- data_state[as.numeric(data_state[,col]) == min_rate,2]
      hos <- sort(hos)
      print(hos[1])
      
      #sort_res <- data_state[order(data_state[,col]),]
      #sort_res[,col]
      
}