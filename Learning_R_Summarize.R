#Learning to describe and summarize 

#Range -> centrality -> variance -> sumarize -> create tables 

library(tidyverse)
library(dplyr)
data()
view(msleep)
glimpse(msleep)

#Describe the spread of data 
min(msleep$awake)
max(msleep$awake)
range(msleep$awake)
IQR(msleep$awake)
mean(msleep$awake)
median(msleep$awake)
var(msleep$awake)

#Summarize the variable 
summary(msleep)
summary(msleep$sleep_total)

msleep %>% 
  select(sleep_total, brainwt) %>% 
  summary()

#Create a summarizing table 
view(msleep)
#takign all the "vore" variables 
#show min max range and avr
msleep %>% 
  drop_na(vore) %>% 
  group_by(vore) %>% 
  summarise(Lower = min(sleep_total),
            Average = mean(sleep_total),
            Upper = max(sleep_total),
            Difference = 
              max(sleep_total)-min(sleep_total)) %>% 
  arrange(Average) %>% 
  View()

#Now to create a contigency table 
library(MASS)
attach(Cars93)

glimpse(Cars93)

table(Origin)
table(AirBags, Origin)
addmargins(table(AirBags, Origin),1)
addmargins(table(AirBags, Origin),2)

table(AirBags, Origin)
prop.table(table(AirBags, Origin),2)*100
round(prop.table(table(AirBags, Origin),2)*100)

Cars93 %>% 
  group_by(Origin, AirBags) %>% 
  summarise(number = n()) %>% 
  pivot_wider(names_from = Origin,
              values_from = number)
