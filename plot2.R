plot2 <- function(){
    
    # Function to generate plot of Global Active Power x Date from Electric power consumption data
    
    # Reading data
    # Subset dates while reading - optimized
    
    csvfile <- "household_power_consumption.txt"
    
    # install.packages("sqldf")
    library(sqldf)
    powerset_df <- read.csv.sql(csvfile, 
                                sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"',
                                header = TRUE, sep = ";")
    
    # Formating date and time
    powerset_df$Timestamp <- strptime(paste(powerset_df$Date, powerset_df$Time), "%d/%m/%Y %H:%M:%S")
    
    # Plotting data to screen
    plot(powerset_df$Timestamp, powerset_df$Global_active_power, type="l", 
         xlab = "", ylab = "Global Active Power (kilowatts)")
    
    # Plotting data to png file
    dev.copy(png, file = "plot2.png",width = 480, height = 480, units = "px")
    dev.off()
}