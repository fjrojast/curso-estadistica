
# cargo librerías ---------------------------------------------------------

library(tidyverse)
library(googlesheets4)


# Obtengo los datos -------------------------------------------------------


evaluacion_uno_a_uno <- read_sheet("https://docs.google.com/spreadsheets/d/13k9MWqFp965WBMElxb1qseGSQJd9WcoVb2xoC6Ph_74/edit?usp=sharing")



# explorar los datos ------------------------------------------------------


evaluacion_uno_a_uno %>% glimpse()



# Analizo los datos -------------------------------------------------------


evaluacion_uno_a_uno %>% 
  group_by(Estudiante) %>% 
  summarise(
    media=mean(`Nivel de desempeño`),
    desviacion=sd(`Nivel de desempeño`),
    cantidad_evaluaciones= n()
  )



