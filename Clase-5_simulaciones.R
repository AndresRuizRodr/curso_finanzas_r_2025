library(readxl)
library(tidyverse)

So = 100
volatilidad = 0.15
mu = 0.50
delta_t = 1 / 365
iteraciones = 1000
periodos = 365

?rnorm

matriz_precios = matrix(, periodos + 1, iteraciones)
matriz_precios[1, ] = So
for (i in 1:iteraciones)
  for (j in 2:nrow(matriz_precios))
  {matriz_precios[j, i] =
    matriz_precios[j - 1, i] *
    exp((mu - volatilidad ^ 2 / 2) *
          delta_t +
          volatilidad *
          rnorm(1) *
          sqrt(delta_t))
  }

#Calculamos las simulaciones:
drift = as_tibble(apply(matriz_precios, 1, mean))

cuantiles = as_tibble(t(apply(matriz_precios, 1, quantile,
                              probs = c(0.01, 0.05, 0.95, 0.99))))

#Graficamos
data <- drift %>%
  bind_cols(cuantiles) %>%
  mutate(Trend = seq(1,366))
ggplot(data=data, aes(x=Trend)) +
  geom_line(aes(y=value), color = "green") +
  geom_line(aes(y=`1%`), color = "blue") +
  geom_line(aes(y=`5%`), color = "darkred") +
  geom_line(aes(y=`95%`), color = "darkred") +
  geom_line(aes(y=`99%`), color = "blue")



## Para valorizar una opción
K = 100
r = 0.02
sigma = 0.2
T = 0.5
S0 = 102
# call option
d1 <- (log(S0/K) + (r + sigma^2/2) * T)/(sigma * sqrt(T))
d2 <- d1 - sigma * sqrt(T)
phid1 <- pnorm(d1)
call_price <- S0 * phid1 - K * exp(-r * T) * pnorm(d2)
# put option
d1 <- (log(S0/K) + (r + sigma^2/2) * T)/(sigma * sqrt(T))
d2 <- d1 - sigma * sqrt(T)
phimd1 <- pnorm(-d1)
put_price <- -S0 * phimd1 + K * exp(-r * T) * pnorm(-d2)
c(call_price, put_price)


## usando simulaciones

# call put option monte carlo
call_put_mc<-function(nSim=1000000, tau, r, sigma, S0, K) {
  Z <- rnorm(nSim, mean=0, sd=1)
  WT <- sqrt(tau) * Z
  ST = S0*exp((r - 0.5*sigma^2)*tau + sigma*WT)
  
  # price and standard error of call option
  simulated_call_payoffs <- exp(-r*tau)*pmax(ST-K,0)
  price_call <- mean(simulated_call_payoffs)
  sterr_call <- sd(simulated_call_payoffs)/sqrt(nSim)
  
  # price and standard error of put option
  simulated_put_payoffs <- exp(-r*tau)*pmax(K-ST,0)
  price_put <- mean(simulated_put_payoffs)
  sterr_put <- sd(simulated_put_payoffs)/sqrt(nSim)
  output<-list(price_call=price_call, sterr_call=sterr_call,
               price_put=price_put, sterr_put=sterr_put)
  return(output)
}
set.seed(1)
results<-call_put_mc(n=1000000,
                     tau=0.5,
                     r=0.02,
                     sigma=0.2,
                     S0=102,
                     K=100)
results





library(ggplot2)
library(dplyr)
library(triangle)

#set.seed(1234567)
reps = 10000
utilidad = matrix(NA, nrow = reps, ncol = 1)
for (i in 1:reps) {
  x = sample(c("A","B","C"), 1, replace = TRUE, prob = c(1/4, 1/2, 1/4))
  if (x == "A") {
    precio = 12
    cantidad = 110
    6
  }
  else if (x == "B") {
    precio = 13
    cantidad = 100
  }
  else {
    precio = 16
    cantidad = 80
  }
  costo_variable_unitario = rtriangle(1, 9, 13, 11)
  costo_fijo = 150
  utilidad[i] = (precio - costo_variable_unitario)*cantidad - costo_fijo
}
utilidad <- data.frame(utilidad)
ggplot(utilidad) +
  geom_histogram(aes(x = utilidad, y=after_stat(density)), col="black", bins = 35) +
  labs(x = "Utilidad", y = "Densidad") +
  theme(
    panel.background = element_blank(),
    axis.line = element_line()
  )
    

    paste0("Prob(utilidad<0) = ",
           round(mean(utilidad$utilidad<0),2))
    
    
    paste0("Valor esperado utilidad = ",
           round(mean(utilidad$utilidad),2))

