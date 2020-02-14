# install.packages("quantmod")
library("quantmod")

acoes <-c("TAEE11.SA", "RPAD3.SA", "REDE3.SA", "STBP3.SA", "PTNT4.SA", 
          "CRIV4.SA", "CTSA3.SA", "LPSB3.SA", "WHRL4.SA", "TASA3.SA", 
          "GOAU4.SA", "BRIV4.SA")

getSymbols(acoes, src = "yahoo" )

chartSeries(TAEE11.SA)
chartSeries(RPAD3.SA)
chartSeries(REDE3.SA)
chartSeries(STBP3.SA)
chartSeries(PTNT4.SA)
chartSeries(CRIV4.SA)
chartSeries(CTSA3.SA)
chartSeries(LPSB3.SA)
chartSeries(WHRL4.SA)
chartSeries(TASA3.SA)
chartSeries(GOAU4.SA)
chartSeries(BRIV4.SA)


addBBands()
