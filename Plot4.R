#assuming both libraries are downloaded'
library(lubridate)
library(sqldf)

sqldf1  = read.csv.sql('household_power_consumption.txt', sql = "select * from file where Date in ('1/2/2007','2/2/2007') ", eol = '\n',sep = ";")
sqldf() #to close sql connection

sqldf2<-sqldf1
sqldf2$DT<-as.POSIXct(paste(sqldf2$Date, sqldf2$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 4
#png("Plot4.png",width = 480,height = 480)
par(mfrow=(c(2,2)))
plot(sqldf2$DT,sqldf2$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")
plot(sqldf2$DT,sqldf2$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")

plot(sqldf2$DT, sqldf2$Sub_metering_1, type = "l",xlab = "",ylab = "Energy sub metering")
points(sqldf2$DT, sqldf2$Sub_metering_2, type = "l",col="red")
points(sqldf2$DT, sqldf2$Sub_metering_3, type = "l",col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c('black','red','blue'),cex=0.4,pt.cex=1,bty="n")


plot(sqldf2$DT,sqldf2$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
#dev.off()