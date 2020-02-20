library(forecast)
library(ggplot2)

autoplot(fdeaths)

# aplicando uma media movel de 5 periodos
fdeaths2 <- ma(fdeaths, order = 5)
autoplot(fdeaths2)

# aplicando uma media movel de 12 periodos
fdeaths3 <- ma(fdeaths, order = 12)
autoplot(fdeaths3)

# tratando outliers
fdeaths4 <- tsclean(fdeaths)
autoplot(fdeaths4)

plot(fdeaths)
lines(fdeaths2, col="red")
lines(fdeaths3, col="blue")
lines(fdeaths4, col="green")
legend("topright", legend = c("Orig", "Ma5", "M12", "Tsc"), col = c("black", "red", "blue", "green"),
       lty =1:2, cex = 0.8)


