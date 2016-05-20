library(shiny)
library(ggplot2)
library(dplyr)

###Put Data processing steps here
#load dataset A
dataset <- read.delim("data/datasetA.txt",row.names = 1)

#uncomment this line to load dataset B
#dataset <- read.csv("data/datasetB.csv", row.names= 1)


##Don't modify anything below here, or app won't work properly.

#get the variable types
varClass <- sapply(dataset, class)

#separate the variables into each type
categoricalVars <- names(varClass[varClass == "factor"])
numericVars <- names(varClass[varClass %in% c("numeric", "integer")])