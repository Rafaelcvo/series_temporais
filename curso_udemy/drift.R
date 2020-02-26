library(forecast)
library(ggplot2)

autoplot(austres)

# sem executar o drift
prev <- rwf(austres, h=12, drift = F)
autoplot(prev)

# executando o drifit
prev <- rwf(austres, h=12, drift = T)
autoplot(prev)

prev
