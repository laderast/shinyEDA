#Code to process dataset A
library(dplyr)

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
#Here we select only two columns of each dataset (treatment and weight)
datasetAselect <- datasetA %>% mutate(site="A", gender=tolower(gender)) %>% select(treatment, weightLossPerDay, site, gender)
datasetBselect <- datasetB %>% mutate(site="B", gender=tolower(gender)) %>% select(treatment, weightLossPerDay, site, gender)

dataset <- rbind(datasetAselect, datasetBselect)
