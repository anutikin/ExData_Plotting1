mydata<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
mydata<- mydata[mydata[, "Date"] %in% c("1/2/2007", "2/2/2007"), ]
dateTime<-strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M")
a1<-as.numeric(as.character(mydata$Sub_metering_1))
a2<-as.numeric(as.character(mydata$Sub_metering_2))
a3<-as.numeric(as.character(mydata$Sub_metering_3))
png(filename="Plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(dateTime, as.numeric(as.character(mydata$Global_active_power)), type="l", ylab="Global Active Power", xlab="")
plot(dateTime, as.numeric(as.character(mydata$Voltage)), type="l", ylab="Voltage", xlab="datatime")
plot(dateTime, a1, type="l", ylab="Energy sub metering", xlab="", ylim=c(0,max(a1,a2,a3)))
lines(dateTime, a2, col="red")
lines(dateTime, a3, col="blue")
legend('topright', c(colnames(mydata[7]),colnames(mydata[8]), colnames(mydata[9]) ), lty=1,  col=c('black', 'red', 'blue'))
plot(dateTime, as.numeric(as.character(mydata$Global_reactive_power)), type="l", ylab=colnames(mydata[4]), xlab="datatime")
dev.off()
