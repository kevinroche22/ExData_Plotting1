
################
# Load dataset #
################

powerConsumption <- read.table("household_power_consumption.txt",  sep = ";", header = TRUE) %>% 
        filter(Date == "1/2/2007" | Date == "2/2/2007") # Filter only on dates we need

##################
# Construct Plot #
##################

## Set graphics device
#png(file = "plot1.png", width = 480, height = 480, units = "px")

## Plot
hist(as.numeric(as.character(powerConsumption$Global_active_power)),
     col="red",
     main="Global Active Power",
     xlab="Global Active Power(kilowatts)")

## Close graphics device
#dev.off()


