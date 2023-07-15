library(tidyverse)

library(dplyr)

# Import csv to dataframe
mecha_car_file <- read.csv("Resources/MechaCar_mpg.csv", check.names = F, stringsAsFactors = F)

# Create a linear model
model <- lm(mpg ~ AWD + ground_clearance + spoiler_angle + vehicle_weight + vehicle_length, data = mecha_car_file) # generate multiple linear regression model
summary(model)

# Import Suspensioin Coil Data

suspension_file <- read.csv("Resources/Suspension_Coil.csv")

suspension_summary <- suspension_file %>%
    summarize(
        mean = mean(PSI),
        median = median(PSI),
        variance = var(PSI),
        sd = sd(PSI)
    )


lot_summary <- suspension_file %>%
    group_by(Manufacturing_Lot) %>%
    summarize(
        mean = mean(PSI),
        median = median(PSI),
        variance = var(PSI),
        sd = sd(PSI)
    )

print(suspension_summary)
print(lot_summary)
# T-Test on Suspension Coils

# get psi data
psi <- suspension_file$PSI

# Set the population mean
population_mean <- suspension_summary$mean

# Perform t-test for all lots
result <- t.test(psi, mu = population_mean)
print(result)

# Perform t-test for lot1
lot1 <- subset(suspension_file, suspension_file$Manufacturing_Lot == "Lot1")
result_lot1 <- t.test(lot1$PSI, mu = population_mean)
print(result_lot1)

# Perform t-test for lot2
lot2 <- subset(suspension_file, suspension_file$Manufacturing_Lot == "Lot2")
result_lot2 <- t.test(lot2$PSI, mu = population_mean)
print(result_lot2)

# Perform t-test for lot3
lot3 <- subset(suspension_file, suspension_file$Manufacturing_Lot == "Lot3")
result_lot3 <- t.test(lot3$PSI, mu = population_mean)
print(result_lot3)
