#load required libraries
# require(ggplot2)
# require(dplyr)

#Get data (switched off to save time while debugging)
# NEI <- readRDS("summarySCC_PM25.rds")
  
#Calculate mean value by each year (switched off to save time while debugging)
#sub <- subset(NEI,NEI$fips=="24510")
sub1 <- filter(NEI,fips=="24510") %>%
  group_by(type, year) %>%
  summarise(sum=sum(Emissions))

#sub1$year <- as.integer(sub1$year)
#build a plot and then save it
png("plot3.png")
p <- ggplot(sub1,aes(x = year, y = sum)) +
  geom_col() +
  facet_grid(. ~type) +
  ggtitle("Point emissions have increased")

print(p)
dev.off()

    
  