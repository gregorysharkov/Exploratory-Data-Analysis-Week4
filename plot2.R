#Get data (switched off to save time while debugging)
NEI <- readRDS("summarySCC_PM25.rds")

#Calculate mean value by each year (switched off to save time while debugging)
sub <- subset(NEI,NEI$fips=="24510")
ag <- aggregate.data.frame(sub$Emissions,list(sub$year),mean)

#build a plot and then save it
png("plot2.png", width=480, height=480)
plot(ag,
     main = "Emissions in Baltimore decreased",
     xlab = "Year",
     ylab = "Emissions"
)
dev.off()