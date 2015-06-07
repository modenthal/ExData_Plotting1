## Coursera EDA Assignment 1
## Electric Power Consumption

Sys.getlocale(category = "LC_TIME")
Sys.setlocale("LC_TIME", "English")
setwd("C:/Users/Michael/Documents/Coursera/EDA")

## dataset - missing values are coded as ?
EPC2 <- read.table("household_power_consumption.txt",
                  sep=";",
                  na.strings=c('NA','?'), header = TRUE)

head(EPC2)
str(EPC2)

## convert the Date and Time variables to Date/Time classes in R 
## using the strptime() and as.Date()
EPC2$DateTime <- strptime(paste(EPC2$Date, EPC2$Time, sep = " "),
              "%d/%m/%Y %H:%M:%S")

## Subset: only dates 2007-02-01 and 2007-02-02
EPC_sub1 <- EPC2[as.Date(EPC2$DateTime) == "2007-02-01",]
EPC_sub2 <- EPC2[as.Date(EPC2$DateTime) == "2007-02-02",]
EPC_sub <- rbind(EPC_sub1, EPC_sub2)

## Expected no rows: 60m/h * 24h/d * 2d
dim(EPC_sub)
View(head(EPC_sub))
str(EPC_sub)

## For each plot: PNG file with a width of 480 pixels and a height of 480 pixels
## as plot1.png, plot2.png 

## Plot 2
png("Plot2.png", height = 480, width = 480)
plot(EPC_sub$DateTime, EPC_sub$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "") 
dev.off()
