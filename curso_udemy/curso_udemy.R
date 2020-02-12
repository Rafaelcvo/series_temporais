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

# Analise residual 
library(forecast)
library(ggplot2)

# Gerando um grafico de popularidade dos americanos
autoplot(presidents)

prev <- auto.arima(presidents)

prev$residuals

autoplot(prev$residuals)
hist(prev$residuals)
var(prev$residuals, na.rm = T)
mean(as.vector(prev$residuals), na.rm = T)
acf(prev$residuals, na.action = na.pass)

# funcao do forecast que analiza os residuos
checkresiduals(prev)

# teste estatistico para verificar se os dados estao normalmente distribuidos
shapiro.test(prev$residuals)

# Saida
# data:  prev$residuals
# W = 0.99016, p-value = 0.5862
# Como os dados estao acima e 0.05 pode se concluir que eles estao normalmente distribuidos 

# transformando uma serie nao estacionaria em estacionaria
library(urca)

x = ur.kpss(AirPassengers)

# o teste gerou um valor de 2.7395, muito acima do valor de 
x
































































































































