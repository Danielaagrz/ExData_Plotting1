
#Download the Data
EPower<- read.table("file:///Users/danielaaguilar/Documents/repo/datasciencecoursera/household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?")

#Convert Date and Time variable to their correct class
EPower$Date<-as.Date(EPower$Date, format = "%d/%m/%Y")

#Subset the dates: 2007-02-01 and 2007-02-02
EPower2<-subset(EPower, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#First Plot
quartz()

hist(EPower2$Global_active_power, 
     breaks= 12, main="Global Active Power",
     xlab= "Global Active Power (kilowatts)",
     ylab="Frequency", col="red", ylim= c(0,1200))
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()