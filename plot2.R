dir.create("./ExData_Plotting1")
data <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(data, destfile = "./ExData_Plotting1.zip")
unzip("./ExData_Plotting1.zip", exdir = "./ExData_Plotting1")


household_power_consumption <- read.table('./ExData_Plotting1/household_power_consumption.txt',
                                          header = TRUE,
                                          sep = ";")

hh_poweruse_subset <- household_power_consumption[household_power_consumption$Date == "1/2/2007" | 
                                                    household_power_consumption$Date == "2/2/2007",]

hh_poweruse_subset$Date <- as.Date(hh_poweruse_subset$Date, "%d/%m/%Y")

if(hh_poweruse_subset$Date == "1/2/2007") hh_poweruse_subset$day = "Thursday" 

dateTime <- paste(hh_poweruse_subset$Date, hh_poweruse_subset$Time)
dateTime <- setNames(dateTime, "DateTime")

hh_poweruse_subset <- cbind(dateTime, hh_poweruse_subset)

hh_poweruse_subset$dateTime <- as.POSIXct(dateTime)

plot2 <- plot(hh_poweruse_subset$dateTime, 
     hh_poweruse_subset$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts")

dev.copy(png, 'plot2.png', 480, 480)
dev.off()
