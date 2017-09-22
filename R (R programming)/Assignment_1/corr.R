corr <- function(directory, threshold = 0)
{
      num_obs <- complete("specdata",1:332)
      
      ## Select the ids where nobs is > threshold
      id <- num_obs[num_obs[,'nobs'] > threshold, 'id']
      
      if (length(id) != 0)
      {
            res <- rep(0,length(id))
      }
      else
      {
            res <- vector(mode="numeric", length=0)
            return(res)
      }
      
      
      file_path <- paste(directory,"/",formatC(id, width=3, flag="0"),".csv",sep = "")
  
      for (i in 1:length(id))
      {
            data <- read.csv(file_path[i])
            
            ## Select the target columns
            col1 <- data[,'Date'] 
            col2 <- data[,'sulfate'] 
            col3 <- data[,'nitrate']
            
            ## select all valid (No NA) observations
            bin <- !is.na(col1) & !is.na(col2) & !is.na(col3)
          
            res[i] <- cor(data[bin,2],data[bin,3])
            
            
      }
      return(res)
}