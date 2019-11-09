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

```
### Results of Scatterplots
```
ggplot(IBS, aes(x=BMI, y=CRP)) +
  geom_point() +    
  geom_smooth(method=lm) 

```
![](fig_output/CRP_scatterplot.png)

![BMI_Cortisol_CRP_3d-scatterplot](../master/Images/MultipleRegression_3way.png?sanitize=true)
##
