plot1 <- function(){

    # Function to generate histogram of Global Active Power from Electric power consumption data
    
    # Reading data
    # Subset dates while reading - optimized
    
    csvfile <- "household_power_consumption.txt"
    
    # install.packages("sqldf")
    library(sqldf)
    powerset_df <- read.csv.sql(csvfile, 
                                 sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"',
                                 header = TRUE, sep = ";")
    
    # Plotting data to screen
    hist(powerset_df$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

    # Plotting data to png file
    dev.copy(png, file = "plot1.png",width = 480, height = 480, units = "px")
    dev.off()
}