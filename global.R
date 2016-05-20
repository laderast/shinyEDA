library(shiny)
library(ggplot2)
library(dplyr)

dataset <- read.delim("data/datasetA.txt",row.names = 1)

#  dataset <- dataset %>% filter(startWeights != 9999 & endWeights != 9999)
#  dataset <- dataset %>% mutate(weightLoss = startWeights - endWeights, percentWeight = weightLoss / timeElapsed)
#  dataset <- na.omit(dataset)

dataset <- read.csv("data/datasetB.csv", row.names= 1)
#dataset <- dataset %>% filter(nurseID != "Nurse3")
#dataset <- na.omit(dataset)
#dataset <- dataset %>% mutate(startWeight2 = startWeight * 2.2, 
#                              endWeight2 = endWeight * 2.2, weightLoss = startWeight2 - endWeight2, 
#                               percentWeight / timeElapsed)


##Don't modify anything below here, or app won't work properly.

#get the variable types
varClass <- sapply(dataset, class)

#separate the variables into each type
categoricalVars <- names(varClass[varClass == "factor"])
numericVars <- names(varClass[varClass %in% c("numeric", "integer")])