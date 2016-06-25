#This code creates plot that shows changes in PM2.5 emission in the Baltimor City that comes from
#motor vehicle source
#To run this code there should be "Source_Classification_Code.rds" and "summarySCC_PM25.rds" in working directory

library(ggplot2)
library(data.table)

#Reading data in R
NEI <- readRDS("summarySCC_PM25.rds")
info <- readRDS("Source_Classification_Code.rds")

#Subsetting from Source clasification that comes from motor vehicles
SCCinf <- subset(info, grepl("Vehicle", EI.Sector))

#Subsetting data that coresponds to Baltimore city and Motor Vehicles
MotorV <- subset(NEI, fips=="24510" & NEI$SCC %in% SCCinf$SCC)

#Calculating Vehicle related PM 2.5 emission in Baltimore by year
BalVeh<-aggregate(x=MotorV["Emissions"], by=list(Year=MotorV$year),sum)

#Creating  png file
png(filename="Plot5.png", width=480, height=480,units="px", bg="white")

#Creting plot
g<-ggplot(BalVeh,aes(x=Year, y=Emissions))
g+geom_point(size=2)+geom_line()+
  labs(x="Year",y="Emission in Tones", title="Total PM2.5 from Motor Vehicles in the Baltimore city")+
  theme_bw(base_family="Times")

#closing graphic device
dev.off()

#remowing variables from environment
rm(NEI,info,MotorV,g,SCCinf, BalVeh)