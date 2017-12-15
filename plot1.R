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

plot1 <- function(){
library(dplyr)
library(lubridate)
if (!file.exists("plot_data.RDS")) save_rDS_plot()
pwr <- readRDS("plot_data.RDS")
pwr <- mutate(pwr, Active_Pwr = as.numeric(Active_Pwr))
png("plot1.png", width = 480, height = 480)
hist(pwr$Active_Pwr, col="red", xlab="Global Active Power (kilowatts)",
     ylab="Frequency", ylim = c(0,1200), main="Global Active Power")
dev.off()
print("plot1 saved")
}

