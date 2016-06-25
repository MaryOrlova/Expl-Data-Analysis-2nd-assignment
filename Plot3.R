#This code creates plot of total PM2.5 emission in the Baltimore city by source type (point, nonpoint, onroad, nonroad) 
#in time period 1999-2008 year.which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City
#Aim is to answer two questions:
#1. which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#To run this code there should be "Source_Classification_Code.rds" in working directory

library(data.table)
library(ggplot2)

#Reading file in R
NEI <- readRDS("summarySCC_PM25.rds")

#Subsetting data from the Baltimore City
bal<-subset(NEI, fips=="24510")

#Creating  png file
png(filename="Plot3.png", width=480, height=480,units="px", bg="white")

#calculating total emission by source type and year
btype<-aggregate(x=bal["Emissions"], by =list(Type=bal$type, Year=bal$year), FUN=sum)

#Plotting
g<-ggplot(data=btype,aes(y=Emissions, x=Year, color=Type))
g+geom_point(size=2)+geom_line(size=1,linetype=1)+
  labs(x="Year",y="Emission in Tones", title="PM2.5 Emission in Baltimore by type of source")+
  theme_bw(base_family="Times")

#closing graphic device
dev.off()

#remowing variables from environment
rm(NEI,btype,bal,g)