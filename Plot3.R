
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


#Third Plot
quartz()
with(EPower2,{plot(DateTime,Sub_metering_1, type="l", xlab = "", ylab = "Energy Sub Metering")
  lines(DateTime, Sub_metering_2, type="l", col="red")
  lines(DateTime, Sub_metering_3, type = "l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
})
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()