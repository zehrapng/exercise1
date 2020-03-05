library(dplyr)
library(sqldf)
library(lubridate)
selecteddata <- read.csv.sql("C:/Users/zehra/Desktop/Explanatory Data Analysis/household_power_consumption.txt", 
                             sql= "Select * from file where Date =='1/2/2007' OR Date =='2/2/2007'",
                             header = TRUE, sep = ";")

selecteddata <- mutate(selecteddata, DateTime = as.POSIXct(paste(Date, Time), format ="%d/%m/%Y %H:%M:%S"))

hist(selecteddata$Global_active_power, col = "red",
       xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

rug(selecteddata$Global_active_power)
abline(v= median(selecteddata$Global_active_power), col="yellow", lwd=4)
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()

  
