pollutantmean <- function(directory, pollutant, id = 1:332) {

  c <- as.numeric()
  
  for (i in id)
  {
     file <- read.csv(paste(directory,"/",formatC(i,width = 3,flag="0"),".csv",sep = ""))
     c <- c(c,file[[pollutant]])
     
  }
  return(mean(c,na.rm = TRUE))
  
}