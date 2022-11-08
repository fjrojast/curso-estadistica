

library(tidyverse)




asistencias <- read_csv("/home/frojas2/curso-estadistca2/00_datos/asistencias_calificaciones_hacia_la_derecha.csv")


asistencias %>% glimpse()


pivot_longer(asistencias, )

asistencias_alargado_calculado <- asistencias %>% 
  pivot_longer(cols=3:12,names_to="dia",values_to="asistencia") %>% 
  group_by(Alumnos) %>% 
  summarise(
    promedio=mean(asistencia,na.rm=T),
    desviacion=sd(asistencia,na.rm=T)
  ) 




### los estudiantes más regulares en asistencia

asistencias_alargado_calculado %>% 
  arrange(desviacion)




### los estudiantes con mayor promedio de asistencia

asistencias_alargado_calculado %>% 
  arrange(desc(promedio))
