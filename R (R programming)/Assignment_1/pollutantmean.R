pollutantmean <- function(directory, pollutant, id = 1:332)
{
      file_path <- paste(directory,"/",formatC(id, width=3, flag="0"),".csv",sep = "")

      no_of_data <- 0
      add <- 0
      
      for (i in 1:length(id))
      {
            data <- read.csv(file_path[i])
            
            ## Select the target column
            col <- data[,pollutant] 
            
            ## Remove the NA rows
            valid_data <- col[!is.na(col)]
            
            add <- add + sum(valid_data)
            no_of_data <- no_of_data + length(valid_data) 
      }
      ## Calculating mean
      round(add/no_of_data, digits=3)
      
}