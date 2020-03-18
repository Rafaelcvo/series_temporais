library(forecast)
library(ggplot2)


modelo <- auto.arima(co2, trace = T)
modelo
# Best model: ARIMA(1,1,1)(1,1,2)[12]   
# sigma^2 estimated as 0.08576:  log likelihood=-84.39
# AIC=180.78   AICc=180.97   BIC=205.5

modelo2 <- auto.arima(co2, trace = T, stepwise = F, approximation = F)
modelo2
# Best model: ARIMA(0,1,3)(0,1,1)[12]  
# sigma^2 estimated as 0.08518:  log likelihood=-83.43
# AIC=176.86   AICc=177   BIC=197.47

prev1 <- forecast(modelo, h=12)
autoplot(prev1)

prev2 <- forecast(modelo2, h=12)
autoplot(prev2)

prev1$mean
prev2$mean

plot(prev1)
lines(prev2$mean, col='red')
