library(ggplot2)

## Opción de compra

# Set parameters
strike_price <- 50
stock_prices <- seq(from = 30, to = 70, by = 1)

# Calculate the payoff
payoff <- pmax(stock_prices - strike_price, 0)

# Create a dataframe

option_data <- data.frame(StockPrice = stock_prices, Payoff = payoff)
# Plotting the call option payoff
option_plot <- ggplot(option_data, aes(x = StockPrice, y = Payoff)) +
  geom_line(color = "blue", linewidth = 1) +
  labs(title = "Call Option Payoff", x = "Stock Price at Expiration", y = "Payoff") +
  theme_minimal()
option_plot

# Display the plot
print(option_plot)



## Opción de venta:

2. Contrato de opción de venta: derecho a vender a un precio determinado
# Parameters
strike_price <- 50
stock_prices <- seq(from = 30, to = 70, by = 1)
# Calculate the payoff for a put option
payoff <- pmax(strike_price - stock_prices, 0)
# Create a dataframe
option_data <- data.frame(StockPrice = stock_prices, Payoff = payoff)
# Plotting the put option payoff
option_plot <- ggplot(option_data, aes(x = StockPrice, y = Payoff)) +
  geom_line(color = "red", linewidth = 1.5) + # Red line for visibility
  labs(title = "Put Option Payoff",
       x = "Stock Price at Expiration",
       y = "Payoff",
       subtitle = "Strike Price: 50") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), # Centering title
        plot.subtitle = element_text(hjust = 0.5)) # Centering subtitle

# Display the plot
print(option_plot)


