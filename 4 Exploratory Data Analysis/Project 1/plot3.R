library(dplyr)
library(lubridate)

l <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

m <- filter(l,Date =='1/2/2007' | Date == '2/2/2007')

m$DateTime <- dmy(m$Date) + hms(m$Time)

m$DateTime <- as.POSIXlt(m$DateTime)

png(filename='plot3.png',width=480,height=480,units='px')

plot(m$DateTime,m$Sub_metering_1
     ,ylab='Energy Sub metering', xlab='', type='n')



lines(m$DateTime,m$Sub_metering_1, type = "l", col = "black")
lines(m$DateTime,m$Sub_metering_2, type = "l", col = "red")
lines(m$DateTime,m$Sub_metering_3, type = "l", col = "blue")

legend('topright', colnames(m)[7:9] , 
       lty=1, col=c('black', 'red', 'blue'), bty='o', cex=.75)
      

x <-dev.off()