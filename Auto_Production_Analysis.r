library(tidyverse)
library(dplyr)

# Import  prototype car production data
mecha_car_file <- read.csv(
    "Resources/MechaCar_mpg.csv", 
    check.names = F, 
    stringsAsFactors = F
    )


# Create a linear model
mecha_car_lm <- mecha_car_file %>%
    {lm(mpg ~ AWD + ground_clearance + spoiler_angle + vehicle_weight + vehicle_length, data = .)}

mecha_car_lm

# Summarize the linear model
summary(mecha_car_lm)

# vizualize the linear model

model_pred <- sum(mecha_car_lm$coefficients[c('AWD','ground_clearance', 'spoiler_angle', 'vehicle_weight', 'vehicle_length')]) * mecha_car_file$mpg + mecha_car_lm$coefficients['(Intercept)']

mecha_car_lm_plot <- mecha_car_lm %>%
    ggplot(aes(x = mpg)) +
    coord_cartesian(ylim = c(0, 125)) +
    geom_point(aes(y = AWD, color = "AWD"), size = 2) +
    geom_point(aes(y = ground_clearance, color = "Ground Clearance"), size = 2) +
    geom_point(aes(y = spoiler_angle, color = "Spoiler Angle"), size = 2) +
    geom_point(aes(y = vehicle_weight / 100, color = "Vehicle Weight"), size = 2) +
    geom_point(aes(y = vehicle_length, color = "Vehicle Length"), size = 2) +
    geom_line(aes(y = model_pred, color = "Linear Model"), size = 1) +
    scale_color_manual(
        values = c("AWD" = "violet", "Ground Clearance" = "purple", "Spoiler Angle" = "blue",
                "Vehicle Weight" = "green", "Vehicle Length" = "yellow", "Linear Model" = "red"),
        guide = guide_legend()
    ) +
    guides(color = guide_legend(override.aes = list(size = 3))) +
    labs(x = "MPG", y = "Variable Value", title = "Linear Model: Observed vs. Predicted") +
    labs(color = "Variables") +
    theme_minimal()

mecha_car_lm_plot

# Import Suspensioin Coil Data
suspension_file <- read.csv("Resources/Suspension_Coil.csv")

coil_psi_summary <- suspension_file %>%
    summarize(
        mean = mean(PSI),
        median = median(PSI),
        variance = var(PSI),
        sd = sd(PSI)
    )


lot_psi_summary <- suspension_file %>%
    group_by(Manufacturing_Lot) %>%
    summarize(
        mean = mean(PSI),
        median = median(PSI),
        variance = var(PSI),
        sd = sd(PSI)
    )

print(coil_psi_summary)
print(lot_psi_summary)
# T-Test on Suspension Coils

# isolate psi data
psi <- suspension_file$PSI

# Set the population mean
population_mean <- coil_psi_summary$mean

# Perform t-test for all lots
all_lot_test <- t.test(psi, mu = population_mean)
all_lot_test

lots <- unique(suspension_file$Manufacturing_Lot)

lot_results <- list()

for (lot in lots) {
    lot_data <- subset(suspension_file, suspension_file$Manufacturing_Lot == lot)
    result <- t.test(lot_data$PSI, mu = population_mean)
    lot_results[[lot]] <- result
}

lot_results
