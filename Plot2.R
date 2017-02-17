'assuming both libraries are downloaded'
library(lubridate)
library(sqldf)

sqldf1  = read.csv.sql('household_power_consumption.txt', sql = "select * from file where Date in ('1/2/2007','2/2/2007') ", eol = '\n',sep = ";")
sqldf()
sqldf2<-sqldf1
sqldf2$DT<-as.POSIXct(paste(sqldf2$Date, sqldf2$Time), format="%d/%m/%Y %H:%M:%S")

#Plot2
png("Plot2.png",width = 480,height = 480)
plot(sqldf2$DT,sqldf2$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()