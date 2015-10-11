
data <- read.table("household_power_consumption.txt",header = TRUE, sep =";")
as.data.frame(data)
data$Time <- strptime(data$Time,format = '%H:%M:%S')
data$Date <- as.Date(data$Date,"%d/%m/%Y") 

data1 <- data[which(data$Date>="2007-02-01" & data$Date<="2007-02-02"),]

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
hist(as.numeric(as.character(data1$Global_active_power)), 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red",
     xlim=c(0,6),
     ylim=c(0,1200))
dev.off()

#Note that in this dataset missing values are coded as ?.
#You must also include the code that creates the PNG file.
#Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)

#When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. 
#There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.
