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

plot3 <- function(){
library(dplyr)
library(lubridate)
if (!file.exists("plot_data.RDS")) save_rDS_plot()
pwr <- readRDS("plot_data.RDS")
pwr <- mutate(pwr, Date_Time = dmy_hms(paste(Date,Time)))
pwr <- mutate(pwr, Sub1=as.numeric(Sub1), Sub2=as.numeric(Sub2),
              Sub3=as.numeric(Sub3))
png("plot3.png", width = 480, height = 480)
with(pwr, { 
        plot(Sub1~Date_Time, type="l", xlab="", ylab="Energy sub metering")
        lines(Sub2~Date_Time, col="red")
        lines(Sub3~Date_Time, col="blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
print("plot3 saved")
}

