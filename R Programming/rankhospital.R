rankhospital <- function(state,outcome,num = "best"){
  
    
  l <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available") # converting "Not Available" strings to NA
  
  if (outcome == "heart attack") {x <- 11}
  else if (outcome == "heart failure") {x <- 17}
  else if (outcome == "pneumonia") {x <- 23}  
  else stop("invalid outcome") # checking the outcome
  
  m <- data.frame(l[[2]],l[[7]],l[[x]]) # creating a data frame with 3 columns
  k <- m[complete.cases(m),]
  names(k) <- c("Name","State","Rate")
    
  if(state %in% k$State) # "%in%" R function to check if a specific value is in a column
  
  { 
    k <- subset(k,State == state)
    k <- k[order(k$Rate,k$Name), ] # sorting the hospitals by Rate first then Name
        
    if (num == "best" ) {num <- 1}
    else if (num == "worst") {num <- nrow(k)}
        
    print (as.character(k[num,1])) } # prints as a factor. Coercing it to print as character
  
    else stop("invalid state") # checking the state
}
