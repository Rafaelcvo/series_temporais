library(forecast)
library(ggplot2)

set.seed(4312)
x = cumsum(sample(c(-1,1), 100, T))

serie <- ts(x, start = c(1900), end = c(2000), frequency = 1)
serie
autoplot(serie)

prev <- naive(serie, h=5)
class(prev)

prev

autoplot(prev)

prev2 <- naive(serie, h=5, level = c(95,99))
prev2
autoplot(prev2)

split.screen(figs = c(2,1))
screen(1)
plot(prev)
screen(2)
plot(prev2)
close.screen(all=T)

autoplot(AirPassengers)
prev3 <- snaive(AirPassengers, h=12)

autoplot(prev3)

# Aula 35 - Mean com R 

# dataset de mortes por cançer no Reino Unido
autoplot(fdeaths)

mean(fdeaths)
prev4 <- meanf(fdeaths, h=5)
prev4
autoplot(prev4)
fdeaths
fdeaths2 <- window(fdeaths, start=c(1976, 1), end=c(1979, 12))
autoplot(fdeaths2)
mean(fdeaths2)
prev5 <- meanf(fdeaths2, h=5)
prev5
autoplot(prev5)
plot(prev4)
lines(prev5$mean, col="red")

















































































