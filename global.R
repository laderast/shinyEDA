library(shiny)
library(ggplot2)
library(dplyr)

###Put Data processing steps here
#load dataset A

datasetA <- read.delim("data/datasetA.txt",row.names = 1)
datasetA <- datasetA %>% filter(startWeights != 9999 & endWeights != 9999)
datasetA <- datasetA %>% mutate(weightLoss = startWeights - endWeights, 
                                weightLossPerDay = weightLoss / timeElapsed)
datasetA <- na.omit(datasetA)
dataset <- datasetA

#Code to process dataset B

datasetB <- read.csv("data/datasetB.csv", row.names = 1)
#dataset <- datasetB

##Don't modify anything below here, or app won't work properly.

#get the variable types
varClass <- sapply(dataset, class)

#separate the variables into each type
categoricalVars <- names(varClass[varClass == "character"])
numericVars <- names(varClass[varClass %in% c("numeric", "integer")])