library(datasets)

household<-read.csv2("household_power_consumption.txt",dec=".",na.strings="?")   ## reading the data
aux<- household[,"Date"][]=="1/2/2007" | household[,"Date"][]=="2/2/2007"     ## selection of the days we want
dataOk <-    household[aux,]         ## extracting the data that we need

hist(dataOk[,"Global_active_power"],col="red",xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")      ## drawing the histogram

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file 
dev.off() ## Don't forget to close the PNG device!

    
    