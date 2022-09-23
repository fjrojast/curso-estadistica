# ¿los 19 de septiembre son singulares en cuanto a sismos?


library(readr)  
library(tidyverse)  #carga librería tidyverse
sismos <- read_csv("00_datos/sismos.csv")      # carga datos de sismos





# Analizo la estructura de la tibble --------------------------------------



sismos %>% glimpse





# Primeramente, calculo el promedio general -------------------------------

sismos %>% 
  summarise(
    promedio_de_sismo=mean(Mag)
  )


#obtengo un promedio de 4.89



# añado más calculos al resumen -------------------------------------------



sismos %>%                               #toma la base de datos
  summarise(                             #realiza cálculos deseados
    promedio_de_sismo=mean(Mag),         #calcula promedio  
    desviacion_de_magnitud=sd(Mag),      #calcula desviación
    cantidad_de_sismos=n()               #calcula cantidad
  )                                #muestre en una pestaña nueva





# Añado agrupamiento por mes -----------------------------------------


sismos %>%                               #toma la base de datos
  group_by(Month) %>%                #establece cómo se van a agrupar los datos
  summarise(                             #realiza cálculos deseados
    promedio_de_sismo=mean(Mag),         #calcula promedio  
    desviacion_de_magnitud=sd(Mag),      #calcula desviación
    cantidad_de_sismos=n()               #calcula cantidad
  ) 


# Al agrupamiento le añado el día -----------------------------------------


sismos %>%                               #toma la base de datos
  group_by(Month,Day) %>%                #establece cómo se van a agrupar los datos
  summarise(                             #realiza cálculos deseados
    promedio_de_sismo=mean(Mag),         #calcula promedio  
    desviacion_de_magnitud=sd(Mag),      #calcula desviación
    cantidad_de_sismos=n()               #calcula cantidad
  ) 


# envío a la función view, para poder explorar todos los datos en una pestaña nueva. -----------------------------------------


sismos %>%                               #toma la base de datos
  group_by(Month,Day) %>%                #establece cómo se van a agrupar los datos
  summarise(                             #realiza cálculos deseados
    promedio_de_sismo=mean(Mag),         #calcula promedio  
    desviacion_de_magnitud=sd(Mag),      #calcula desviación
    cantidad_de_sismos=n()               #calcula cantidad
  ) %>% 
  view


# envío a la función view, para poder explorar todos los datos en una pestaña nueva. -----------------------------------------


sismos %>%                               #toma la base de datos
  group_by(Month,Day) %>%                #establece cómo se van a agrupar los datos
  summarise(                             #realiza cálculos deseados
    promedio_de_sismo=mean(Mag),         #calcula promedio  
    desviacion_de_magnitud=sd(Mag),      #calcula desviación
    cantidad_de_sismos=n()               #calcula cantidad
  ) %>% 
  arrange(cantidad_de_sismos) %>% 
  view




# añado la funcion filter -----------------------------------------


sismos %>%                               #toma la base de datos
  filter(Month=="09") %>% 
  group_by(Month,Day) %>%                #establece cómo se van a agrupar los datos
  summarise(                             #realiza cálculos deseados
    promedio_de_sismo=mean(Mag),         #calcula promedio  
    desviacion_de_magnitud=sd(Mag),      #calcula desviación
    cantidad_de_sismos=n()               #calcula cantidad
  ) %>% 
  arrange(cantidad_de_sismos) %>% 
  view






# Agrego el símbolo & para establecer un segundo criterio de filtr --------




sismos %>%                               #toma la base de datos
  filter(Month=="09"  &  Day == "19"   ) %>% 
  group_by(Month,Day) %>%                #establece cómo se van a agrupar los datos
  summarise(                             #realiza cálculos deseados
    promedio_de_sismo=mean(Mag),         #calcula promedio  
    desviacion_de_magnitud=sd(Mag),      #calcula desviación
    cantidad_de_sismos=n()               #calcula cantidad
  ) %>% 
  arrange(cantidad_de_sismos) %>%        #ordena el resultado
  view                                   #muestre en una pestaña nueva


