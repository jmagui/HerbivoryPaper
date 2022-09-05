#set working directory 
setwd("~/Library/CloudStorage/Box-Box/Herbivory_paper/HerbivoryPaperRepository")

#install ggplot
install.packages("ggplot2")

#load ggplot library
library(ggplot2)

# load data
isotope = read.csv("HerbivoryPaper_SupTable2_IsotopeData_20220715.csv", h=T, na.string="NA")

#subset literature data (exclude lab data )
isotope2 <- subset(isotope, source.code == 0)

#get sample size 
table(isotope2$class_broad)

# make plot
# box plot made from literature data only, points include lab data (S. flava) in blue 
ggplot(data = isotope, aes(x=class_broad, y=d15N), ymin = -10, ymax = 8) +
  geom_boxplot(data = subset(isotope, source.code == 0), width = 0.7, outlier.shape = NA) +
  geom_pointrange(data = subset(isotope, source.code == 0 & class_narrow == "microbivore"), aes(ymin=d15N-SEM_d15N, ymax=d15N+SEM_d15N), 
                  position = position_jitter(width=0.15,height=0), size = 0.3, shape = 20, color = "dark grey") +
  geom_pointrange(data = subset(isotope, source.code == 0 & class_broad == "herbivore"), aes(ymin=d15N-SEM_d15N, ymax=d15N+SEM_d15N), 
                  position = position_jitter(width=0.1,height=0), size = 0.3, shape = 20, color = "dark grey") +
  geom_pointrange(data = subset(isotope, source.code == 1), aes(ymin=d15N-SEM_d15N, ymax=d15N+SEM_d15N), 
                  position = position_jitter(width=0.1,height=0), size = 0.3, shape = 20, color = "blue")

#run anova only including literature data
iso2.aov <- aov(d15N ~ class_broad, data = subset(isotope, source.code == 0))
summary(iso2.aov)
