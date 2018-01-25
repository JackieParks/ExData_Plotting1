## This file produces a scatterplot for the three sub metering sets of data in kilograms of the 
## household power consumption data for the dates 2007-02-01 and 2007-02-02.
## This data comes from the UC Irvine Machine Learning Repository, the specific files is
## Electric power consumption [20Mb]
## Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
## Descriptions of the 9 variables in the dataset are taken from the UCI web site:

## Date: Date in format dd/mm/yyyy
## Time: time in format hh:mm:ss
## Global_active_power: household global minute-averaged active power (in kilowatt)
## Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
## Voltage: minute-averaged voltage (in volt)
## Global_intensity: household global minute-averaged current intensity (in ampere)
## Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
## Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
## Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

## Step 1 was to download and unzip the file locally which I did using windows functionality
## Next I read the file with:
hpc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
## Get things in the format I need

hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
hpc$Global_active_power<-as.numeric(hpc$Global_active_power)

## Now I selected the dates I am interested in so I can work with a much smaller file

shpc<-subset(hpc, hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02")

## work with time/date format
shpc$DateTime <- paste(shpc$Date, shpc$Time) ## Put together the date and time columns

shpc$DateTime<-strptime(shpc$DateTime,format="%Y-%m-%d %H:%M:%S" )

## set output device
png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12,bg = "white")


## plot - so far I can do them one at a time
plot(shpc$DateTime, shpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(shpc$DateTime, shpc$Sub_metering_2, type = "l", col="red")
points(shpc$DateTime, shpc$Sub_metering_3, type = "l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"),legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ))

dev.off()


