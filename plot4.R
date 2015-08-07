plot4 <- function(){
    
    # Function to generate plots from Electric power consumption data
    
    # Reading data
    # Subset dates while reading - optimized
    
    csvfile <- "household_power_consumption.txt"
    
    # install.packages("sqldf")
    #library(sqldf)
    powerset_df <- read.csv.sql(csvfile, 
                                sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"',
                                header = TRUE, sep = ";")
    
    # Formating date and time
    powerset_df$Timestamp <- strptime(paste(powerset_df$Date, powerset_df$Time), "%d/%m/%Y %H:%M:%S")
    
    # Plotting data to screen
    par(mfrow = c(2,2), cex = 0.6)
    
    # Plot(1, 1)
    plot(powerset_df$Timestamp, powerset_df$Global_active_power, type="l", 
         xlab = "", ylab = "Global Active Power")
    
    # Plot(1, 2)
    plot(powerset_df$Timestamp, powerset_df$Voltage, type="l", 
         xlab = "datetime", ylab = "Voltage")
    
    # Plot(2, 1)
    plot(powerset_df$Timestamp, powerset_df$Sub_metering_1, type="l", 
         ylim=range(c(powerset_df$Sub_metering_1, powerset_df$Sub_metering_2, powerset_df$Sub_metering_3)), 
         col = "black", xlab = "", ylab = "Energy sub metering")
    par(new=TRUE)
    plot(powerset_df$Timestamp, powerset_df$Sub_metering_2, type="l", 
         axes = FALSE,
         ylim=range(c(powerset_df$Sub_metering_1, powerset_df$Sub_metering_2, powerset_df$Sub_metering_3)),
         col = "red", xlab = "", ylab = "")
    par(new=TRUE)
    plot(powerset_df$Timestamp, powerset_df$Sub_metering_3, type="l", 
         axes = FALSE,
         ylim=range(c(powerset_df$Sub_metering_1, powerset_df$Sub_metering_2, powerset_df$Sub_metering_3)),
         col = "blue", xlab = "", ylab = "")
    legend("topright", col = c("black", "red", "blue"),
           bty = "n", lty = c(1, 1, 1), lwd = c(1.5, 1.5, 1.5), cex = 0.8,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    # Plot(2, 2)
    plot(powerset_df$Timestamp, powerset_df$Global_reactive_power, type="l", 
         xlab = "datetime", ylab = "Global_reactive_power")
    
    # Plotting data to png file
    dev.copy(png, file = "plot4.png",width = 480, height = 480, units = "px")
    dev.off()
}