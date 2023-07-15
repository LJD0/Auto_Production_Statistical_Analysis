library(tidyverse)
library(jsonlite)

x <- 3

y <- c(5,6,4,2,2,8,8,5,6,6,4)
y[5]


demo_table <- read.csv("practice/demo.csv",check.names=F,stringsAsFactors=F)
demo_json <- fromJSON("practice/demo.json")


demo_table$Vehicle_Class
demo_table$Vehicle_Class[3]
filter_table <- demo_json[demo_json$price > 10000,]

?subset()


filter_table2 <- subset(demo_json, (price > 10000) & (drive == "4wd") & ("clean" %in% title_status)) #filter by price and drivetrain


row_count <- 1:nrow(demo_table)
sample_rows <- sample(row_count, 3)
demo_table[sample_rows,]


library(dplyr)
install.packages("dplyr")

demo_table <- demo_table %>% mutate(
    Mileage_per_Year=Total_Miles/(2020-Year),
    IsActive=TRUE) #add columns to original data frame

summarize_demo1 <- demo_json %>% 
    group_by(condition) %>% 
    summarize(Mean_Mileage=mean(odometer), .groups = 'keep') #create summary table

summarize_demo2 <- demo_json %>% 
    group_by(condition) %>% 
    summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n(), .groups = 'keep') #create summary table with multiple columns

summarize_demo3 <- demo_json %>% 
    group_by(condition) %>% 
    summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n(), .groups = 'keep') #create summary table with multiple columns


?gather()

demo_table3 <- read.csv('practice/demo2.csv',check.names = F,stringsAsFactors = F)

long_table <- demo_table3 %>% 
    gather(key="Metric",value="Score",buying_price:popularity)

?spread()

wide_table <- long_table %>% 
    spread(key="Metric",value="Score")

