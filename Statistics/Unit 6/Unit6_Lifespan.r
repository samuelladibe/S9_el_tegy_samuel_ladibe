# Unit6. Regression
#Exercise about lifespan of computers
# Load the data in Unit6_Lifespan.csv
#two options: write the name of the file, or choose the file
#data_lifespan<-read.csv2(file.choose(), header=T)

data_lifespan <- read.csv2("C:/Users/37718890/Downloads/Unit6_Lifespan.csv", header=T)

#DEFINE VARIABLES
Lifespan <- data_lifespan$Lifespan
Price <- data_lifespan$Price
Use <- data_lifespan$Use

par(mfrow=c(1,2))
plot(Price,Lifespan)
plot(Use,Lifespan)
par(mfrow=c(1,1))

# In my laptop (alt gr + 4 + space) results in the symbol ~ , which is needed

model_lifespan <- lm(Lifespan ~ Price + Use)

#A summary of the model
summary(model_lifespan)
#Only the coefficients
model_lifespan$coefficients

#Significance of model

#Predictions
#Punctual estimation
predict(model_lifespan, data.frame(Price = 10, Use = 0.5))

#Confidence interval for the average value of dependent variable
#given the values of explanatory variables

predict.lm(model_lifespan, data.frame(Price = 10, Use = 0.5),
           interval = "confidence")

#Confidence interval for the prediction of one observation
# given the values of explanatory variables

predict.lm(model_lifespan,data.frame(Price = 10, Use = 0.5),
           interval = "prediction")

#The residuals
model_lifespan$residuals
#Forecast (values of dependent variable from the model as fitted)
model_lifespan$fitted


summary(model_lifespan)$r.squared
summary(model_lifespan)$adj.r.squared

#If you want to show a dispersion chart with the regression line (only one variable)
model_Price <- lm(Lifespan ~ Price)
summary(model_Price)
plot(Lifespan~Price, main = "Dispersion and regression line",
xlab = "Price in hundreds of euros" , ylab = "Lifespan in months", col = "green")
abline(model_Price, col = "red")
summary(model_Price)
