


library(googlesheets4)
library(tidyverse)



datos <- read_xlsx("/home/frojas2/curso-estadistca2/00_datos/datos para muestrear.xlsx")


datos %>% 
  sample_frac(.8)


datos %>% 
  sample_n(119)



# muestreo sistemático será cada 6 elementos.
escoger <- seq(3,171,6)

datos %>% 
group_by(Alumnos) %>% 
  summarise(n())






muestreo_sistematico <- datos[escoger,] 

muestreo_sistematico %>% 
  group_by(Alumnos) %>% 
  summarise(n())



datos %>% 
  group_by(aspecto) %>% 
  summarise(n())


muestra_actitud <- datos %>% filter(aspecto=="Actitud") %>% sample_frac(.2)
muestra_cálculo_mental <- datos %>% filter(aspecto=="cálculo mental") %>% sample_frac(.2)
muestra_calidad_de_los_trabajos <- datos %>% filter(aspecto=="calidad de los trabajos") %>% sample_frac(.2)
muestra_Caligrafía <- datos %>% filter(aspecto=="Caligrafía") %>% sample_frac(.2)
muestra_disciplina <- datos %>% filter(aspecto=="disciplina") %>% sample_frac(.2)
muestra_Ortografía <- datos %>% filter(aspecto=="Ortografía") %>% sample_frac(.2)
muestra_trabajo_colaborativo <- datos %>% filter(aspecto=="trabajo colaborativo") %>% sample_frac(.2)


muestreo_por_estratos <- bind_rows(
  muestra_actitud,
  muestra_cálculo_mental,
  muestra_calidad_de_los_trabajos,
  muestra_Caligrafía,
  muestra_disciplina,
  muestra_Ortografía,
  muestra_trabajo_colaborativo
)

