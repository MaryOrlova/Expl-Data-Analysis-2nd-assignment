#This code creates two plots that show changes in PM2.5 emission in the Baltimor City and Los Angeles
#that comes from motor vehicle source.
#To run this code there should be "Source_Classification_Code.rds" and "summarySCC_PM25.rds" in working directory

library(ggplot2)
library(data.table)

#Reading data in R
NEI <- readRDS("summarySCC_PM25.rds")
info <- readRDS("Source_Classification_Code.rds")

#Subsetting from Source clasification that comes from motor vehicles
SCCinf <- subset(info, grepl("Vehicle", EI.Sector))

#Subsetting data of Vehicle source PM2.5 emission for LA and Baltimore
M <- subset(NEI, NEI$SCC %in% SCCinf$SCC)
Motor<-subset(M,fips=="24510"|fips == "06037")

#Adding a County names to data frame
Motor<- transform(Motor, location = ifelse(fips=="06037","Los Angeles","Baltimore City"))

#Calculating total vehicle related PM2.5 emission by county and year
Veh<-aggregate(x=Motor["Emissions"], by=list(Location=Motor$location,Year=Motor$year),sum)

#Creating  png file
png(filename="Plot6.png",units="px", bg="white")

#Creting plot
a<-ggplot(Veh,aes(x=Year, y=Emissions, color=Location))
a+geom_point(size=2)+geom_line(size=1,linetype=1)+
  labs(x="Year",y="Emission in Tones", title="Motor Vehicle PM2.5 Emission in Baltimor and Los Angeles")+
  theme_bw(base_family="Times")

#closing graphic device
dev.off()

#remowing variables from environment
rm(NEI,info,Motor,a,SCCinf, M, Veh)