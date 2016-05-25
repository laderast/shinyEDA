#Code to process dataset A
library(dplyr)

#load dataset A

datasetA <- read.delim("data/datasetA.txt",row.names = 1)
datasetA <- datasetA %>% filter(startWeights != 9999 & endWeights != 9999)
datasetA <- datasetA %>% mutate(weightLoss = startWeights - endWeights, weightLossPerDay = weightLoss / timeElapsed)
datasetA <- na.omit(datasetA)
dataset <- datasetA

#Code to process dataset B

datasetB <- read.csv("data/datasetB.csv", row.names = 1)
datasetB <- datasetB %>% filter(staffID1 != "S3")
datasetB <- na.omit(datasetB)
datasetB <- datasetB %>% mutate(weightLoss = (startWeight - endWeight) * 2.2, 
                                weightLossPerDay = weightLoss / timeElapsed)
dataset <- datasetB

#Code to combine the two datasets
#Here we select columns for each dataset (treatment and weight)
#in order to make the two datasets comparable, we make both genders lowercase 
#(coverting it to a character), but then we have to recast it as a 
#factor (categorical variable)
datasetAselect <- datasetA %>% mutate(site="A", gender=factor(tolower(gender))) %>% 
  select(treatment, weightLossPerDay, site, gender)

datasetBselect <- datasetB %>% mutate(site="B", gender=factor(tolower(gender))) %>% 
  select(treatment, weightLossPerDay, site, gender)

dataset <- rbind(datasetAselect, datasetBselect)

#have to recast site as a factor because it's a character
dataset$site <- factor(dataset$site)
