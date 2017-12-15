# setwd("D:/git_repo/ExData_Plotting1")

DataPlot <- function() {
library(dplyr)
library(lubridate)
pwr <- tbl_df(read.table("D:/git_repo/household_power_consumption.txt",
        header = TRUE, sep=";",stringsAsFactors = FALSE, na.strings = "?",
        colClasses=c("character")))
titles <- c("Date", "Time", "active_pwr", "react_pwr", "Voltage", "Intensity",
            "Sub1","Sub2","Sub3")
colnames(pwr) = titles
pwr = mutate(pwr, Sub1=as.numeric(Sub1), Sub2=as.numeric(Sub2), Sub3=as.numeric(Sub3))
pwr = mutate(pwr, active_pwr=as.numeric(active_pwr), react_pwr=as.numeric(react_pwr))        
pwr = mutate(pwr, Voltage=as.numeric(Voltage), Intensity=as.numeric(Intensity)) 
pwr = mutate(pwr, Date= dmy(Date), Time=hms(Time))
pwr = filter(pwr, Date >= dmy("1/2/2007") & Date <= dmy("2/2/2007"))
pwr
}
