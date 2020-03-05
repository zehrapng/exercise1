library(dplyr)
library(sqldf)
library(lubridate)
selecteddata <- read.csv.sql("C:/Users/zehra/Desktop/Explanatory Data Analysis/household_power_consumption.txt", 
                             sql= "Select * from file where Date =='1/2/2007' OR Date =='2/2/2007'",
                             header = TRUE, sep = ";")

selecteddata <- mutate(selecteddata, DateTime = as.POSIXct(paste(Date, Time), format ="%d/%m/%Y %H:%M:%S"))

plot(Global_active_power ~ DateTime, data = selecteddata, xlab = "", ylab = "Global Active Power (kilowatts)", 
     type = "n")

lines(Global_active_power ~ DateTime, data = selecteddata)
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()
