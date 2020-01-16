# import ####
library(dplyr)
# table mod
library(nycflights13)
# import tables
flights <- flights
weather <- weather
planes <- planes
airports <- airports  
airlines <- airlines
# PARTIE 1 ####
# Question 1
colnames(flights)
names(flights)

# Question 2
# Nombre de NA : Distance - durée - retard ' depart ' et 'arrive'
na_flights_distance <- sum(is.na(flights['distance']))
na_flights_duration <- sum(is.na(flights['air_time']))
na_flights_dep_delay <- sum(is.na(flights['dep_delay']))
na_flights_arr_delay <- sum(is.na(flights['arr_delay']))
# Nouvelle liste
liste <- flights %>% 
  filter(is.na(distance)|
           (is.na(air_time))|
           (is.na(dep_delay))|
           (is.na(arr_delay)))

# Reponse question
# Distance : ne dispose pas de missing value 
# air_time : Aucun retraitement 
# dep_delay : #voir condition meteo
# arr_delay: # aucune certitude d'arrivé

# STATISTIQUE
#somme avion non partie
#moyenne des arrivées et sorties / min / max
#ecart type : retard

delay_data <-  summarise(flights, dep_del_mean = mean(flights$dep_delay, na.rm = TRUE), 
                         arr_del_mean = mean(flights$arr_delay, na.rm = TRUE),
                         dep_del_min = min(flights$dep_delay, na.rm = TRUE),
                         arr_del_min = min(flights$arr_delay, na.rm = TRUE),
                         dep_del_max = max(flights$dep_delay, na.rm = TRUE),
                         arr_del_max = max(flights$arr_delay, na.rm = TRUE))

airport_data <- flights %>% 
  group_by(origin) %>%
  summarise(dep_del_mean = mean(dep_delay, na.rm = TRUE), 
            arr_del_mean = mean(arr_delay, na.rm = TRUE),
            dep_del_min = min(dep_delay, na.rm = TRUE),
            arr_del_min = min(arr_delay, na.rm = TRUE),
            dep_del_max = max(dep_delay, na.rm = TRUE),
            arr_del_max = max(arr_delay, na.rm = TRUE))

# On observe une différence entre les 3 aeroports, cependant les données à l'état actuel ne reflete aucune tendance sur les raisons de cette disparités.
# La disparités de EWK.


# Les données year, month, day, hours, minutes, font office de doublons avec time_hour

# Il faut comparer l'activité méteo : avant le vol, durant le vol,
# les aeroports de depart sont tous situé a New york
# les analyses meteo ne depende que des trois aeroports de depart.
# la destination ne semble pas avoir d'impacte, nous n'avons aucun controle dessus.


# Merge on time hour & origin


















cleaned <- remove(list=ls())  