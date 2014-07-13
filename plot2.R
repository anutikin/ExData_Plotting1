mydata<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
mydata<- mydata[mydata[, "Date"] %in% c("1/2/2007", "2/2/2007"), ]
dateTime<-strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M")
png(filename="Plot2.png", width=480, height=480)
plot(dateTime, as.numeric(as.character(mydata$Global_active_power)), type="l", ylab="Global Active Power", xlab="")
dev.off()
