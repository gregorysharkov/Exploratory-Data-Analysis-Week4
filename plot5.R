#load required libraries
# require(ggplot2)
# require(dplyr)

#Get data (switched off to save time while debugging)
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

#prepare the data
motorID <- SCC[grep("Motor",SCC$SCC.Level.Three),1]
ds <- subset(NEI,NEI$SCC %in% motorID)
ds <- subset(ds,fips=="24510")

ds$year <- factor(ds$year)
dsAgg <- aggregate(Emissions~year,ds,sum)

png("plot5.png")
p <- ggplot(dsAgg, aes(factor(year),Emissions)) +
  geom_col()+
  ggtitle("Motor emissions decreased in Baltimore")
print(p)
dev.off()