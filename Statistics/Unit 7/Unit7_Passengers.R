# Unit 7, Time series

data_passengers <- read.csv2("C:/Users/37718890/Downloads/Unit7_Passengers.csv", header=T)

#USERS <- data_passengers[,2]
#OR
USERS <- data_passengers$USERS

#Now transform the data USERS into a ts-object
#frequency refers to the period of seasonality, if there is seasonality
#start is the time of the first observation
#end referes to the time of the last observation, optional if you need to specify it

ts_USERS <- ts(USERS, frequency = 12, start = c(1989,1), end = c(2015,12))

#plot the time series

plot(ts_USERS, main = "My first time series plot", type = "l", lwd = 2, 
col = "blue", xlab = "Month-Year", ylab = "Users")

#Now plot the decomposition of the time series into trend, seasonal component, 
#and remainder (residual)
#s.window: either the character string "periodic" or the span (in lags) of the 

plot(stl(ts_USERS,s.window="periodic"))

# ---------------------------------------

#Now we plot the ACF and the PACF
acf(ts_USERS)
pacf(ts_USERS)




install.packages("forecast")
library(forecast)





acf(ts_USERS)
pacf(ts_USERS)


#Function Acf needs library 'forecast', function acf does not
#if you think logarithms are needed, add the following instruction now
#ts_USERS <- log(ts_USERS)

#Now we need to difference the series to make it stationary: 
#Take regular differences to remove the trend
ts_USERS_d1 <- diff(ts_USERS,differences=1)
plot(ts_USERS_d1)
acf(ts_USERS_d1)
#After this difference it seems that the trend is removed, but still there is seasonality

#Let us add a seasonal difference of order 1
ts_USERS_d1D1 <- diff(ts_USERS_d1,lag = 12, differences=1)
plot(ts_USERS_d1D1)
acf(ts_USERS_d1D1)
#It now seems that the series is stationary
#In order to build ARIMA models, let us obtain the ACF and PACF of the differenced series
acf(ts_USERS_d1D1)
pacf(ts_USERS_d1D1)

#Based on these ACF and PACF you could propose:
#(0,1,1)x(0,1,1)12, (0,1,1)x(2,1,0)12, 
#(2,1,0)x(0,1,1)12, (2,1,0)x(2,1,0)12
# Now you need to fit the four arima models proposed
#(0,1,1)x(0,1,1)12
model_1 <- Arima(ts_USERS, order=c(0,1,1), seasonal=c(0,1,1))
model_1
#(0,1,1)x(2,1,0)12
model_2 <- Arima(ts_USERS, order=c(0,1,1), seasonal=c(2,1,0))
model_2
#(2,1,0)x(0,1,1)12
model_3 <- Arima(ts_USERS, order=c(2,1,0), seasonal=c(0,1,1))
model_3
#(2,1,0)x(2,1,0)12
model_4 <- Arima(ts_USERS, order=c(2,1,0), seasonal=c(2,1,0))
model_4

#The first one yields the lowest error variance: 11716

# -------------------------------------------------

#the following command may help in choosing an arima model
install.packages("forecast")
library(forecast)
model_best <- auto.arima(ts_USERS)
model_best
#In this example you get model_1, again

#3. Find the forecasts for the next 9 months
predictions <- predict(model_best,n.ahead=9)
predictions

#Now let us plot the series plus the forecasts
ts.plot(ts_USERS, predictions$pred, lty = c(1,3), col=c("green","red"))

#Let us plot the forecast and the prediction intervals
#lty	line type (from 1 to 6)
#lwd	line width relative to the default (default=1). 2 is twice as wide.

#First build the confidence intervals
#1.96 is the critical point of a Normal(0,1) needed for the confidencde interval
upper <- predictions$pred + 1.96*predictions$se
lower <- predictions$pred - 1.96*predictions$se
upper
lower
#now plot the predictions and the prediction intervals
plot(predictions$pred,col="blue")
lines(upper,col="red",lty=3)
lines(lower,col="red",lty=3)

#Now let us write the actual values of the series  for the forecasted periods and make it a ts
actual <- c(6441.1, 6446.6, 7466.3, 7652.31, 7935.89, 8154.57, 8712.82, 8706.77, 8762.54)
ts_actual <- ts(actual, frequency = 12, start = c(2016,1), end = c(2016,9))
#Now plot the actual values together with the forecasts and their C.I.
#plot the actual values in the forecasted periods as red points
plot(ts_actual,col="red", type="p",ylim=c(6000, 9000))
#add to the plot the confidence intervals of the forecasts as dotted blue lines
lines(upper,col="blue",lty=3)
lines(lower,col="blue",lty=3)
#add to the plot the forecasted values as blue points
points(predictions$pred,col="blue")
#It seems that 5 out of 9 actual values are out of the confidence intervals, and one is on the edge
#It also seems that our predictions (red points) are always below the actual values (blue points) --> Underestimation
#So, the model does not seem to be predicting correctly, and it should be fixed

#predictions using function forecast
predictions_forecast <-forecast(model_best,h=9,level=0.95)
predictions_forecast
plot(predictions_forecast)

predicted_values <- predictions_forecast$mean
predicted_values
predicted_lower <- predictions_forecast$lower
predicted_lower
predicted_upper <- predictions_forecast$upper
predicted_upper
#Let us now assess the accuracy of the model by means of an R function
#First without considering the predictions
accuracy(model_best)
#Then considering the information on the predictions
accuracy(predictions$pred,ts_actual)

# ----------------------------------------------

##The following graphs are a bit messsy. Fix them or not show them
#Graphically see the difference between fitted and real over the training set
fitted_training_set <-fitted(model_best)
fitted_training_set
upper_ev <- fitted_training_set + 1.96*sqrt(model_best$sigma2)
lower_ev <- fitted_training_set - 1.96*sqrt(model_best$sigma2)
#plot the series as a polygon 
plot(ts_USERS, type="n", ylim=range(lower_ev,upper_ev))
polygon(c(time(ts_USERS),rev(time(ts_USERS))), c(upper_ev,rev(lower_ev)), 
        col=rgb(0,0,0.6,0.2), border=FALSE)
lines(ts_USERS)
lines(fitted_training_set,col='red')
#Graphycally see the difference in the evaluation set
#plot the series as a polygon 
plot(ts_actual, type="n", ylim=range(predicted_lower,predicted_upper))
polygon(c(time(ts_actual),rev(time(ts_actual))), c(predicted_upper,rev(predicted_lower)), 
        col=rgb(0,0,0.6,0.2), border=FALSE)
lines(ts_actual)
lines(predicted_values,col='red')
help("polygon")
help("rev")
