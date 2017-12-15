# setwd("D:/git_repo/ExData_Plotting1")

save_rDS_plot <- function() {
pwr <- tbl_df(read.table("D:/git_repo/household_power_consumption.txt",
        header = TRUE, sep=";",stringsAsFactors = FALSE, na.strings = "?",
        colClasses=c("character")))
titles <- c("Date", "Time", "Active_Pwr", "React_Pwr", "Voltage", "Intensity",
            "Sub1","Sub2","Sub3")
colnames(pwr) = titles
pwr <- filter(pwr, (Date == "1/2/2007") | (Date == "2/2/2007"))
saveRDS(pwr, file="plot_data.RDS")
}

plot4 <- function(){
library(dplyr)
library(lubridate)
if (!file.exists("plot_data.RDS")) save_rDS_plot()
pwr <- readRDS("plot_data.RDS")
pwr <- mutate(pwr, Date_Time = dmy_hms(paste(Date,Time)))
pwr <- mutate(pwr, Sub1=as.numeric(Sub1), Sub2=as.numeric(Sub2),
              Sub3=as.numeric(Sub3), Voltage=as.numeric(Voltage),
              React_Pwr=as.numeric(React_Pwr), 
              Active_Pwr=as.numeric(Active_Pwr))
png("plot4.png", width = 480, height = 480)
#par(mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
par(mfcol = c(2, 2))

with(pwr, { 
        plot(Active_Pwr~Date_Time, xlab="", type="l", lty=1,
        ylab="Global Active Power", col="black")

        plot(Sub1~Date_Time, type="l", xlab="", ylab="Energy sub metering")
        lines(Sub2~Date_Time, col="red")
        lines(Sub3~Date_Time, col="blue")
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(Voltage~Date_Time, type="l", lty=1,
             ylab="Voltage", xlab="datetime", col="black")
        
        plot(React_Pwr~Date_Time, type="l", lty=1,
             ylab="Global_reactive_power", xlab="datetime", col="black")
})

dev.off()
print("plot4 saved")
}

