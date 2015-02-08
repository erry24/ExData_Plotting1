# plot 3
# All files must be in working directory
# setwd("~/DataScience/Exploratory Data Analysis")
library(data.table)
library(dplyr)
library("lubridate", lib.loc="~/R/win-library/3.1")
# Read data and prepare
file <- 'household_power_consumption.txt'
my_data_frame <- read.csv(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
my_data_frame$DateTime <- as.POSIXct(paste(as.Date(my_data_frame$Date, format = "%d/%m/%Y"), my_data_frame$Time), format = "%Y-%m-%d %H:%M:%S")
my_data_frame$Date <- as.Date(my_data_frame$Date,format="%d/%m/%Y")
datesToUse <- my_data_frame[(my_data_frame$Date >= "2007-02-01" & my_data_frame$Date <= "2007-02-02"), ]
#
user_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")
png('plot3.png', height=480, width=480)
plot(datesToUse$DateTime, datesToUse$Sub_metering_1, type="l", col = 'black', main = " ", xlab=" " , ylab ='Energy sub metering')   # Put Sub_metering_1 column
lines(datesToUse$DateTime, datesToUse$Sub_metering_2, type="l", col="red")  # Put Sub_metering_2 column
lines(datesToUse$DateTime, datesToUse$Sub_metering_3, type="l", col="blue") # Put Sub_metering_3 column
legend("topright", cex=.9,
       c("Sub metering 1","Sub metering 2","Sub metering 3"),
       lty=c(1,1,1),
       col=c("black","red","blue"))
dev.off()
#restore language
Sys.setlocale("LC_TIME", user_lang)
