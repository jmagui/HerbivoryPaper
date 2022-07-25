

library(ggplot2)
library(tidyverse)
library(dbplyr)

getwd()

setwd("/Users/jessicaaguilar/Desktop/Temporary.data.folder")


data <- read.csv('Herbivory.paper_toothcounting2022.02.01.csv')

toothnumber_plot <- ggplot(data = data) +
  theme_classic() +
  geom_boxplot(aes(x= species, y= tooth.number_with.base.teeth)) +
  theme(panel.border = element_rect(linetype = "solid", fill = NA)) +
  ylab("tooth.number_with.base.teeth") +
  xlab("species") +
  scale_y_continuous(limits = c(0, 11), breaks=seq(0,13,2)) +
  geom_point(aes(x= species, y= tooth.number_with.base.teeth), position = position_jitter(w = 0.2, h = 0))

toothnumber_plot.plot

toothnumber.aov <- aov(tooth.number_with.base.teeth ~ species, data = data)
summary(toothnumber.aov)
TukeyHSD(toothnumber.aov)

