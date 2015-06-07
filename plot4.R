## Coursera EDA Assignment 1
## Electric Power Consumption

## Set system time to english to make sure days are shown accordingly in plots
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

## Plot 4
png("Plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))
## Reuse Plot 2
plot(EPC_sub$DateTime, EPC_sub$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "") 

## New 1
plot(EPC_sub$DateTime, EPC_sub$Voltage, type = "l", 
     ylab = "Voltage", xlab = "DateTime",
     col = "black") 

## Reuse Plot 3
plot(EPC_sub$DateTime, EPC_sub$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "",
     col = "black") 
lines(EPC_sub$DateTime, EPC_sub$Sub_metering_2, col = "red")
lines(EPC_sub$DateTime, EPC_sub$Sub_metering_3, col = "blue")
legend("topright", pch = 1, cex = 0.7, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## New 2
plot(EPC_sub$DateTime, EPC_sub$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power", xlab = "DateTime",
     col = "black") 
dev.off()
