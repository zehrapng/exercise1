library(dplyr)
library(sqldf)
library(lubridate)
selecteddata <- read.csv.sql("C:/Users/zehra/Desktop/Explanatory Data Analysis/household_power_consumption.txt", 
                             sql= "Select * from file where Date =='1/2/2007' OR Date =='2/2/2007'",
                             header = TRUE, sep = ";")

selecteddata <- mutate(selecteddata, DateTime = as.POSIXct(paste(Date, Time), format ="%d/%m/%Y %H:%M:%S"))

plot(Sub_metering_1 ~ DateTime, data = selecteddata, xlab = "", ylab = "Energy sub metering", 
     type = "n")

lines(Sub_metering_1 ~ DateTime, col="black", data = selecteddata, lwd=2)
lines(Sub_metering_2 ~ DateTime, col="red", data = selecteddata, lwd=2)
lines(Sub_metering_3 ~ DateTime, col="blue", data = selecteddata, lwd=2)

legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.75, text.width = strwidth(c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))[1]/0.8)

dev.copy(png, "plot3.png", width=480, height=480)
dev.off()


