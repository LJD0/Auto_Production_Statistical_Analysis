?ggplot()

head(mpg)

# box plots

plt <- mpg %>%
    ggplot(aes(x=class)) + 
    geom_bar()
plt


mpg_summary <- mpg %>%
    group_by(manufacturer) %>%
    summarize( VehicleCount = n(), .groups="keep")

mpg_sumary_plot <- mpg_summary %>%
    ggplot(aes(x=manufacturer, y=VehicleCount)) +
    geom_col() +
    xlab("Manufacturing Company") + # x-axis label
    ylab("Numberof Vehicles Sold") + # y-axis label
    theme(axis.text.x = element_text(angle=45,hjust=1)) # rotate x-axis labels
mpg_sumary_plot


# line plots

toyota_subset <- mpg %>%
    subset(manufacturer == "toyota") %>%
    group_by(cyl) %>%
    summarize(Mean_Hwy=mean(hwy), .groups="keep")

toyota_subset_plot <- toyota_subset %>%
    ggplot( aes( x=cyl, y=Mean_Hwy)) +
    geom_line() +
    scale_x_discrete(limits=c(4,6,8)) + 
    scale_y_continuous(breaks = c(16:30)) #add line plot with labels

toyota_subset_plot


# scatter plots

scatter <- mpg %>%
    ggplot( aes(x=displ, y=cty,color=class,size=year)) +
    geom_point() +
    labs(x="Engine Size", y="City Mileage")
scatter

# box plots

boxplot <- mpg %>%
    ggplot(aes(y=hwy)) +
    geom_boxplot()
boxplot

manufacturer_boxplot <- mpg %>%
    ggplot(aes(x=manufacturer, y=hwy)) +
    geom_boxplot() +
    theme(axis.text.x = element_text(angle=45,hjust=1)) # rotate x-axis labels
manufacturer_boxplot

#layering plots

manufacturer_layered <- mpg %>%
    ggplot(aes(x=manufacturer, y=hwy)) +
    geom_boxplot() +
    geom_point() +
    theme(axis.text.x = element_text(angle=45,hjust=1)) # rotate x-axis labels
manufacturer_layered

avg_size_by_class <- mpg %>%
    group_by(class) %>%
    summarize(mean_engine=mean(displ), engine_dev=sd(displ), .groups="keep") %>%
    ggplot(aes(x=class, y=mean_engine)) +
    geom_point(size=4) +
    labs(x="Vehicle Class", y="Average Engine Size") +
    geom_errorbar( aes(ymin=mean_engine-engine_dev, ymax=mean_engine+engine_dev), width=0.2)
avg_size_by_class





# heat maps

mpg_heatmap <- mpg %>%
    group_by(class,year) %>%
    summarize(Mean_Hwy=mean(hwy), .groups="keep") %>%
    ggplot(aes(x=class,y=factor(year),fill=Mean_Hwy)) +
    geom_tile() +
    labs(x="Vehicle Class",y="Year",fill="Mean Highway Mileage")
mpg_heatmap

mpg_heatmap2 <- mpg %>%
    group_by(model, year) %>%
    summarize(mean_hwy=mean(hwy), .groups="keep") %>%
    ggplot(aes(x=model, y=factor(year), fill=mean_hwy)) +
    geom_tile() +
    labs(x="Vehicle Model", y="Year", fill="Mean Highway Mileage") +
    theme(axis.text.x = element_text(angle=45, hjust=1))
mpg_heatmap2

# faceting plots

mpg_long <- mpg %>%
    gather(key="MPG_Type", value="Rating", c(cty, hwy)) %>%
    ggplot(aes(x=manufacturer, y=Rating, color=MPG_Type)) +
    geom_boxplot() +
    theme(axis.text.x = element_text(angle=45,hjust=1)) # rotate x-axis labels

mpg_long

mpg_facet <- mpg %>%
    gather(key="MPG_Type", value="Rating", c(cty, hwy)) %>%
    ggplot(aes(x=manufacturer, y=Rating, color=MPG_Type)) +
    geom_boxplot() +
    theme(axis.text.x = element_text(angle=45,hjust=1)) + # rotate x-axis labels
    facet_wrap(vars(MPG_Type)) # facet by MPG_Type
mpg_facet
