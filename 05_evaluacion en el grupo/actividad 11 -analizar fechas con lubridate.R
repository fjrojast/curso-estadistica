

library(tidyverse)
library(lubridate)
library(googlesheets4)



encuesta <- read_sheet("https://docs.google.com/spreadsheets/d/1cw8A2oDMsT7cZyuDJGLeyEPDTiOXwmAhdFNjCTBK1-A/edit?usp=sharing")


encuesta %>% glimpse()
encuesta %>% view


encuesta$`Marca temporal` %>% wday


encuesta %>% 
  group_by(
    `¿quien eres?`,
    wday(`Marca temporal`)
    
    
    ) %>% 
  summarise(
    cantidad_respuestas=n(),
    promedio=mean(`¿cuantas horas dormiste anoche?`,na.rm=T),
    desviacion=sd(`¿cuantas horas dormiste anoche?`,na.rm=T),
    
  ) %>% view
