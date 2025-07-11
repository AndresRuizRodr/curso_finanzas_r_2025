#install.packages("tidyverse")
#install.packages("dplyr")
library(dplyr)
library(tidyverse)

#############################

x = 2
y = 5
xy = "hey"

# Podemos correr el código con comand + enter

print(paste(x,y,xy))

print(paste(x,y,xy, sep = "+"))


#####

iris
datos = iris
select(datos, Species)

####

dplyr::select(datos, Species)

?select

hola = c(-2,-10, 3, 4, 8)


# Example of using the pipe operator in R
library(magrittr)
# Traditional approach without pipe operator
result <- sqrt(mean(log10(abs(c(-2,-10, 3, 4, 8)))))

# Using the pipe operator for the same computation
result_01 <- c(-2,-10, 3, 4, 8) %>%
  abs() %>%
  log10() %>%
  mean() %>%
  sqrt()

data_autos = mtcars

filtro_01 = mtcars |>
  filter(mpg > 20)

##

x = 15
print(ifelse(x %% 2 == 0, "Par", "Impar"))

##

z = 1
z == 2


