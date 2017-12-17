#load required libraries
library(ggplot2)
library(dplyr)

#Get data (switched off to save time while debugging)
#NEI <- readRDS("summarySCC_PM25.rds")

#Calculate mean value by each year (switched off to save time while debugging)
#sub <- subset(NEI,NEI$fips=="24510")
sub1 <- filter(NEI,fips=="24510") %>%
  group_by(type, year) %>%
  summarise(mean=mean(Emissions))

#sub1$year <- as.integer(sub1$year)
#build a plot and then save it
p <- ggplot(sub1,aes(x = year, y = mean)) +
  geom_point() +
  stat_smooth() +
  facet_grid(. ~type) +
  ggtitle("Decrease in all types")
ggsave("plot3.png")
unlink("plot.png")