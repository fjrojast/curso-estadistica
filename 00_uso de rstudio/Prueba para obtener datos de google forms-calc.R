



# Carga de librerías ------------------------------------------------------

library(tidyverse)
library(googlesheets4)   #importante, instalarla utilizando install.packages("googlesheets4")
library(lubridate)









# Adquirir datos ----------------------------------------------------------

encuesta <- read_sheet("https://docs.google.com/spreadsheets/d/1cw8A2oDMsT7cZyuDJGLeyEPDTiOXwmAhdFNjCTBK1-A/edit?resourcekey#gid=803984422")





# exploración de los datos ------------------------------------------------

encuesta %>% glimpse





# promedio de la opinion de los desplazamientos a la escuela --------------


encuesta %>% 
  summarise(promedio=mean(`En una escala del 1 al 5, en donde 1 es desastroso y 5 se considera estupendo, ¿como opinas que fue tu desplazamiento hacia la escuela el día de hoy ?`,na.rm=T))




# Promedio de opinión conforme a los sentimientos manifestados ------------

encuesta %>% 
  group_by(`Marca temporal` %>% ) %>% 
  summarise(
    promedio=mean(`En una escala del 1 al 5, en donde 1 es desastroso y 5 se considera estupendo, ¿como opinas que fue tu desplazamiento hacia la escuela el día de hoy ?`,na.rm=T),
    cantidad=n(),
     desviacion=sd(`En una escala del 1 al 5, en donde 1 es desastroso y 5 se considera estupendo, ¿como opinas que fue tu desplazamiento hacia la escuela el día de hoy ?`,na.rm=T),
    cuartiles=IQR(`En una escala del 1 al 5, en donde 1 es desastroso y 5 se considera estupendo, ¿como opinas que fue tu desplazamiento hacia la escuela el día de hoy ?`,na.rm=T)
    
    
    
    ) %>% 
  arrange(desc(promedio))
