# plot 1
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
png('plot1.png', height=480, width=480)
hist(as.numeric(datesToUse$Global_active_power), col="red", main = "Global Active Power", xlab ='Global Active Power (kilowatts)')
dev.off()
#restore language
Sys.setlocale("LC_TIME", user_lang)
