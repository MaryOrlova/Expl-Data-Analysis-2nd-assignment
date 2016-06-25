# Expl-Data-Analysis-2nd-assignment
This repository contains **2nd assignment for Coursera Data Specialization Exploratory Data Analysis course.**


Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. This database is known as the National Emissions Inventory (NEI). 

Goal of this assignment is to explore the National Emissions Inventory database and explore PM 2.5 pollution in US in time period 1999–2008. 

##Repository contains:
- 6 R scripts(Plot1.R, Plot2.R, etc.)
- 6 png files(Plot1.png, Plot2.png, etc.)

Every scripts creates plot using base plotting in R and saves it in .png file.

##Plots requires datasets in working dierectrory:
- summarySCC_PM25.rds
- Source_Classification_Code.rds

##Scripts uses
- ggplot2 R package
- data.table R package

1st and 2nd plots are created using R base plotting system, all others plots are created using ggplot.

##Questions

- **Plot1.R** Have **total** emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the **base plotting** system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
- **Plot2.R** Have **total** emissions from PM2.5 decreased in the **Baltimore City**, Maryland (fips == "24510") from 1999 to 2008? Use the **base** plotting system to make a plot answering this question.
- **Plot3.R** Of the four types of **sources** indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen **decreases** in emissions from 1999–2008 for **Baltimore City**? Which have seen **increases** in emissions from 1999–2008? Use the **ggplot2** plotting system to make a plot answer this question.
- **Plot4.R** Across the **United States**, how have emissions from **coal combustion-related** sources changed from 1999–2008?
- **Plot5.R** How have emissions from **motor vehicle** sources changed from 1999–2008 in **Baltimore City**?
- **Plot6.R** **Compare** emissions from **motor vehicle** sources in **Baltimore City** with emissions from motor vehicle sources in **Los Angeles County**, California (fips == "06037"). Which city has seen **greater changes** over time in motor vehicle emissions?

