# Reading data, assuming data is already downloaded, unzipped
# and put in the working directory.
d_all <- read.csv("household_power_consumption.txt", na.strings="?", header=T, sep=";")
# Only two days are examined.
d <- d_all[d_all$Date == "1/2/2007" | d_all$Date == "2/2/2007", ]

# Setup PNG-file (480x480)
png("plot1.png", width=480, height=480)

# Hist in red, set x-label and title
hist(d$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")

# write to file.
dev.off()

