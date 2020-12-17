#se inicia definiendo el directorio de trabajo 
setwd("C:/Users/matie/Desktop/Big Data/Tarea2_FOR_LOOP")
library("readr")
library("csv")
library("rvest")
library("data.table")
library("dplyr")
rm(list =ls())



#1) Cargue las bases de datos incoporando en cada una de ellas la variable "tamanio",
#donde indique de que tamaño es la empresa de ese país.(1 pto)

#empresas de chile 
grandes_chile<-read.csv ("grandes_chile.csv", sep = ";", row.names = 1)
grandes_chile$tamanio = "grande"

medianas_chile<-read.csv ("medianas_chile.csv", sep = ";", row.names = 1)
medianas_chile$tamanio = "mediana"

pequeñas_chile<-read.csv ("pequena_chile.csv", sep = ";", row.names = 1)
pequeñas_chile$tamanio = "pequena"

micro_chile<-read.csv ("micro_chile.csv", sep = ";", row.names = 1)
micro_chile$tamanio = "micro"


#empresas de colombia 
grandes_colombia<-read.csv ("grandes_colombia.csv", sep = ";", row.names = 1)
grandes_colombia$tamanio = "grande"

medianas_colombia<-read.csv ("medianas_colombia.csv", sep = ";", row.names = 1)
medianas_colombia$tamanio = "mediana"

pequeñas_colombia<-read.csv ("pequena_colombia.csv", sep = ";", row.names = 1)
pequeñas_colombia$tamanio = "pequena"

micro_colombia<-read.csv ("micro_colombia.csv", sep = ";", row.names = 1)
micro_colombia$tamanio = "micro"

#empresas de peru 


grandes_peru<-read.csv ("grandes_peru.csv", sep = ";", row.names = 1)
grandes_peru$tamanio = "grande"

medianas_peru<-read.csv ("medianas_peru.csv", sep = ";", row.names = 1)
medianas_peru$tamanio = "mediana"

pequeñas_peru<-read.csv ("pequena_peru.csv", sep = ";", row.names = 1)
pequeñas_peru$tamanio = "pequena"

micro_peru<-read.csv ("micro_peru.csv", sep = ";", row.names = 1)
micro_peru$tamanio = "micro"

#2) Reuna todas las bases en una sola y defina de qué tipología (tipo de datos) son cada
#una de las variables que se encuentran en la data.(1 pto)

todo_chile <-  bind_rows(grandes_chile,medianas_chile,pequeñas_chile,micro_chile)[1:12]
todo_colombia <- bind_rows(grandes_colombia,medianas_colombia,pequeñas_colombia,micro_colombia)[1:12]
todo_peru <- bind_rows(grandes_peru,medianas_peru,pequeñas_peru,micro_peru)[1:12]

Todos_juntos <- bind_rows(todo_chile,todo_colombia,todo_peru)[1:12]

#se procede a definr la tipologia de los datos 

#fecha = char 
#pais = string 
#ingresos = Double
# costos = Double
#Procentaje_mujeres = Double
#exportaciones = Double
#importaciones = Double
#endeudamiento = Double
#morosidad = Double
#reservas = Double
#spread = Double
#tasa_interes = Double
#tamanio = string 


#Determine a través del uso de condicionales y/o for cuántas obervaciones tiene Peru
#versus Chile.(2 pto)


# se crean dos variables correspoondientes a chile y peru 
#para utlizar posteriormente con for e ir sumando observaciones 
#se empieza con el numero 0 

obs_chile <- 0
obs_peru <- 0

compara_ch_pe <- function(Todos_juntos){

  for (to in 1:(length(Todos_juntos[["pais"]]))){
#contador de observaciones de chile     
    if((Todos_juntos)[["pais"]][to] == "chile"){
      obs_chile <- obs_chile + 1
#contador de observaciones de peru  
    }else if((Todos_juntos)[["pais"]][to] == "peru"){
      obs_peru <- obs_peru + 1 
    }
  }
  print(paste("Chile tiene", obs_chile,"observaciones comparado con Peru  que tiene", obs_peru,"observaciones."))
}
compara_ch_pe(Todos_juntos)

#Determine a través del uso de condicionales y/o for ¿cuál es el país con mayor
#ingresos de explotación para los años que considera la muestra.(2 pto)
Todos_juntos <- as.numeric(Todos_juntos)

ingre_chl <- print(sum(todo_chile[]/nrow(todo_chile[2])))
sum(todo_chile[1,2],todo_chile[2,2])


