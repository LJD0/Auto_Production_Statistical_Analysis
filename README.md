# MechaCar_Statistical_Analysis

### Linear Regression to Predict MPG

<img alt='Linear Regression Output' style='width: 80vw;' src='https://github.com/LJD0/MechaCar_Statistical_Analysis/blob/main/Output/Linear_Regression.png'>

1. The variables/coefficients that provided a non-random amount of variance to the mpg values in the dataset are: AWD, ground_clearance, spoiler_angle, vehicle_weight, and vehicle_length. The summary of the model shows that the ground_clearance and vehicle_length variables had the highest impact on mpg values, with a significant p-value of 5.21e-08 and 2.60e-12, respectively. The AWD and spoiler_angle variables had a less significant impact on mpg values, with p-values of 0.1852 and 0.3069, respectively. The vehicle_weight variable had a marginal impact on mpg values, with a p-value of 0.0776. This is concluded from the coefficient table in the summary, where the p-values for all of these variables are less than 0.05, indicating that there is strong evidence to reject the null hypothesis that the coefficients for these variables are zero
2. The slope of the linear model is not considered to be zero. The coefficients table in the summary shows that all the variable/coefficients have non-zero estimates, which means that they have an effect on the dependent variable mpg, some more than others though.
3. The linear model does predict mpg of MechaCar prototypes effectively to some extent. The R-squared value of 0.7149, means that 71.49% of the variance in mpg is explained by the independent variables, which is quite high. The F-statistic and its p-value also indicate that the model is a good fit for the data. However, it should be noted that the Residual standard error of 8.774, indicates that the model does not perfectly fit the data. Additionally, the p-value of AWD variable is 0.1852 which is greater than 0.05, it means the variable is not statistically significant. Therefore, there might be room for improvement in the model or additional variables that could be included to improve the predictive ability.

### Summary Statistics on Suspension Coils

<img alt='Total Summary' style='width: 80vw;' src='https://github.com/LJD0/MechaCar_Statistical_Analysis/blob/main/Output/total_summary.png'>

<img alt='Lot Summary' style='width: 80vw;' src='https://github.com/LJD0/MechaCar_Statistical_Analysis/blob/main/Output/Lot_Summary.png'>

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Based on the provided data, it appears that the current manufacturing data does meet this design specification for all the lots together (with the total variance for the suspension coils is 62.29356); but when we look at each lot individually, the variance of Lot1 and Lot2 are within the design specification of 100 pounds per square inch, but Lot3 is 170 which exceeds the design specification of 100 pounds per square inch. Therefore, the current manufacturing data does not meet the design specification for Lot3.

It's worth mentioning that variances are used as a measure of spread, it's a measure of how much the data deviates from the mean, and it's affected by outliers. It's possible that Lot3 contains some outliers that are causing the high variance. It's always important to check the data and make sure that the high variance is not caused by outliers or measurement errors.

### T-Tests on Suspension Coils

<img alt='All Lot t.test' style='width: 80vw;' src='https://github.com/LJD0/MechaCar_Statistical_Analysis/blob/main/Output/All_lot_ttest.png'>

<img alt='Lot 1 t.test' style='width: 80vw;' src='https://github.com/LJD0/MechaCar_Statistical_Analysis/blob/main/Output/Lot1_ttest.png'>

<img alt='Lot 2 t.test' style='width: 80vw;' src='https://github.com/LJD0/MechaCar_Statistical_Analysis/blob/main/Output/Lot2_ttest.png'>

<img alt='Lot 3 t.test' style='width: 80vw;' src='https://github.com/LJD0/MechaCar_Statistical_Analysis/blob/main/Output/Lot3_ttest.png'>

The t-test results show that, the PSI across all manufacturing lots is not statistically different from the population mean of 1,500 pounds per square inch.

The p-value for lot1 is 1, which is greater than the commonly used threshold of 0.05, this means that there is not enough evidence to suggest that the mean of lot1 is different from the population mean of 1500.

The p-value for lot2 is 0.6072, which is greater than the commonly used threshold of 0.05, this means that there is not enough evidence to suggest that the mean of lot2 is different from the population mean of 1500.

The p-value for lot3 is 0.04168, which is less than the commonly used threshold of 0.05, this means that there is enough evidence to suggest that the mean of lot3 is different from the population mean of 1500. However, it's important to note that the mean of lot3 is still close to the population mean, and the difference is not large.

In summary, the t-test results suggest that the PSI for lot1 and lot2 is not statistically different from the population mean of 1,500 pounds per square inch, while for lot3 the PSI is statistically different from the population mean. However, the difference is not large and should be considered in the context of the specific manufacturing process.

## Study Design: MechaCar vs Competition

The goal of this study is to compare the performance of MechaCar vehicles against performance of vehicles from other manufacturers in order to quantify how MechaCar performs against the competition. We will test several metrics of measurement; vehicle length, weight, ground clearance, spoiler angle, all wheel drive capability, suspension PSI and ultimately miles per gallon.

The null hypothesis of this study is that the MPG of MechaCar vehicles is not different from that of vehicles from other manufacturers. The alternative hypothesis is that the MPG of MechaCar vehicles is different from the that of vehicles from other manufacturers.

To test this hypothesis, we will use a two-sample t-test.

The data needed to run this statistical test includes:

- The vehicle length, weight, ground clearance, spoiler angle, all wheel drive capability, suspension PSI, and miles per gallon of MechaCar vehicles.
- The vehicle length, weight, ground clearance, spoiler angle, all wheel drive capability, suspension PSI, and miles per gallon of vehicles from other manufacturers.

To run this study using R and the tidyverse library:

    mechacar_data <- read.csv("mechacar_data.csv")
    other_manufacturer_data <- read.csv("other_manufacturer_data.csv")

    t.test(mechacar_data$mpg, other_manufacturer_data$mpg, alternative = "two.sided", var.equal = TRUE)

\*Additional data cleaning may be needed between the import and the t.test*
