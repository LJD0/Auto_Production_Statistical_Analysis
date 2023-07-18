# distribution plots
library(tidyverse)
library(dplyr)
density <- mtcars %>%
    ggplot( aes(
        x=wt
    )) + geom_density()

density

# shapiro test

shapiro.test(mtcars$wt)


?sample_n()
?slice_sample()

pop_table <- read.csv(
    'practice/used_car_data.csv',
    stringsAsFactors = FALSE,
    check.names = FALSE,
)
pop_table

pop_table_chart <- pop_table %>%
    ggplot( aes(
        x=log10(Miles_Driven)
    )) +
    geom_density()
pop_table_chart

sample_table <- pop_table %>%
    slice_sample(n=50)

sample_chart <- sample_table %>%
    ggplot( aes(
        x=log10(Miles_Driven)
    )) + 
    geom_density()
sample_chart

?t.test()

t.test(
    log10(sample_table$Miles_Driven),
    mu=mean(log10(pop_table$Miles_Driven))
)

# 2 sample t-test

sample1 <- pop_table %>%
    slice_sample(n=50)
sample2 <- pop_table %>%
    slice_sample(n=50)

t.test(
    log10(sample1$Miles_Driven),
    log10(sample2$Miles_Driven),
)

mpg_data <- read.csv('practice/mpg_modified.csv')

mpg_1999 <- mpg_data %>%
    filter(year == 1999)

mpg_2008 <- mpg_data %>%
    filter(year == 2008)

t.test(
    mpg_1999$hwy,
    mpg_2008$hwy,
    paired=T)

?aov()


# ANOVA

mt_cars_filt <- mtcars[,c('hp','cyl')]

mt_cars_filt$cyl <- factor(mt_cars_filt$cyl)

test  <- aov(hp ~ cyl, data=mt_cars_filt)
summary(test)


plott <- mtcars %>%
    ggplot( aes(
        x=hp,
        y=qsec,
    )) +
    geom_point()
plott


cor(mtcars$hp, mtcars$qsec)


used_cars <- read.csv('practice/used_car_data.csv')

used_cor <- used_cars %>%
    ggplot( aes(
        x=Miles_Driven,
        y=Selling_Price,
    )) +
    geom_point()
used_cor

cor(used_cars$Miles_Driven, used_cars$Selling_Price)


used_matrix <- as.matrix(used_cars[,c('Selling_Price','Present_Price','Miles_Driven')])
cor(used_matrix)

used2 <- used_cars %>%
    select('Selling_Price','Present_Price','Miles_Driven') %>%
    as.matrix() %>%
    cor()
used2
?lm()

mtcars_lm <- mtcars %>%
    {lm(qsec ~ hp, data = .)}

mtcars_lm

y_vals <- mtcars_lm$coefficients['hp'] * mtcars$hp + mtcars_lm$coefficients['(Intercept)']

mtcars_lm_plot <- mtcars_lm %>%
    ggplot( aes(
        x=hp,
        y=qsec,
    )) +
    geom_point() +
    geom_line(
        aes(
            y=y_vals,
        ),
        color='red',
    )

mtcars_lm_plot

# multiple linear regression

mtcars_lm2 <- mtcars %>%
    {lm(qsec ~ mpg + disp + drat + wt + hp, data = .)}
mtcars_lm2
summary(mtcars_lm2)


tbl <- table(mpg$class,mpg$year)
chisq.test(tbl)
