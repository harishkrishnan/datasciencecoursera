corr <- function(directory, threshold = 0) {
  df <- complete(directory)
  df <- subset(df,df$nobs>threshold)
  
  cans = numeric()
  corc = numeric(0)
  
  
  for (i in 1:nrow(df))
  {   
    
    my_file <- read.csv(paste(directory,"/",formatC(df[i,1],width = 3,flag="0"),".csv",sep = ""))
    
    corc <- cor(my_file$nitrate,my_file$sulfate, use = "complete.obs")
    
    cans <- c(cans,corc)
  }
  return(cans)
}