mydata<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
mydata<- mydata[mydata[, "Date"] %in% c("1/2/2007", "2/2/2007"), ]
x<-mydata$Global_active_power
x<-as.numeric(as.character(x))
png(filename="Plot1.png", width=480, height=480)
hist(x, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
