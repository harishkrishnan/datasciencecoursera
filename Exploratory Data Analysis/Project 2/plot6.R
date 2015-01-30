library(dplyr)
library(ggplot2)

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

SCCMotorVehicle <- SCC[grep("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE),]
NEIMotorVehicle <- NEI[NEI$SCC %in% as.character(SCCMotorVehicle$SCC),]

NEIMotorVehicle <- filter(NEIMotorVehicle,fips == "24510"|fips == "06037")
NEIMotorVehicle <- group_by(NEIMotorVehicle,year,fips)
NEIMotorVehicle <- summarise(NEIMotorVehicle, PM = sum(Emissions))

w <- qplot(year,PM, data = NEIMotorVehicle, geom = c("point","smooth"), facets = .~fips)

print (w)
