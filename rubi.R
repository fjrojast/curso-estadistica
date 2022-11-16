library(tidyverse)


file.choose()

library(readxl)
library(googlesheets4)
datos <- read_sheet("https://docs.google.com/spreadsheets/d/1eIHgdnQWEz7gGUK0IUATkHhwqZOEFe4InNN0CP17sE0/edit?usp=sharing")


# datos <- read_excel("/home/frojas/Descargas/Evaluación de alumnos de segundo grado .xlsx")


datos %>% glimpse


datos %>% 
  mutate(across(2:ncol(.),as.character)) %>% 
  pivot_longer(2:ncol(.), names_to = "aspecto",values_to = "evaluacion") %>% 
  separate(aspecto,into=c("aspecto","estudiante"),sep="---") %>% 
  mutate(evaluacion = evaluacion %>% str_replace_all(
    c(
      "Nivel esperado" = "4",
      "En desarrollo" = "3",
      "Requiere apoyo" = "2",
      
      "Excelente" = "4",
      "Muy buena" = "3",
      "Regular" = "2",
      "Puede mejorar" = "1"
      
    ),
    # estudiante=estudiante %>% str_squish(str_remove(estudiante,"\\[\\]"))
      
  )) %>% 
  filter(
    evaluacion=="1"|
    evaluacion=="2"|
    evaluacion=="3"|
    evaluacion=="4"
  ) %>% 
  filter(!is.na(estudiante),!is.na(evaluacion)) %>% 
  pivot_wider(names_from = aspecto,values_from=evaluacion) %>% bind_cols(complete.cases(.)) %>% 
  as_tibble %>% 
  filter(...14==T) %>% 
  mutate(across(3:13,as.numeric)) %>% 
  select(3:13) %>% 
  rename(rehilete=`Elabora un rehilete siguiendo los pasos, asimismo, realiza el instructivo para su realización. ` ,
         cantidades=`Forma y descompone cantidades, utilizando unidades, decenas y centenas, además, los compara.`,
         desagrupar=`Encuentra diferentes maneras de desagrupar cantidades utilizando unidades, decenas y centenas. `,
         regularidades=`Encuentra regularidades o patrones en el tablero de 100. ` ,
         sumas_restas=`Resuelve sumas y restas con números naturales mayores a 100. `,
         cuerpos_geom=`Construye y describe figuras y cuerpos geométricos.`,
         convivencia=`Distingue y sugiere reglas de convivencia que favorecen el trato respetuoso e igualitario en los sitios donde interactúa.`,
         expresa_opi=`Expresa lo que opina y lo que necesita. `,
         participa=`Participación individual y colaborativa.`,
         contruir=`Identifica las características comunes de forma y contenido de los textos instructivos para elaborar algo: título, materiales y procedimiento. `
         ) %>%  
  cor %>% 
  corrplot
  distinct(evaluacion)
  distinct(aspecto) %>% arrange(aspecto) %>% view
  
  iris %>% 
    mutate(across(1:Petal.Width),round)
  
  iris %>%
    as_tibble() %>%
    mutate(across(1:Sepal.Width, round))
  