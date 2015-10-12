
data <- read.table("household_power_consumption.txt",header = TRUE, sep =";")
as.data.frame(data)

dt <-paste(data$Date,data$Time)
data$dt <-strptime(dt, "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date,"%d/%m/%Y") 
data1 <- data[which(data$Date>="2007-02-01" & data$Date<="2007-02-02"),]

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

plot(data1$dt,
                data1$Sub_metering_1, 
                type="l",
                xlab="",
                ylab="Energey Sub Metering",
     col = "grey")
points(data1$dt,
     data1$Sub_metering_2, 
     type="l",
     col = "red")
points(data1$dt,
       data1$Sub_metering_3, 
       type="l",
       col = "blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("grey","red","blue"),lty=1)
dev.off()

#Note that in this dataset missing values are coded as ?.
#You must also include the code that creates the PNG file.
#Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)

#When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. 
#There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.
