## BTEC330 Noelia Project2

## Install necessary packages
install.packages("ggplot2")
library(ggplot2)

## Read data
IBS <- read.csv("../data/RobinsonEtAl_Sup1.csv", header = TRUE)
head(IBS)
IBS$CRP_result <- "NA"

## Assign "HIGH", "NORMAL", or "LOW" based on clinical range to the CRP_result parameter

IBS$CRP_result[IBS$CRP > 3] <- "HIGH"

IBS$CRP_result[IBS$CRP <= 3 & IBS$LDH >= 1] <- "NORMAL"

IBS$CRP_result[IBS$CRP < 1] <- "LOW"

#source values for CRP parameter
#https://www.emedicinehealth.com/c_reactive_protein_blood_test_crp/article_em.htm#are_high_levels_of_c-reactive_protein_a_risk_of_heart_disease

write.csv(IBS, "../data_output/output.cvs")

##  Single Regressions for BMI vs. CRP
##  Data was obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html

#Single Regresion Test
CRP.regression <- lm(BMI ~ CRP, data=IBS)
summary(CRP.regression)

## Output the results to a file
## http://www.cookbook-r.com/Data_input_and_output/Writing_text_and_output_from_analyses_to_a_file/
sink('../data_output/CRP_regression.txt', append = TRUE)
print(CRP.regression)
sink()

## ANOVA: IBS-subtype vs. Bloodwork parameter
## http://www.sthda.com/english/wiki/one-way-anova-test-in-r
CRP.aov <- aov(CRP ~ IBS.subtype, data = IBS)
summary(CRP.aov)
sink('../data_output/CRP_anova.txt', append = TRUE)
print(CRP.aov)
sink()

## Print scatterplot and box plots as .png files into "fig_output" project directory.
## http://www.sthda.com/english/wiki/ggsave-save-a-ggplot-r-software-and-data-visualization

## Scatterplots
## https://www.statmethods.net/graphs/scatterplot.html

ggplot(IBS, aes(x=BMI, y=CRP)) +
  geom_point() +    
  geom_smooth(method=lm) 

png("../fig_output/CRP_scatterplot.png")
CRP_scatterplot <- ggplot(IBS, aes(x = BMI, y = CRP)) +
  geom_point() +    
  geom_smooth(method = lm) 
print(CRP_scatterplot)
dev.off()

## Box plots
## https://www.statmethods.net/graphs/boxplot.html
## example to add color taken from:
## https://www.tutorialspoint.com/r/r_boxplots.htm

boxplot(CRP ~ IBS.subtype, data = IBS, main="CRP by IBS subtype", 
        xlab = "IBS.subtype", ylab = "CRP",  col = c("green","yellow","purple")
)

png("../fig_output/CRP_boxplot.png")
CRP_boxplot <- boxplot(CRP ~ IBS.subtype, data = IBS, main="CRP by IBS subtype", 
       xlab = "IBS.subtype", ylab = "CRP"), col = c("green","yellow","purple"))
print(CRP_boxplot)
dev.off()
