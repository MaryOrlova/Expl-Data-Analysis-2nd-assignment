#This code creates plot of total coal combustion-related sources changes across US from 1999–2008
#To run this code there should be "Source_Classification_Code.rds" in working directory

library(ggplot2)
library(data.table)

#Reading data in R
NEI <- readRDS("summarySCC_PM25.rds")
info <- readRDS("Source_Classification_Code.rds")

#Subsetting from Source clasification only part of data that contain Coal and Combustion
SCCinf <- subset(info, grepl("Comb", Short.Name) & grepl("Coal", Short.Name))

#Subsetting only data with right SCC code thet relates to coal and combustion
Coal <- subset(NEI, NEI$SCC %in% SCCinf$SCC)

#Calcualting total Coal-combustion related emission by source type
CoalSource<-aggregate(x=Coal["Emissions"], by=list(Type=Coal$type,Year=Coal$year),sum)

#Calcualting total Coal-combustion related emission by year
CoalTotal<-aggregate(x=Coal["Emissions"],by=list(Year=Coal$year),sum)

#Creating  png file
png(filename="Plot4.png", width=480, height=480,units="px", bg="white")

#Creting plot
pl<-ggplot()
pl+geom_line(aes(x=CoalSource$Year, y= CoalSource$Emissions, color=Type), CoalSource)+
  geom_line(aes( y=CoalTotal$Emissions, x=CoalTotal$Year, colour="TOTAL"),CoalTotal)+
  labs(x="Year",y="Emission in Tones", title="Coal Combustion-Related Sources Changes Across US")

#closing graphic device
dev.off()

#remowing variables from environment
rm(NEI,info,pl,CoalSource, CoalTotal,Coal,SCCinf)