# Reading data, assuming data is already downloaded, unzipped
# and put in the working directory.
d_all <- read.csv("household_power_consumption.txt", na.strings="?", header=T, sep=";")
# Only two days are examined.
d <- d_all[d_all$Date == "1/2/2007" | d_all$Date == "2/2/2007", ]
# Convert the Date + Time columns to Datetime values
d$datetime = strptime(do.call(paste, d[,c("Date", "Time")]), "%d/%m/%Y %H:%M:%S")

# Setup PNG-file (480x480)
png("plot2.png", width=480, height=480)

# line-plot Datetime vs Global Active Power, no x-label, set y-label
plot(d$datetime, d$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# write PNG-file
dev.off()

