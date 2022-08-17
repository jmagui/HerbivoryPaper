#download packages
install.packages("ggplot2")
install.packages("tidyverse")
install.packages("dbplyr")
install.packages("vegan")

#open libraries
library(ggplot2)
library(tidyverse)
library(dbplyr)
library("vegan")

#Set working directory 
getwd()
setwd("/Users/jessicaaguilar/Library/CloudStorage/Box-Box/Herbivory_paper/HerbivoryPaperRepository")


#MAKE STACKED BAR PLOT - FLIES

#pick color pallete 
library(wesanderson)
pal9 <- wes_palette("Zissou1", 9, type = "continuous")
pal11 <- wes_palette("Zissou1", 11, type = "continuous")
pal <- wes_palette("Zissou1", 100, type = "continuous")


#read data frame
fly.percentages <- read.csv('fly_sterol_percentages.csv')

#make plot
ggplot(fly.percentages, aes(fill=Sterol, y=percent, x=species)) + 
  geom_bar(position="stack", stat="identity") +
  theme_classic() +
  scale_fill_manual(values = pal9) 

##plots exported and aesthetics tweaked in Adobe illustrator 


#BRAY-CURTIS DISSIMILARITY CALCULATION - FLIES

#data frame in wide format for bray-curtis dissimilarity calculation
fly.percentages.wide <- read.csv('fly_sterol_percentages_wide.csv')

#removed species column (1 = dmel, 2 = hsui, 3 = flava)
fly.percentages.wide <- select(fly.percentages.wide, -"species")

#run bray-curtis dissimilarity calculation in vegan

fly_bcd <- vegdist(fly.percentages.wide, method='bray') %>% 
  as.matrix() %>% 
  as.data.frame()

#fix dataframe with labels
species1_list = c("dmel", "hsui","flava")
species2_list = c("dmel", "hsui","flava")

colnames(fly_bcd) <- species2_list

fly_bcd <- cbind(species1 = species1_list, fly_bcd)

#make bcd dataframe long
fly_bcd <- 
  gather(fly_bcd, "dmel", "hsui","flava", key = "species2", value = bcd.value)

fly_bcd

#plot bray-curtis dissimilarity for flies
ggplot(fly_bcd, aes(x = species1, y = species2, fill = bcd.value)) +
  geom_tile()+
  scale_fill_gradientn(colours = pal, limits = 0:1) +
  geom_text(aes(label = round(bcd.value, 2))) +
  theme_classic()

#BCD output for df validation
#         1         2
#2 0.5974026          
#3 0.7650000 0.6563437
###1=dmel 2=hsui 3=flava



#MAKE STACKED BAR PLOT - FOOD

#read in long dataframe
food.percentages <- read.csv('food_sterol_percentages.csv')

#plot food sterol percentages
ggplot(food.percentages, aes(fill=Sterol, y=percent, x=food.type)) + 
  geom_bar(position="stack", stat="identity") +
  theme_classic() +
  scale_fill_manual(values = pal11) 



#BRAY-CURTIS DISSIMILARITY CALCULATION - FOOD

#read in wide dataframe
food.percentages.wide <- read.csv('food_sterol_percentages_wide.csv')
food.percentages.wide <- select(food.percentages.wide, -"Sterol", -"bray.num")

#run bray curtis dissimilarity calculation in vegan 
food_bcd <- vegdist(food.percentages.wide, method='bray') %>% 
  as.matrix() %>% 
  as.data.frame()

#fix column names
food1_list = c("yeast", "spinach+yeast","rottenspinach", "arabidopsis")
food2_list = c("yeast", "spinach+yeast","rottenspinach", "arabidopsis")

colnames(food_bcd) <- food2_list

food_bcd <- cbind(food1 = food1_list, food_bcd)

#make dataframe long
food_bcd <- 
  gather(food_bcd, "yeast", "spinach+yeast","rottenspinach", "arabidopsis", key = "food2", value = bcd.value)

food_bcd


ggplot(food_bcd, aes(x = food1, y = food2, fill = bcd.value)) +
  geom_tile()+
  scale_fill_gradientn(colours = pal, limits = 0:1) +
  geom_text(aes(label = round(bcd.value, 2)))+
  theme_classic()

#BCD output for df validation
#         1         2         3
#2 0.2568885                    
#3 1.0000000 0.8990505          
#4 0.7748537 0.7701149 1.0000000

#1=yeast 2=spinach+yeast 3=rottenspinach 4=arabidopsis


