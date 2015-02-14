library(dplyr)
library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

s <- group_by(filter(NEI,fips == "24510"),type,year)

m <- summarise(s,PM = sum(Emissions)) 

p <- qplot(year, PM, data=m,facets=.~type,geom = c("point","smooth"))

print(p)