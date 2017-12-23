#load required libraries
# require(ggplot2)
# require(dplyr)

#Get data (switched off to save time while debugging)
# NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

#prepare the data
coalID <- SCC[grep("Coal",SCC$SCC.Level.Three),1]
ds <- subset(NEI,NEI$SCC %in% coalID)

ds$year <- factor(ds$year)

dsAgg <- aggregate(Emissions~year,ds,sum)

#plot and save the image
png("plot4.png")
p <- ggplot(dsAgg, aes(factor(year),Emissions)) +
      geom_col()+
      ggtitle("Coal emissions have strongly decreased in 2008")
print(p)
dev.off()
