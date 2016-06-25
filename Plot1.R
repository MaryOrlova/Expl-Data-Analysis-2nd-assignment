##This code creates plot of total PM2.5 emission across US by year
##To run this code there should be "Source_Classification_Code.rds" in working directory
#Reading file in R
library(data.table)
NEI <- readRDS("summarySCC_PM25.rds")

#Clculating total emission y year
a<-aggregate(x=NEI["Emissions"],by=list(Year=NEI$year),sum)

#Creating  png file
png(filename="Plot1.png", width=480, height=480,units="px", bg="white")

#Plotting
plot(a$Year,a$Emissions, type="l", yaxt="n", main="Total PM2.5 Emission by Year", xlab="Year", ylab="Emission in Tons")
axis(2, at=c(3000000,4000000,5000000,6000000,7000000), labels=c("3*10x6", "4x10*6","5x10*6","6x10*6", "7*10^6"))

#closing graphic device
dev.off()

#remowing variables from environment
rm(NEI,a)