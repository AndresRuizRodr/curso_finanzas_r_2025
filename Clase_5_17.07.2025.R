library(readxl)
library(tidyverse)

datavisualization <- read_excel("datavisualization.xlsx", 
                                sheet = "datavisualization")

View(datavisualization)



p <- ggplot(datavisualization) + aes(x = sexo, y = fibe)
p


p <- ggplot(datavisualization) + aes(x = sexo) + geom_bar()
p