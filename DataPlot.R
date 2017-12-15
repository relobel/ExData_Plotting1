# setwd("D:/git_repo/ExData_Plotting1")
# setwd("K:/Pastas em Comum\Coursera\Data Science 2017\04-Exploratory Data\Week 01\assignment week 01")

library(dplyr)

pwr <- tbl_df(read.table("D:/git_repo/household_power_consumption.txt",
        header = TRUE, sep=";",stringsAsFactors = FALSE,
        colClasses =c("character")))
