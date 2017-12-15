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

plot2 <- function(){
library(dplyr)
library(lubridate)
if (!file.exists("plot_data.RDS")) save_rDS_plot()
pwr <- readRDS("plot_data.RDS")
pwr <- mutate(pwr, Date_Time = dmy_hms(paste(Date,Time)))
pwr <- mutate(pwr, Active_Pwr = as.numeric(Active_Pwr))
pwr <- select(pwr, Date_Time, Active_Pwr)
png("plot2.png", width = 480, height = 480)
plot(pwr, xlab="", type="l", lty=1,
     ylab="Global Active Power (kilowatts)", col="black")
dev.off()
print("plot2 saved")
}

