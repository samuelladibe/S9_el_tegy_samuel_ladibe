# Unit6. Regression
#Exercise about voltage of computers
# Load the data in Unit6_Lifespan.csv
data_Voltage<-read.csv2("Unit6_Voltage.csv", header=T)
#Define variables
Voltage <- data_Voltage$Voltage
Current <- data_Voltage$Current
#First draw a scatter plot to try and guess the relationship between the variables
plot(Voltage ~ Current,main="Dispersion graph", xlab = "Voltage", 
     ylab = "Current", col = "blue")
#It looks like a logrithmic model could apply (we add a constant to avoid the zero, or you just can avoid the observations with a zero)
model_log <- lm(Voltage ~ log(Current + 0.01))
summary(model_log)
#What if a linear model was proposed?
model_lin <- lm(Voltage ~ Current)
summary(model_lin)
#Or a double-logarithmic model?
model_doblog <- lm(log(Voltage+0.01) ~ log(Current + 0.01))
summary(model_doblog)

plot(Voltage ~ Current,main="Dispersion graph", xlab = "Voltage", ylab = "Current", col = "blue")
abline(model_log,col="red")
plot(model_log)







