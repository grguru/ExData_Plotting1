plot3 <- function(){
    ##Read the file between dates 1/2/2007 ans 2/2/2007
    dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
    
    ##Get the column heads
    colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
    plotdata<- cbind(dat,newdatetime=as.POSIXct(strptime(paste(dat$Date,dat$Time), format= "%d/%m/%Y %H:%M:%S")))

    ##Plot the histgram with specifications
    with(plotdata, {
        plot(Sub_metering_1~newdatetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~newdatetime,col='Red')
        lines(Sub_metering_3~newdatetime,col='Blue')
    })
    
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ##Copying the plot to png file
    dev.copy(png,"plot3.png",height=480, width=480)
    dev.off()
}