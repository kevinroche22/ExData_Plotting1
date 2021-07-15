
################
# Load dataset #
################

powerConsumption <- read.table("household_power_consumption.txt",  sep = ";", header = TRUE) %>% 
        filter(Date == "1/2/2007" | Date == "2/2/2007") # Filter only on dates we need

#######################
# Data Transformation #
#######################

## Convert to proper formats
powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")
powerConsumption$Time <- strptime(powerConsumption$Time, format="%H:%M:%S")

powerConsumption[1:1440,"Time"] <- format(powerConsumption[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powerConsumption[1441:2880,"Time"] <- format(powerConsumption[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##################
# Construct Plot #
##################

## Set graphics device
#png("plot2.png", width=480, height=480, units = "px")

## Create Plot
plot(powerConsumption$Time,as.numeric(as.character(powerConsumption$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")

## Close Graphics Device
#dev.off()

