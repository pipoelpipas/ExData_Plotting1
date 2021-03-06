
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
png("plot1.png", width=480, height=480)
with(data, 
     hist(Global_active_power,
          col = 'red',
          main = 'Global Active Power',
          xlab = 'Global Active Power (kilowatts)')
     )
dev.off()

