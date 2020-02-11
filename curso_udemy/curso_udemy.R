# Criando numeros aleatorios para ts

myts <- rnorm(60)
myts <- ts(myts, start = c(2012,1), end = c(2016,12), frequency = 12)
myts
class(myts)
plot(myts)

# tempts <- read.csv(file.choose(), sep = ',', header = FALSE)
tempts <- read.csv('git/series_temporais/curso_udemy/arquivos do curso/Dados/importar.csv')
tempts

tempts <- ts(tempts[2], start = c(1884), end = c(1939), frequency = 1)
class(tempts)
plot(tempts)

# Trabalhando com series temporais.
sunspots
max(sunspots)
min(sunspots)
start(sunspots)
end(sunspots)
frequency(sunspots)
sun2 <- window(sunspots, start=c(1749,1), end=c(1763,12), frequency=12)
plot(sun2)

plot(sunspots)
hist(sunspots)
boxplot(sunspots)

library(ggplot2)
library(forecast)

autoplot(AirPassengers)

plot(sun2)
hist(sun2)
boxplot(sun2)









