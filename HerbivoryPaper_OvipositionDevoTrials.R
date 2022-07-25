library("coin")
library (tidyverse)

setwd("/Users/jessicaaguilar/Desktop/Temporary.data.folder")


all_trials = read.csv("HerbivoryPaper_ChoiceTrials_Long_20220725.csv", header = T)

# TEST FOR SIGNIFICANCE (s flava)

flava_trials = subset(all_trials, species == "S. flava")
flava_trials$cage = as.factor(flava_trials$cage)
flava_trials$food.type = as.factor(flava_trials$food.type)
flava_trials$egg.count = as.numeric(flava_trials$egg.count)


# flava stats - per cage, are there significant differences in eggs per foodtype?

kruskal_test(flava_trials$egg.count ~ flava_trials$food.type | flava_trials$cage, distribution = approximate(nresample = 1e7))
# chi-squared = 19.767, p-value = 4.82e-05

#total flava egg number
sum(flava_trials$egg.count)
#34

#number of flava trials with eggs 
flava_trialsbycage <- group_by(flava_trials, cage)
flava_egg.count <- summarize(flava_trialsbycage, cage_eggs = sum(egg.count))
flava_egg.count$cage_eggs <- as.numeric(flava_egg.count$cage_eggs)

flava_eggs <- subset(flava_egg.count, cage_eggs > 0)

flava_witheggs <- subset(flava_trials, cage %in% flava_eggs$cage)

flava_summary <-flava_witheggs %>% 
  group_by(food.type) %>% 
  summarise(mean = mean(egg.count),
            se = sd(egg.count)/sqrt(n()),
            max = mean+se,
            min = mean-se )
flava_summary 

flava_plot <-  flava_summary %>% 
  ggplot(aes(x=food.type, y= mean, ymin = min, ymax = max)) +
  geom_errorbar() +
  geom_col()+
  theme_classic()+
  ylim(0, 18)
flava_plot
ggsave("flava_bar.pdf", width = 4.5, height = 3.5)

# TEST FOR SIGNIFICANCE (dmel)

dmel_trials = subset(all_trials, species == "D. melanogaster")
dmel_trials$cage = as.factor(dmel_trials$cage)
dmel_trials$food.type = as.factor(dmel_trials$food.type)
dmel_trials$egg.count = as.numeric(dmel_trials$egg.count)


# flava stats - per cage, are there significant differences in eggs per foodtype?

kruskal_test(dmel_trials$egg.count ~ dmel_trials$food.type | dmel_trials$cage, distribution = approximate(nresample = 1e7))
# chi-squared = 21.902, p-value = 1.51e-05

#total flava egg number
sum(dmel_trials$egg.count)
#130

#number of flava trials with eggs 
dmel_trialsbycage <- group_by(dmel_trials, cage)
dmel_egg.count <- summarize(dmel_trialsbycage, cage_eggs = sum(egg.count))
dmel_egg.count$cage_eggs <- as.numeric(dmel_egg.count$cage_eggs)

dmel_eggs <- subset(dmel_egg.count, cage_eggs > 0)

dmel_witheggs <- subset(dmel_trials, cage %in% dmel_eggs$cage)

dmel_summary <-dmel_witheggs %>% 
  group_by(food.type) %>% 
  summarise(mean = mean(egg.count),
            se = sd(egg.count)/sqrt(n()),
            max = mean+se,
            min = mean-se )
dmel_summary 

dmel_plot <-  dmel_summary %>% 
  ggplot(aes(x=food.type, y= mean, ymin = min, ymax = max)) +
  geom_errorbar() +
  geom_col()+
  theme_classic()+
  ylim(0, 18)
dmel_plot
ggsave("dmel_bar.pdf", width = 4.5, height = 3.5)



## DEVELOPMENT TRIALS

survivors = read.csv("genome_larval.devo_2019.01.03.csv", header = T)
survivors$food.type = as.factor(survivors$food.type)

kruskal_test(survivors$total.numb.flies ~ survivors$food.type, distribution = approximate(nresample = 1e7))
# chi-squared = 24.712, p-value = 9e-07



###box plot for survival data 
library(ggplot2)
survivor_plot <- ggplot(data = survivors) +
  theme_classic() +
  geom_boxplot(aes(x= food.type, y=total.numb.flies)) +
  theme(panel.border = element_rect(linetype = "solid", fill = NA)) +
  ylab("# of adults emerged") +
  xlab("food type") +
  geom_point(aes(x= food.type, y= total.numb.flies), position = position_jitter(w = 0.2, h = 0))

survivor_plot

#calculate percent emerged (out of 6 bc that is the number of larvae added to each trial)
percent.emerged = survivors$total.numb.flies/6

percent.emerged_plot <- ggplot(data = survivors) +
  theme_classic() +
  geom_boxplot(aes(x= food.type, y=percent.emerged)) +
  theme(panel.border = element_rect(linetype = "solid", fill = NA)) +
  ylab("% of adults emerged/cage") +
  xlab("food type") +
  geom_point(aes(x= food.type, y= percent.emerged), position = position_jitter(w = 0.2, h = 0))

percent.emerged_plot


percent.emerged_aov <- aov(percent.emerged ~ food.type, data = survivors)
summary(percent.emerged_aov)
TukeyHSD(percent.emerged_aov)

