#install.packages("corrplot") # instalar psych
library(tidyverse)
library(corrplot)
practica_datosbivariados <- read_csv("00_datos/practica_correlacion.csv")

practica_datosbivariados %>% glimpse()




practica_datosbivariados$caligrafía
practica_datosbivariados$ortografía



#cor(caligrafia,ortografia)   #para mostrar


cor(practica_datosbivariados$caligrafía,practica_datosbivariados$ortografía)
plot(practica_datosbivariados$caligrafía,practica_datosbivariados$ortografía)


practica_datosbivariados %>% 
  rename(cooperativo =`Trabajo cooperativo/colaborativo`) %>% 
  select(3:7) %>% 
  cor %>% 
  corrplot


