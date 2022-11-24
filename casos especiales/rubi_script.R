library(tidyverse)
library(corrplot)
library(readxl)
library(googlesheets4)


datos <- read_sheet("https://docs.google.com/spreadsheets/d/1eIHgdnQWEz7gGUK0IUATkHhwqZOEFe4InNN0CP17sE0/edit?usp=sharing")


# datos <- read_excel("/home/frojas/Descargas/Evaluación de alumnos de segundo grado .xlsx")


datos %>% view
datos %>% 
  glimpse


datos %>% 
  mutate(across(2:ncol(.),as.character)) %>%   #cambia todas las columnas a partir de las dos para que sean de tipo caracter(texto) y no de problemas para el pivot_longer
  pivot_longer(2:ncol(.), names_to = "aspecto",values_to = "evaluacion") %>% #redimensiona la tabla para que a partir de la columna 2, se distribuya hacia abajo, 
  separate(aspecto,into=c("aspecto","estudiante"),sep="---") %>% #dentro de la columna aspecto, busca tres guiones y a partir de ahí, lo que está antes de esos guiones lo pone en una columna nueva llamada aspecto y lo que está después, en una columna llamada estudiante
# aquí terminó el proceso para hacer pivot longer y seprara columnas aspectos y estudiantes
    mutate(evaluacion = evaluacion %>% #  #comienza la transformación de datos, utilizando mutate. Le estamos diciendo que evaluación es igual a evaluación a lo que se le ha reemplazado lo que está antes del signo igual con lo que está después del signo igual. 
           str_replace_all(
    c(
      "Nivel esperado" = "4",
      "En desarrollo" = "3",
      "Requiere apoyo" = "2",
      
      "Excelente" = "4",
      "Muy buena" = "3",
      "Regular" = "2",
      "Puede mejorar" = "1"
      
    ),
      
  )) %>% 
  filter(  #en este bloque, de filter, estamos filtrando solo donde evaluación es igual a 1, 2, 3 o 4
    evaluacion=="1"|
    evaluacion=="2"|
    evaluacion=="3"|
    evaluacion=="4"
  ) %>% 
  filter(!is.na(estudiante),!is.na(evaluacion)) %>%  # estamos filtrando, para que solo se escoja estudiante y evaluación no son NA (utilizando la función is.na)
  pivot_wider(names_from = aspecto,values_from=evaluacion) %>% #volvemos a convertir en una tabla ancha.
  bind_cols(complete.cases(.)) %>% # estamos calculando si todas las columnas están completas (si ninguna columna es NA, resulta True). utilizamos la función complete_cases y un punto para decirle que se aplique a todo lo que viene desde antes del pipe: complete_cases(.). Finalmente ponerle bind_cols() quiere decir que se agregue a una columna hacia la derecha.
  as_tibble %>% # necesitamos asegurarnos que el tipo de objeto permanezca como tibble, por esto forzamos a que se convierta a tibble con esta función.
  filter(...14==T) %>%  # la columna que se añadió con la función complete_cases() se llamó ...14. Estamos descartando las filas donde no están todos los casos completos para que se pueda calcular la matriz de correlaciones.
  mutate(across(3:13,as.numeric)) %>%  # estamos convirtiendo todas las columnas desde la 3 a la 13 a números. 
  select(3:13) %>% # estamos seleccionando exclusivament de la clumna 3 a la 13 para calcular la matriz de correlaciones
  rename(rehilete=`Elabora un rehilete siguiendo los pasos, asimismo, realiza el instructivo para su realización. ` , # para que la matriz de correlaciones tenga nombres breves de columna, cambiamos a nombres más breves
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
  cor %>%  # calculamos la matriz de correlación
  corrplot # graficamos la matriz de correlación en un diagrama visualmente interpretable.

  