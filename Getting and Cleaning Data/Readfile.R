if(!file.exists("data")) {dir.create("data")}
fileurl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileurl,destfile = "./data/cameras.csv") #Coursera suggests using "curl" method but not needed for windows.
list.files("data")
cameradata <- read.csv("./data/cameras.csv")
head(cameradata)