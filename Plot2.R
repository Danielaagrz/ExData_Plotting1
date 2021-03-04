
#Download the Data
EPower<- read.table("file:///Users/danielaaguilar/Documents/repo/datasciencecoursera/household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?")

#Convert Date and Time variable to their correct class
EPower$Date<-as.Date(EPower$Date, format = "%d/%m/%Y")

#Subset the dates: 2007-02-01 and 2007-02-02
EPower2<-subset(EPower, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Combine the Date and Time columns 
EPower2<- EPower2 %>% mutate(DateTime=paste(Date, Time))

#Convert to format as.POSIXct
EPower2$DateTime<- as.POSIXct(EPower2$DateTime)

#Second Plot 
quartz()
plot(EPower2$DateTime, EPower2$Global_active_power, type = "l", xlab = "", ylab=" Global Active Power")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
