fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile="raw.zip")
unzip("raw.zip")

a<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
a<-a[a[,1]=="1/2/2007"|a[,1]=="2/2/2007",]
a$Date<-as.Date(a$Date,"%d/%m/%Y")
a$FullDate<-paste(a$Date,a$Time)
a$FullDate<-strptime(a$FullDate, "%Y-%m-%d %H:%M:%S")

png("plot1.png")
hist(a$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()