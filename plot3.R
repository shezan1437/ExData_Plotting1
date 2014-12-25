
## Inputing data into R
data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subsetting the data
install.packages("dplyr")
library(dplyr)  #loading package dplyr

data <- filter(data_all, (Date >= "2007-02-01" & Date <= "2007-02-02") )  #Subseting Data according to date of interest

date<-paste(as.Date(data$Date), data$Time)    # Making a variable called date by joining Date and Time but they are charecter

data$datetime=as.POSIXlt(date)       # Creating a collumn datetime by converting the string date to  "POSIXlt" "POSIXt" 
## Creating Plot 3
with(data, {
        plot(datetime,Sub_metering_1, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(datetime,Sub_metering_2,col='Red')
        lines(datetime,Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()