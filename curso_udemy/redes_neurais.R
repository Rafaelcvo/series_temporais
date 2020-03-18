library(forecast)
library(ggplot2)

modelo =nnetar(co2)
modelo

prev = forecast(modelo, h=24)
prev
autoplot(prev)
