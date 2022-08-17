library(ggplot2)
library(tidyverse)
library(dbplyr)

getwd()

setwd("/Users/jessicaaguilar/Desktop/Temporary.data.folder")

data <- read.csv('gut_mouthhook_cleaned_2022.02.22.csv')


shape_data<- read.csv("mouthookshape_area_2022.03.23.csv")


data2 <-
  mutate(data,
         gut_body = gut/body,
         skeleton_body = skeleton/body
  )

#plots for mouthhook and gut sizes, shapes 


##gut length / body

gut.plot <- ggplot(data = data2) +
  theme_classic() +
  geom_boxplot(aes(x= species, y= gut_body)) +
  theme(panel.border = element_rect(linetype = "solid", fill = NA)) +
  ylab("gut/body") +
  xlab("species") +
  geom_point(aes(x= species, y= gut_body), position = position_jitter(w = 0.2, h = 0))

gut.plot

gut.aov <- aov(gut_body ~ species, data = data2)
summary(gut.aov)
TukeyHSD(gut.aov)

##cephaloskeleton/body 

skeleton.plot <- ggplot(data = data2) +
  theme_classic() +
  geom_boxplot(aes(x= species, y= skeleton_body)) +
  theme(panel.border = element_rect(linetype = "solid", fill = NA)) +
  ylab("cephaloskeleton/body") +
  xlab("species") +
  geom_point(aes(x= species, y= skeleton_body), position = position_jitter(w = 0.2, h = 0))

skeleton.plot

skeleton.aov <- aov(skeleton_body ~ species, data = data2)
summary(skeleton.aov)
TukeyHSD(skeleton.aov)

##mouthhook height/ length

mh_base_ratio.plot <- ggplot(data = shape_data) +
  theme_classic() +
  geom_boxplot(aes(x= species, y= bottomlength_baseheight_ratio)) +
  theme(panel.border = element_rect(linetype = "solid", fill = NA)) +
  ylab("bottom height / base length") +
  xlab("species") +
  geom_point(aes(x= species, y= bottomlength_baseheight_ratio), position = position_jitter(w = 0.2, h = 0))

mh_base_ratio.plot


mh_base_ratio.aov <- aov(bottomlength_baseheight_ratio ~ species, data = shape_data)
summary(mh_base_ratio.aov)
TukeyHSD(mh_base_ratio.aov)



##toothsize 

toothsize.plot <- ggplot(data = shape_data) +
  theme_classic() +
  geom_boxplot(aes(x= species, y= tooth_size)) +
  theme(panel.border = element_rect(linetype = "solid", fill = NA)) +
  ylab("toothsize (mm)") +
  xlab("species") +
  geom_point(aes(x= species, y= tooth_size), position = position_jitter(w = 0.2, h = 0))

toothsize.plot

toothsize.aov <- aov(tooth_size ~ species, data = shape_data)
summary(toothsize.aov)
TukeyHSD(toothsize.aov)


