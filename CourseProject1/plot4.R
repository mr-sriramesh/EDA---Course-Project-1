install.packages("data.table")
library(data.table)
train <- fread("D:\\Courses\\Exploratory Data Analysis\\CourseProject1\\household_power_consumption.txt",sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
train<-as.data.frame(train)
train$Date <- as.Date(train$Date,"%d/%m/%Y")
train_trim <- subset(train,Date == "2007-02-01" | Date == "2007-02-02")

train_trim$DateTime <- paste(train_trim$Date, train_trim$Time)
train_trim$DateTime <- strptime(train_trim$DateTime, format = "%Y-%m-%d %H:%M:%S")
png(file="plot4.png")

par(mfrow = c(2,2), mar = c(5,4,2,1))
#plotting 1,1
plot(train_trim$DateTime,train_trim$Global_active_power,type="l",ylab="Global Active Power",xlab="")

#plotting 1,2
plot(train_trim$DateTime,train_trim$Voltage,type="l",ylab="Voltage",xlab="datetime")

#plotting 2,1
with(train_trim,plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black"))
lines(train_trim$DateTime,train_trim$Sub_metering_2,col="red")
lines(train_trim$DateTime,train_trim$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       ,lty=c(1,1,1),lwd=c(2.5,2.5,2.5),
       col=c("black","red","blue"),cex=0.9,bg = "transparent",bty = "n", y.intersp=0.9,xjust=0,yjust=0)

#plotting 2,2
plot(train_trim$DateTime,train_trim$Global_reactive_power,type="l",ylab="Global_rective_power",xlab="datetime")

dev.off()