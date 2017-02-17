#assuming both libraries are downloaded'
#install.packages("lubridate","sqldf")
library(lubridate)
library(sqldf)
sqldf1  = read.csv.sql('household_power_consumption.txt', sql = "select * from file where Date in ('1/2/2007','2/2/2007') ", eol = '\n',sep = ";")
sqldf2<-sqldf1
sqldf2$DT<-as.POSIXct(paste(sqldf2$Date, sqldf2$Time), format="%d/%m/%Y %H:%M:%S")
sqldf() 'to close sql connection
#Plot 1
png("Plot1.png",width = 480,height = 480)
hist(sqldf2$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = 'red')
dev.off()