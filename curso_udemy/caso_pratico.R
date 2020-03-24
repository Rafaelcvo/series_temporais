library(forecast)
library(ggplot2)
library(seasonal)
library(seasonalview)
library(urca)

dados <- read.csv(file.choose(), header = F)

ocupacao <- ts(dados, start = c(2003,1), end = c(2017,12), frequency = 12)
summary(ocupacao)

autoplot(ocupacao)

hist(ocupacao)

boxplot(ocupacao)

dec <- decompose(ocupacao)
autoplot(dec)

# Analisando a tendencia
autoplot(dec$trend)
autoplot(window(dec$trend, start=c(2015,1)))

# Analisando a sazionalidade
ggseasonplot(ocupacao)
ggseasonplot(window(ocupacao, start=c(2016)))

# Criando um modelo preditivo para os proximos 2 anos.

# Verificando se os dados sao estacionarios
est <- ur.kpss(ocupacao)
est

ndiffs(ocupacao)

tsdisplay(ocupacao)

modelo <- auto.arima(ocupacao, trace = T, stepwise = F, approximation = F)
modelo

checkresiduals(modelo)

shapiro.test(modelo$residuals)

var(modelo$residuals)
median(modelo$residuals)
mean(modelo$residuals)

# Fazendo as previsoes
previsao <- forecast(modelo, h=24)
previsao
autoplot(previsao)


dados = ts(dados, start = c(2003,1), end = c(2017,12), frequency=12)
ocupacaotreino = window(dados, start = c(2003,1), end = c(2015,12))
ocupacaoteste  = window(dados, start = c(2016,1), end = c(2017,12))

modeloarima <- auto.arima(ocupacaotreino, trace = T, stepwise = F, approximation = F)
preverarima <- forecast(modeloarima, h=24)

modeloets <- ets(ocupacaotreino)
preverets <- forecast(modeloets, h=24)

plot(preverarima)
lines(preverets$mean, col="red")
lines(ocupacaoteste, col="green")

accuracy(preverarima, ocupacaoteste)
accuracy(preverets, ocupacaoteste)

plot(ocupacao)
lines(preverarima$mean, col="blue")
lines(preverets$mean, col="green")






