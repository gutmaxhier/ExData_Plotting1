fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile="raw.zip")
unzip("raw.zip")

a<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
a<-a[a[,1]=="1/2/2007"|a[,1]=="2/2/2007",]
a$Date<-as.Date(a$Date,"%d/%m/%Y")
a$FullDate<-paste(a$Date,a$Time)
a$FullDate<-strptime(a$FullDate, "%Y-%m-%d %H:%M:%S")

png("plot4.png")
par(mfrow=c(2,2),lwd=0.1)
plot(a$FullDate,a$Global_active_power, type="l",xlab="",
     ylab="Global Active Power")
plot(a$FullDate,a$Voltage, type="l",
     ylab="Voltage", xlab="datetime")
plot(a$FullDate, a$Sub_metering_1, type="n",xlab="", 
     ylab="Energy sub metering")
lines(a$FullDate, a$Sub_metering_1)
lines(a$FullDate, a$Sub_metering_2, col="red")
lines(a$FullDate, a$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1)
plot(a$FullDate,a$Global_reactive_power, type="l",
     ylab="Global_reactive_power",xlab="datetime")
dev.off()