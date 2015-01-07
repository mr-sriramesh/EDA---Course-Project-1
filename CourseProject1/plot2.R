install.packages("data.table")
library(data.table)
train <- fread("D:\\Courses\\Exploratory Data Analysis\\CourseProject1\\household_power_consumption.txt",sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
train<-as.data.frame(train)
train$Date <- as.Date(train$Date,"%d/%m/%Y")
train_trim <- subset(train,Date == "2007-02-01" | Date == "2007-02-02")

train_trim$DateTime <- paste(train_trim$Date, train_trim$Time)
train_trim$DateTime <- strptime(train_trim$DateTime, format = "%Y-%m-%d %H:%M:%S")
png(file="plot2.png")
plot(train_trim$DateTime,train_trim$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")


dev.off()