## AnalyzeCRP
### Single and multiple regressions, and scatterplots for clinical bloodwork and gene expression data.
([AnalyzeBloodwork.R](../master/AnalyzeBloodwork.R)) will allow you to load a comma-delimited .csv with various datapoints, perform single and multiple regressions of Body Mass Index (BMI) vs. CRP from the Complete Blood Count with Differential (CBC-D) results, and produce 2-D and 3-D scatterplots for the results. 

Add paragraph 

Data (RobinsonEtAl_Sup1.csv) was downloaded from: 

Robinson, JM. et al. 2019. Complete blood count with differential: An effective diagnostic for IBS subtype in the context of BMI? BioRxiv. doi: https://doi.org/10.1101/608208.

### Results of single regression, BMI x CRP
```
> CRP.regression <- lm(BMI ~ CRP, data=IBS)
> print(CRP.regression)

Call:
lm(formula = BMI ~ CRP, data = IBS)

Coefficients:
 (Intercept)          CRP  
    25.4076       0.5737  

```

![](fig_output/CRP_scatterplot.png)
##
##
### Results of ANOVA: IBS-subtype vs. Bloodwork parameter (CRP)
```
> CRP.aov <- aov(CRP ~ IBS.subtype, data = IBS)
> print(CRP.aov)

Call:
   aov(formula = CRP ~ IBS.subtype, data = IBS)

Terms:
                IBS.subtype Residuals
Sum of Squares       2.7264 1217.4178
Deg. of Freedom           1       107

Residual standard error: 3.37309
Estimated effects may be unbalanced
2 observations deleted due to missingness
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.354 on 106 degrees of freedom
  (2 observations deleted due to missingness)
Multiple R-squared:  0.232,	Adjusted R-squared:  0.2175 
F-statistic: 16.01 on 2 and 106 DF,  p-value: 8.388e-07
```
```
s3d <- scatterplot3d(IBS$BMI, IBS$SerumCortisol, IBS$CRP,  pch=16, color="steelblue", box="TRUE", highlight.3d=FALSE, type="h", main="BMI x Cortisol x CRP")
fit <- lm(SerumCortisol ~ BMI + CRP, data=IBS)
s3d$plane3d(fit)
```
![BMI_Cortisol_CRP_3d-scatterplot](../master/Images/MultipleRegression_3way.png?sanitize=true)
##
