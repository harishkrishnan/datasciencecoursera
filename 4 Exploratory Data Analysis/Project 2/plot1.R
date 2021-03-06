library(dplyr)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

s <- group_by(NEI,year) 
m <- summarise(s,PM = sum(Emissions)) 

plot(m$year,m$PM, type = "b", xlab = "year", ylab = "Emissions", col = "red", main = "Emissions Trend")
                     
