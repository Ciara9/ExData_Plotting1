setwd("C:/Users/ctil9/OneDrive/Documents/R/Exploratory Data Analysis/week 1/ExData_Plotting1")

household_power_consumption <- read.table('household_power_consumption.txt',
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

hh_poweruse_subset <- hh_poweruse_subset[complete.cases(hh_poweruse_subset),]


plot3 <- with(hh_poweruse_subset, { 
              plot(hh_poweruse_subset$dateTime,
                   hh_poweruse_subset$Sub_metering_1,
                   type = "l",
                   xlab = "",
                   ylab = "Energy sub metering",)
  lines(hh_poweruse_subset$dateTime,
        hh_poweruse_subset$Sub_metering_2,
        col = "Red")
  lines(hh_poweruse_subset$dateTime,
        hh_poweruse_subset$Sub_metering_3,
        col = "Blue")
})
legend("topright", col = c("black", "red", "blue"), 
       lwd = c(1,1,1),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, 'plot3.png', 480, 480)
dev.off()
