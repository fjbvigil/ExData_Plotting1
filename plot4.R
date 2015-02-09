library(datasets)

household<-read.csv2("household_power_consumption.txt",dec=".",na.strings="?")   ## reading the data
aux<- household[,"Date"][]=="1/2/2007" | household[,"Date"][]=="2/2/2007"     ## selection of the days we want
dataOk <-    household[aux,]         ## extracting the data that we need

aux2 <- paste(dataOk$Date, dataOk$Time)  ## pasting date and time

dataOk$TimeDate <- as.POSIXct(strptime(aux2, "%d/%m/%Y %H:%M:%S"))  # managing the dates

    
    par(mfrow=c(2,2))

plot(dataOk[,"TimeDate"],dataOk[,"Global_active_power"],type='l',xlab = "",ylab = "Global Active Power")
plot(dataOk[,"TimeDate"],dataOk[,"Voltage"],type='l',xlab = "datetime",ylab = "Voltage")

plot(dataOk[,"TimeDate"],dataOk[,"Sub_metering_1"],type='l',xlab = "",
     ylab = "Energy Sub Metering")
lines(dataOk[,"TimeDate"],dataOk[,"Sub_metering_2"],type='l', col='red')
lines(dataOk[,"TimeDate"],dataOk[,"Sub_metering_3"],type='l', col='blue')

legend( "topright", pch=c("_","_","_"), col=c("black", "red", "blue"), bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
plot(dataOk[,"TimeDate"],dataOk[,"Global_reactive_power"],type='l',xlab = "datetime",ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file 
dev.off() ## Don't forget to close the PNG device!


    
    
    