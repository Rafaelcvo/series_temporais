###########################################################################################################
################################## An�lise de s�ries temporais em R: um curso introdut�rio  ###############
###########################################################################################################
### Cap�tulo 2 - Modelos de Suaviza��o Exponencial ########################################################
### Autores: Victor Eduardo Leite de Almeida Duca e Pedro Costa Ferreira ################################## 
###########################################################################################################

# pacotes utilizados ao longo do cap�tulo
#install.packages("fpp") 
library(fpp)
#install.packages("mFilter")
library(mFilter)
#install.packages("forecast")
library(forecast)


##### -------- Se��o 2.1 -------- #####

# leitura dos dados
# serie temporal decomposta
decomp<-decompose(elecequip,type='additive')
plot(decomp)

# ajuste sazonal
decomp<-decompose(elecequip,type='additive')
decomp
ajuste_sazonal<-elecequip - decomp$seasonal
ajuste_sazonal

# serie temporal
data(elecequip)
plot(elecequip,xlab="Tempo",ylab="�ndice de novas ordens")

# Filtro HP
data(cafe)
filtro_hp<-hpfilter(cafe,type='lambda')
par(mfrow=c(2,1))
plot(cafe,ylab="Despesas Trimestrais",xlab="tempo")
lines(hpfilter(cafe,type='lambda')$trend,col='red',lwd=2)
legend(1985,8000,c("S�rie Original","Tend�ncia - Filtro HP"),col=c('black','red'),
         lwd=c(1,2),bty='n')
plot(hpfilter(cafe,type='lambda')$cycle, ylab='Componente C�clica',xlab='tempo')


##### -------- Se��o 2.2 -------- #####

# serie temporal simulada
set.seed(1234)
serie <- ts(runif(100,10,15),start = c(1915,1),frequency = 1)
plot(serie)

# m�todo de amortecimento exponencial simples
ajuste<-HoltWinters(serie,beta=FALSE,gamma=FALSE)
ajuste
plot(ajuste,xlab='tempo',ylab='valores observados/ajustados',main='')

# previs�o utilizando amortecimento exponencial simples
ajuste_prev<-forecast(ajuste,h = 10,level=95)
ajuste_prev
plot(ajuste_prev,main="",xlab="Tempo",ylab="Dados")


##### -------- Se��o 2.3 -------- #####

# leitura dos dados
dados<-read.csv2("consumo_energia_eletrica_regiao_sudeste.csv")
dados<-dados[-457,] # retirando janeiro de 2017
consumo<-ts(dados[,2],start=c(1979,1),frequency=12)
plot(consumo,xlab='tempo',ylab='Consumo de Energia El�trica (Gwh)',main='')

# m�todo de Holt
ajuste_holt<-HoltWinters(consumo,gamma=FALSE)
ajuste_holt

# gr�fico 
plot(consumo,xlab='tempo',ylab='Valores Observados/Ajustados', main='')
lines(fitted(ajuste_holt)[,1],lwd=2,col='red')
legend(1980,20000,c("Consumo Energia El�trica","Ajuste SEH"),lwd=c(1,2),col=c("black","red"),bty='n')

# previs�o utilizando m�todo de Holt
prev_holt<-forecast(ajuste_holt,h=12,level=95)
prev_holt

# gr�fico com os valores previstos
plot(prev_holt,xlab='tempo',ylab='valores observados/previstos', main='')


##### -------- Se��o 2.4 -------- #####

# leitura da s�rie temporal
tx_desemprego<-read.csv2('taxa_desemprego_regiao_metropolitana_sp.csv',sep='')
desemprego<-tx_desemprego[,2]
serie_desemprego<-ts(desemprego,start=c(1985,1),frequency=12)
plot(serie_desemprego,xlab='tempo',ylab='taxa de desemprego',main='')

# m�todo de Holt-Winters
ajuste_com_sazonalidade<-HoltWinters(serie_desemprego)
ajuste_com_sazonalidade

# gr�fico da taxa de desemprego utilizando o m�todo de Holt-Winters (aditivo)
plot(serie_desemprego,xlab='tempo',ylab='taxa de desemprego',main='')
lines(fitted(ajuste_com_sazonalidade)[,1],lwd=2,col='red')
legend(1985,15,c("Taxa de Desemprego","Ajuste HW"),lwd=c(1,2),col=c("black","red"),bty='n')

# previs�o utilizando o m�todo de Holt-Winters (aditivo)
prev_hw<-forecast(ajuste_com_sazonalidade,h=12,level=95)
plot(prev_hw,xlab='tempo',ylab='Taxa de Desemprego',main='')

# compara��o do m�todo de Holt-Winters aditivo e multiplicativo
ajuste_com_sazonalidade_mult<-HoltWinters(serie_desemprego,seasonal="multiplicative")
plot(serie_desemprego,xlab='tempo',ylab='taxa de desemprego',main='',ylim=c(4,20))
lines(fitted(ajuste_com_sazonalidade)[,1],lwd=2,col='red')
lines(fitted(ajuste_com_sazonalidade_mult)[,1],lwd=2,col='blue')
legend(1985,20,c("Taxa de Desemprego","Ajuste HW Aditivo",
                   "Ajuste HW Multiplicativo"),lwd=c(1,2),col=c("black","red","blue"),bty='n')
