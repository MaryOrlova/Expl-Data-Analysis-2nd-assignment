##This code creates plot of total PM2.5 emission in the Baltimore City, Maryland from 1999 to 2008
##To run this code there should be "Source_Classification_Code.rds" in working directory

library(data.table)

#Reading file in R
NEI <- readRDS("summarySCC_PM25.rds")

#subsetting data from Baltimore
bal<-subset(NEI, fips=="24510")

#Clculating total emission y year
a<-aggregate(x=bal["Emissions"],by=list(Year=bal$year),sum)

#Creating  png file
png(filename="Plot2.png", width=480, height=480,units="px", bg="white")

#Plotting
plot(a$Year, a$Emissions,type="l", main="Total PM2.5 Emission in the Baltimor City by Year", xlab="Year", ylab="Emission in Tons")

#closing graphic device
dev.off()

#remowing variables from environment
rm(NEI,a,bal)