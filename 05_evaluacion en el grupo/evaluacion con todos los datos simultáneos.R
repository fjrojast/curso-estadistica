
# cargo librerías ---------------------------------------------------------

library(tidyverse)
library(googlesheets4)



# obtengo datos -----------------------------------------------------------

evaluacion_completa <- read_sheet("https://docs.google.com/spreadsheets/d/1KCRJhuJUH-pei-vEncmLRkrhZ_Vc94Afn80odmlJmVA/edit?usp=sharing")



# Explorar datos ----------------------------------------------------------


evaluacion_completa %>% glimpse()



# análisis inicial --------------------------------------------------------


evaluacion_completa$lectura %>% mean
evaluacion_completa$lectura %>% sd
evaluacion_completa$lectura %>% quantile()
evaluacion_completa$caligrafia %>% mean
evaluacion_completa$caligrafia %>% sd
evaluacion_completa$caligrafia %>% quantile()


