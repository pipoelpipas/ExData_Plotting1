data <- read.table('household_power_consumption.txt',
                   sep = ';', 
                   header=FALSE,
                   skip = grep('1/2/2007',
                               readLines('household_power_consumption.txt')
                               
                   ),
                   nrows = 2880
                   
)
names <- c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')
colnames(data) <- names

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png", width=480, height=480)

par(mfcol = c(2,2) )

with(
    data,
    plot(datetime,
         Global_active_power,
         type="l", 
         xlab="", 
         ylab="Global Active Power (kilowatts)"
         )
    )


subMetering <- cbind(data[,7:9])


plot(datetime, subMetering[,1], type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering[,2], type="l", col="red")
lines(datetime, subMetering[,3], type="l", col="blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5,
       col=c("black", "red", "blue"),
       bty = 'n')


plot(datetime,
     data$Voltage,
     type = 'l',
     ylab = 'Voltage'
     )

plot(datetime,
     data$Global_reactive_power,
     type = 'l',
     ylab = "Global_reactive_power"
)

dev.off()
