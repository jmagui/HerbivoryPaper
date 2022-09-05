# HerbivoryPaper
code and data for paper describing trophic niche of S. flava


##File List
###Figure 1
  LarvalDevo_2019.01.03.csv
  ChoiceTrials_Long_20220725.csv
  HerbivoryPaper_Fig1_OvipositionDevoTrials.R

###Figure 2
  gut_mouthhook_cleaned_2022.02.22.csv
  mouthookshape_area_2022.03.23.csv
  toothcounting2022.02.01.csv
  HerbivoryPaper_Fig2_MorphologyPanel.R

###Figure 3   
  HerbivoryPaper_IsotopeData_20220715.csv
  food_sterol_percentages.csv
  food_sterol_percentages_wide.csv
  fly_sterol_percentages.csv
  fly_sterol_percentages_wide.csv
  HerbivoryPaper_Fig3abc_SterolFigure.R
  HerbivoryPaper_Fig3e_IsotopeCode.R
  
###Supplementary Figure 1 
  HerbivoryPaper_OriginOfHerbivory_20220905.csv


##File Descriptions
###Figure 1
  LarvalDevo_2019.01.03.csv - counts of S. flava adults across three different emergence dates in 3 different food types and the sums of emergences in each container.
  * container.ID - running id number for containers. each container has 1 foodtype
  * food.type - type of food that S. flava larvae were transplanted to
  * Numb.flies_12.20.18 - number of flies emerged on december 20, 2018
  * Numb.flies_12.27.18 - number of flies emerged on December 27. 2018
  * Numb.flies_01.03.2019 - number of flies emerged on January 3, 2019
  * total.numb.flies - sum of all flies emerged

  ChoiceTrials_Long_20220725.csv - S. flava and D. melanogaster were given a choice of three foodtypes. We counted eggs in each foodtype. This data has been tidied into a long format for data analysis
  * cage - running cage number for S. flava and D. melanogaster trials
  * dmel.cage - running cage number for D. melanogaster trials ONLY
  * colony.source - person in lab who contributed flies for the particular cage (all come from the same source colony)
  * date.started - date trial started
  * time.started - time trial started
  * date.ended - date trial ended
  * time.ended - time trial ended
  * species - species of fly being tested
  * food.type - type of food (yeast, rotten plant and fresh plant in each cage)
  * egg.count - number of eggs in each food type/cage

    HerbivoryPaper_Fig1_OvipositionDevoTrials.R - code for making figures 2a and 2b and running statistical analysis.

###Figure 2
  gut_mouthhook_cleaned_2022.02.22.csv - measurements of body length, gut length and cephaloskeleton length. measurements performed in imagej and can be found in this google drive link:https://drive.google.com/drive/folders/1pjcvrwrRn0PVIEtwqwPEIDmYqlpHSJXv?usp=sharing
  * fly_id - running count of flies measured
  * species - species of fly measured
  * vial_date - date on vial flies were pulled from to keep track of source
  * body - body length (mm)
  * gut - gut length (mm)
  * skeleton - length of cephaloskeleton (mm)
  * dissection_date - date dissection was performed

  mouthookshape_area_2022.03.23.csv - measurements of overall mouthhook shape and size, as well as tooth measurements of D. melanogaster, S. flava, S. pallida, S. hsui. Pictures can be found here: https://drive.google.com/drive/folders/1S_ffEHlL8addY7IakF0s_vHup0BGkzAp?usp=sharing
  * pic_id - id number of picture
  * species - fly species measured
  * bottom_top - measurement at the base of the mouthhook
  * top_tip - measurement from the top of the mouthhook to the tip
  * tip_bottom - measurement along the bottom of the mouth hook from the tip to the bottom of the base
  * longest_base_tooth 	- measurement from the tip of the longest tooth to the top of the mouth hook (tooth closest to base was the longest for all species)
  * long_tooth_base	measurement - measurement from the base of the longest tooth to the top of the mouth hook
  * area	- measurement of the area of the mouth hook
  * tooth_size 	- long_tooth_base subtracted from longest_base_tooth
  * toplength_bottomlength_ratio	- top_tip divided by tip_bottom
  * bottomlength_baseheight_ratio	- tip_bottom divided by bottom_top
  * notes

  toothcounting2022.02.01.csv - counts of teeth on the mouthhooks of D. melanogaster, S. flava, S. pallida, S. hsui. Pictures can be found here: https://drive.google.com/drive/folders/1S_ffEHlL8addY7IakF0s_vHup0BGkzAp?usp=sharing
  * id - picture id
  * species - fly species measured
  * tooth.number_no.base.teeth	- tooth number without including the large tooth closest to the base
  * tooth.number_with.base.teeth	- tooth number including the large tooth at the base
  * notes

  HerbivoryPaper_Fig2_MorphologyPanel.R - code for making figures 3a, 3b, 3d, 3e, 3f and running statistical analysis

###Figure 3
  food_sterol_percentages.csv & food_sterol_percentages_wide.csv - sterol percentages in the various fly food types; one in long format for making figures and one in wide format for Bray Curtis dissimilarity calculations in vegan

  fly_sterol_percentages.csv & fly_sterol_percentages_wide.csv - sterol percentages in the fly bodies or pupa; one in long format for making figures and one in wide format for Bray Curtis dissimilarity calculations in vegan

   HerbivoryPaper_IsotopeData_20220715.csv - data that was used in the isotope figure; most data points pulled form literature, and one data point on S. flava measured in the lab
   * source - paper in which data was found
   * order - biological order
   * family - biological family
   * class_narrow - more specific food type
   * class_broad - herbivore vs microbivore
   * d15N - insect minus diet 15N
   * SEM_d15N - standard error of the mean for d15N measure
   * source.code - 0=literature, 1=lab

   HerbivoryPaper_Fig3abc_SterolFigure.R - code for making figures 3a, 3b, 3c
   HerbivoryPaper_Fig3e_IsotopeCode.R - code for making figure 3e
   
   
###Supplementary figure 1 
  HerbivoryPaper_OriginOfHerbivory_20220905.csv
  * Order - biological order 
  * Herbivorous lineage - lineage within order that is herbivorous 
  * Herbivorous species with reference genome - Searched from InsectBase 2.0 (http://v2.insect-genome.com/Genome). Add at least one species that represents a taxon with herbivory
  * Stem age of the lineage (estimated origin of herbivory)
  * Crown age of the lineage
  * Reference - paper where data was described
  * Comments

