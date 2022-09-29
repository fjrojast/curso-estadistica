



# Carga de librerías ------------------------------------------------------

library(tidyverse)










# Adquirir datos ----------------------------------------------------------

datos <- read_csv("/home/frojas2/curso-estadistca2/00_datos/sismos.csv")






# exploración de los datos ------------------------------------------------

datos %>% glimpse





# Promedio sismos por región ----------------------------------------------


datos %>% 
  group_by(Region) %>% 
  summarise(promedio_por_region=mean(Mag))





# Promedio sismos por año -------------------------------------------------


datos %>% 
  group_by(Year,Month) %>% 
  summarise(promedio_por_region=mean(Mag))



