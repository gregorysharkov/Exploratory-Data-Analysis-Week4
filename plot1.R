#Get data (switched off to save time while debugging)
NEI <- readRDS("summarySCC_PM25.rds")

#Calculate mean value by each year (switched off to save time while debugging)
ag <- aggregate.data.frame(NEI$Emissions,list(NEI$year),mean)

#build a plot and then save it
png("plot1.png", width=480, height=480)
plot(ag,
     main = "Emissions have decreased from 1999 to 2008",
     xlab = "Year",
     ylab = "Emissions"
     )
dev.off()
