# Reading data, assuming data is already downloaded, unzipped
# and put in the working directory.
d_all <- read.csv("household_power_consumption.txt", na.strings="?", header=T, sep=";")
# Only two days are examined.
d <- d_all[d_all$Date == "1/2/2007" | d_all$Date == "2/2/2007", ]
# Convert the Date + Time columns to Datetime values
d$datetime = strptime(do.call(paste, d[,c("Date", "Time")]), "%d/%m/%Y %H:%M:%S")

# Write to PNG-file (480x480)
png("plot4.png", width=480, height=480)

# Plot with 4 sub-plots
par(mfrow=c(2,2))

# Topleft plot: Datetime vs Global Active Power, line-Plot, no X-Label
plot(d$datetime, d$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Topright plot: Datetime vs Voltage, line-plot
with(d, plot(datetime, Voltage, type="l"))

# B-left: Plot 3 (see plot3.R), but without the box for the label
plot(d$datetime, d$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
points(d$datetime, d$Sub_metering_1, type="l")
points(d$datetime, d$Sub_metering_2, type="l", col="red")
points(d$datetime, d$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")

# B-right: Datetime vs Global Reactive_power, line-plot
with(d, plot(datetime, Global_reactive_power, type="l"))

# write PNG-file
dev.off()
