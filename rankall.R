rankall <- function (outcome,num = "best") {
    
  l <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available") # converting "Not Available" strings to NA
  
  if (outcome == "heart attack") {x <- 11}
  else if (outcome == "heart failure") {x <- 17}
  else if (outcome == "pneumonia") {x <- 23}  
  else stop("invalid outcome") # checking the outcome
  
  k <- data.frame(l[[2]],l[[7]],l[[x]]) # creating a data frame with 3 columns
  
  names(k) <- c("Name","State","Rate")
  
  k <- k[order(k$State),]

  state <- as.character(unique(k$State)) # To get the unique list of states in alphabetical order
   
  k <- k[complete.cases(k),]
  
  k <- k[order(k$State,k$Rate,k$Name), ] # sorting the hospitals by State and Rate first then Name
  
  c <- 1
  
  if (num == "best" ) {num <- 1}
   
  result <- data.frame()
  
   for (j in state) # Checking for each unique state
   {
     b <- 1 # counter for rank of the hospital
     v <- NA   # dummy vector for hospital defaulted to NA
     for (i in 1:nrow(k)){ # For each unique state finding the nth hospital. If n is not applicable, hospital is NA
            
            
            if (j == k[i,2]) {k[i,4] <- b                               
                              if (b == num) {v <- as.character(k[i,1])}
                              else if ((b == sum(k$State == j)) & num == "worst") {v <- as.character(k[i,1])}
                              b <- b+1}   
                             }
     result[c,1] <- v
     result[c,2] <- j  
     c <- c+1
     colnames(result) <- c("hospital", "state")
   }
  
    return (result)
  
}