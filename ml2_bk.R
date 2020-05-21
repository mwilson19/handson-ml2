library(tidyverse)
library(readxl)
library(skimr)

#hands on machine learning ski

setwd("C:/Users/mwilson/OneDrive - Hilton/Documents/Programming/projects/handson-ml2")

housing <- read_csv("./datasets/housing/housing.csv")

housing %>% skim()

ggplot(housing, aes(x = longitude, y = latitude))+
  geom_point(aes(colour = median_house_value / 1000, size = population / 100), alpha=0.2)+
  scale_color_gradientn(colours = heat.colors(5))

library(corrr)

#correlation 
house_cor <- housing %>% 
  select(-ocean_proximity) %>% 
  correlate() %>% 
  #focus(-ocean_proximity, mirror = TRUE) %>% 
  rearrange() %>% 
  shave()

fashion(house_cor)

rplot(house_cor)

house_cor %>% network_plot(min_cor = .10)
