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
