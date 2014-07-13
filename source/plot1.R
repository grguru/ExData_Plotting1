plot1 <- function(){
    ##Read the file between dates 1/2/2007 ans 2/2/2007
    dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
    
    ##Get the column heads
    colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
    
    ##Get the data for plot
    plotdata <- as.numeric(dat$Global_active_power)
    
    ##Plot the histgram with specifications
    hist(plotdata, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
    
    ##Copying the plot to png file
    dev.copy(png,"plot1.png",height=480, width=480)
    dev.off()
}