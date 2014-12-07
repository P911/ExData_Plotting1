# Reading data, assuming data is already downloaded, unzipped
# and put in the working directory.
d_all <- read.csv("household_power_consumption.txt", na.strings="?", header=T, sep=";")
# Only two days are examined.
d <- d_all[d_all$Date == "1/2/2007" | d_all$Date == "2/2/2007", ]
# Convert the Date + Time columns to Datetime values
d$datetime = strptime(do.call(paste, d[,c("Date", "Time")]), "%d/%m/%Y %H:%M:%S")

# Setup PNG-file (480x480)
png("plot3.png", width=480, height=480)
# Prepare plot: no-draw plot, use Sub_metering_1 to initialize the grid,
# because the values are the largest there (and because the plot
# on the assignment page looks like it has been made like this)
plot(d$datetime, d$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
# line-plot Datentime vs. Sub-Metering-1
points(d$datetime, d$Sub_metering_1, type="l")
# line-plot Datentime vs. Sub-Metering-2, in red
points(d$datetime, d$Sub_metering_2, type="l", col="red")
# line-plot Datentime vs. Sub-Metering-3, in blue
points(d$datetime, d$Sub_metering_3, type="l", col="blue")
# add a legend, use the same colors as for the lines, thereby using lines as symbols
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
# write to file
dev.off()

