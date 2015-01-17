complete <- function(directory, id = 1:332){
  
  c <- data.frame("id"=as.numeric(), "nobs" = as.numeric())
  
  for (i in id)
  {
    file <- read.csv(paste(directory,"/",formatC(i,width = 3,flag="0"),".csv",sep = ""))
    c <- rbind(c, c(i, sum(complete.cases(file))))
    
  }
  
  colnames(c) <- c("id","nobs")
  
  return (c)
}