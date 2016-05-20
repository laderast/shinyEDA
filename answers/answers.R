#Code to process dataset A

datasetA <- read.delim("data/datasetA.txt",row.names = 1)
datasetA <- datasetA %>% filter(startWeights != 9999 & endWeights != 9999)
datasetA <- datasetA %>% mutate(weightLoss = startWeights - endWeights, weightLossPerDay = weightLoss / timeElapsed)
datasetA <- na.omit(datasetA)
dataset <- datasetA

#Code to process dataset B

datasetB <- datasetB %>% filter(nurseID != "Nurse3")
datasetB <- na.omit(datasetB)
datasetB <- datasetB %>% mutate(weightLoss = (startWeight - endWeight) * 2.2, 
                               weightLossPerDay = weightLoss / timeElapsed)
dataset <- datasetB

#Code to combine the two datasets
#Here we select only two columns of each dataset (treatment and weight)
datasetAselect <- datasetA %>% mutate(site="A") %>% select(treatment, weightLossPerDay, site)
datasetBselect <- datasetB %>% mutate(site="B") %>% select(treatment, weightLossPerDay, site)

dataset <- rbind(datasetAselect, datasetBselect)
