sport <- c(9, 6,5 , 7)

lbls <- c("Rugby", "Football", "Basketball", "Other")

pie(sport, labels = lbls, main="Pie Chart of Favorite Sports")

# Example of bar charts
barplot(sport, names.arg = lbls, main = "Bar Chart of Favorite Sports",
        col = c('Red', "Blue", "Orange", "pink"))

help("barplot")   # return a manual of how to use barplot function


# import data frequency csv
data <- read.csv2("C:/Users/37718890/Downloads/Unit1_Piechart.csv", header=T)

data

sport_vector <- data$Favourite_Sport

sport_vector

frequency_vector <- data$Frequency

frequency_vector


#import heights csv
data_heights <- read.csv("C:/Users/37718890/Downloads/Unit1_Heights.csv", header=T)

data_heights

Heights = data_heights[, 1]

mean(Heights)

median(Heights)

quantile((Heights), 0.35)

#Plot
hist(Heights,
    breaks = c(1.6, 1.7, 1.8, 1.9), col = "Green",
    main = "My First Histogram in R",
    xlab = "Hegihts", ylab = "Frequency")

hist(Heights, col = "Green",
    main = "My First Histogram in R",
    xlab = "Hegihts", ylab = "Frequency")


hist(Heights, breaks = 6, col = "Green",
    main = "My First Histogram in R",
    xlab = "Hegihts", ylab = "Frequency")

# How to compute the range
range_Heights <- max(Heights) - min(Heights)

range_Heights

# Determine the interquartile
IQR(Heights)
quantile(Heights)


# Standart deviation and vairance
sd(Heights)   #unit meter (m) according to the date
sd(100*Heights)   #convert unit to (cm)

var(Heights)

# Coefficiant of vairation helps to determine the dispoersion in a data in a relative measure
CV <- function(data_vector) {
  (sd(data_vector)/mean(data_vector))*100
}

CV(Heights) 


# Determine the skewness coefficient and kurtosia, we need to install a package
# install.packages("moments") #Run it only once

library(moments)
skewness(Heights)
kurtosis(Heights)


# How to represent a boxplot

boxplot(Heights, horizontal = TRUE,
        main="My First Box Whysker plot",
        xlab = "Heights",
        ylab = "Values")

# Vertical line for the average
abline(v=mean(Heights), col= "Red")