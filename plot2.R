library(datasets)

household<-read.csv2("household_power_consumption.txt",dec=".",na.strings="?")   ## reading the data
aux<- household[,"Date"][]=="1/2/2007" | household[,"Date"][]=="2/2/2007"     ## selection of the days we want
dataOk <-    household[aux,]         ## extracting the data that we need

aux2 <- paste(dataOk$Date, dataOk$Time)  ## pasting date and time

dataOk$TimeDate <- as.POSIXct(strptime(aux2, "%d/%m/%Y %H:%M:%S"))  # managing the dates

plot(dataOk[,"TimeDate"],dataOk[,"Global_active_power"],type='l',xlab = "",ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file 
dev.off() ## Don't forget to close the PNG device!

