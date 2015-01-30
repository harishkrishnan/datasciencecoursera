library(dplyr)
library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

m <- SCC[grepl("Coal",SCC$SCC.Level.Three),]

n <- m[grepl("Combustion",m$SCC.Level.One),]
n$SCC <- as.character(n$SCC)

t <- NEI[which(NEI$SCC %in% n$SCC),] 
s <- group_by(t, year)
v <- summarise(s, PM = sum(Emissions)) 
w <- qplot(year,PM, data = v, geom = c("point","smooth"))
print(w)

