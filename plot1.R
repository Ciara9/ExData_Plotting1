setwd("C:/Users/ctil9/OneDrive/Documents/R/Exploratory Data Analysis/week 1/ExData_Plotting1")

household_power_consumption <- read.table('household_power_consumption.txt',
                                          header = TRUE,
                                          sep = ";")

hh_poweruse_subset <- household_power_consumption[household_power_consumption$Date == "1/2/2007" | 
                                                  household_power_consumption$Date == "2/2/2007",]


plot1 <- hist(as.numeric(hh_poweruse_subset$Global_active_power), 
             col = "red",
             xlab = "Global Active Power (kilowatts)",
             main = "Global Active Power")

dev.copy(png, 'plot1.png', 480, 480)
dev.off()
