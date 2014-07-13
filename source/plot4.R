plot4 <- function(){
    ##Read the file between dates 1/2/2007 ans 2/2/2007
    dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
    
    ##Get the column heads
    colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
    par(mfrow = c(2, 2))
    
    ##Get the data for plot
    plotdata <- as.numeric(dat$Global_active_power)
    dateTime <- dateTime <- as.POSIXct(strptime(paste(dat$Date,dat$Time), format= "%d/%m/%Y %H:%M:%S"))
    
    ##PLOT1
    ##Plot the histgram with specifications
    plot(dateTime,dat$Global_active_power,type="l", xlab="", ylab="Global Active Power")
    
    ##PLOT2
    ##Plot the histgram with specifications
    plot(dateTime,dat$Voltage,type="l", xlab="", ylab="Voltage")
    
    ##PLOT3
    ##Plot the histgram with specifications
    with(dat, {
        plot(Sub_metering_1~dateTime, type="l",
             ylab="Global Active Power (kilowatts)")
        points(Sub_metering_2~dateTime,col='Red', type="l")
        points(Sub_metering_3~dateTime,col='Blue', type="l")
    })

    legend("topright", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty = "n",
           y.intersp=0.5,cex=0.5)
    
    ##PLOT4
    ##Plot the histgram with specifications
    plot(dateTime,dat$Global_reactive_power,type="l", xlab="", ylab="Global_reactive_power")
    
    ##Copying the plot to png file
    dev.copy(png,"plot4.png",height=480, width=480)
    dev.off()
}