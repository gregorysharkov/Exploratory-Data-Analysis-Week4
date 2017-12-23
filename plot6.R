#load required libraries
# require(ggplot2)
# require(dplyr)

#Get data (switched off to save time while debugging)
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

#prepare the data
motorID <- SCC[grep("Motor",SCC$SCC.Level.Three),1]
ds <- subset(NEI,NEI$SCC %in% motorID)
ds <- subset(ds,fips=="24510"| fips=="06037")

ds$year <- factor(ds$year)
dsAgg <- aggregate(Emissions~year+fips,ds,sum)

png("Plot6.png")
p <- ggplot(dsAgg, aes(factor(year),Emissions)) +
  geom_col()+
  facet_grid(.~factor(fips,levels=c("24510","06037"), labels = c("Baltimore","LA")) ) +
  ggtitle("LA Motor emissions are much higher than Baltimore")

print(p)
dev.off()
# unlink("plot6.png")