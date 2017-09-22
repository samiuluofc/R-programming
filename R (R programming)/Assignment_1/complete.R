complete <- function(directory, id = 1:332)
{
      file_path <- paste(directory,"/",formatC(id, width=3, flag="0"),".csv",sep = "")

      ## Create a data frame
      x<- data.frame(id = id, nobs = rep(0,length(id)))
      
      for (i in 1:length(id))
      {
            data <- read.csv(file_path[i])
            
            ## Select the target columns
            col1 <- data[,'Date'] 
            col2 <- data[,'sulfate'] 
            col3 <- data[,'nitrate'] 
            
            
            ## select all valid (No NA) observations
            bin <- !is.na(col1) & !is.na(col2) & !is.na(col3)
            
            ## Update the data frame
            x[i,'nobs'] <- sum(bin)

      }
      x
}