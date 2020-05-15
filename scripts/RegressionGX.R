## BTEC330 RgressionGX Noelia Ovejero

## Set working directory to source file location

setwd("./")

## Install necessary packages
install.packages("ggplot2")
library(ggplot2)

## Read data
IBS <- read.csv("../data/GSE124549_20200330.csv", header = TRUE)

head(IBS)

## Recursive analysis for regression  - RNA Expression

## Access only the columns with RNA Expression
names(IBS)[37:286]

##  Make a data frame of list type
storage <- list()

## Linear regression for each expressed gene
for(i in names(IBS)[37:286]){
  storage[[i]]  <- lm(get(i) ~ C.Reactive.Protein..CRP...mg.mL., IBS)
}

summary(storage$AGO2)
summary(storage$AGO2)$r.squared
summary(storage$AGO2)$coefficients[,4]

## Output the regresion report to a file
sink('../data_output/GenesvsCRP.txt', append = TRUE)
print(storage)
sink()

