library(dplyr)
library(sqldf)
library(lubridate)
selecteddata <- read.csv.sql("C:/Users/zehra/Desktop/Explanatory Data Analysis/household_power_consumption.txt", 
                             sql= "Select * from file where Date =='1/2/2007' OR Date =='2/2/2007'",
                             header = TRUE, sep = ";")

selecteddata <- mutate(selecteddata, DateTime = as.POSIXct(paste(Date, Time), format ="%d/%m/%Y %H:%M:%S"))

par(mfcol = c(2, 2), mar = c(5, 5, 1, 1), oma = c(0, 0, 2, 0))

#Graph11

plot(Global_active_power ~ DateTime, data = selecteddata, xlab = "", ylab = "Global Active Power (kilowatts)", 
     type = "n")

lines(Global_active_power ~ DateTime, col= "black", data = selecteddata)


#Graph21

plot(Sub_metering_1 ~ DateTime, data = selecteddata, xlab = "", ylab = "Energy sub metering", 
     type = "n")

lines(Sub_metering_1 ~ DateTime, col="black", data = selecteddata, lwd=1)
lines(Sub_metering_2 ~ DateTime, col="red", data = selecteddata, lwd=1)
lines(Sub_metering_3 ~ DateTime, col="blue", data = selecteddata, lwd=1)

legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.75, text.width = strwidth(c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))[1]/0.8)

#Graph12

plot(Voltage ~ DateTime, data = selecteddata, xlab = "datetime", ylab = "Voltage", type = "n")
lines(Voltage ~ DateTime, col= "black", data = selecteddata)

#Graph22

plot(Global_reactive_power ~ DateTime, data = selecteddata, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(Global_reactive_power ~ DateTime, col= "black", data = selecteddata)


dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()

