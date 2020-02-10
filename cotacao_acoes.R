install.packages("quantmod")
library("quantmod")

acao <-c("MGLU3.SA", "PETR4.SA")
cotacao <- getSymbols(acao, src = "yahoo")  

par(mfrow=c(2,2))
chartSeries(PETR4.SA)
chartSeries(MGLU3.SA)
