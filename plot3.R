
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
#png(file = "plot3.png", width = 480, height = 480, units = "px")

plot(powerConsumption$Time, powerConsumption$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="", ylim = c(0, 40))
with(powerConsumption, lines(Time, as.numeric(as.character(Sub_metering_1))))
with(powerConsumption, lines(Time, as.numeric(as.character(Sub_metering_2)), col="red"))
with(powerConsumption, lines(Time, as.numeric(as.character(Sub_metering_3)), col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")

## Close graphics device
#dev.off()


