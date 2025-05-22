install.packages("ggplot2")


library(ggplot2)
library(tidyverse)



mtcars
iris
ggplot(data=mtcars %>% head(), aes(x=disp, y=hp))+
  geom_point()

tibble(age=c(12,21,32,43,11),
       height=c(160,150,149,123,180),
       name=c("x", "y", "z", "a", "b")) -> df
ggplot(df, aes(x=name, y=height))+
  geom_bar(stat = "identity")  #kind of plots like bar chart, pie chrt, dot plot,etc
#stat = "identity used to aggregate all the repeated one by summation them into one



read.csv("sample_sales_data.csv") -> product

ggplot(product, aes(x=Product, y=Quantity)) +
  geom_line() +
  labs(title = "Total Price", subtitle = "count of total price",
       caption = "Source:sample_sales_data")+
  theme_minimal()

#scatter plot  is nothing but dot plot
#Line plot is to show entire data 
#Bar chart used for categorical variables
#histogram is used for frequency distribution data
  
#adding tthe subtitles and lables use labs function

ggplot(data=iris, aes(x=Sepal.Length, 
                      y=Sepal.Width, color= Species, shape = Species))+
  geom_point(size = 3)

ggplot(product, aes(x=UnitPrice, y=TotalPrice,
                    colour = Status , shape = Product)) +
  geom_point( size= 3) +
  scale_color_manual(values = c("maroon", "orange","green"))+
  #geom_line(color=4)+
  labs(title = "Total Price", subtitle = "count of total price",
       caption = "Source:sample_sales_data")+
  scale_color_brewer(palette = "Set2")

#scale_color_gradient 

#faceting- to divide the plots into different sections
ggplot(product, aes(x=UnitPrice, y=TotalPrice,
                    colour = Status , shape = Product)) +
  geom_point( size= 3) +
  theme_minimal()+
  labs(title = "Price comparision")+
  scale_color_brewer(palette = "Set2")+
  facet_grid(Product~Status, )+
  theme(
    legend.position = "bottom"
  )
#facet_grid - used to compare two parameters
#facet_wrap - used to plot only one parameter
#legend.position used to change the legend 
#In graphs, a legend is a key or guide that explains the meaning of different colors, patterns, or symbols used in the visualization


#to specify the limit of the axes

ggplot(product, aes(x=UnitPrice, y=TotalPrice,
                    colour = Status , shape = Product)) +
  geom_point( size= 3) +
  theme_minimal()+
  labs(title = "Price comparision")+
  scale_color_brewer(palette = "Set2")+
  #facet_grid(Product~Status, )+
  scale_x_continuous(breaks = seq(250,500, by = 50),
                     limits = c(250,500)) +
  scale_y_continuous(breaks = seq(2000,5000, by=250),
                     limits = c(2000,5000))
  #xlim(250,500)  # to define the limits to the x axis

  theme(
    legend.position = "bottom"
  )

  ggplot(product, aes(x=Status, y=TotalPrice,fill = Status ,
                      colour = Status , shape = Product)) +
    geom_boxplot() +
  scale_fill_manual(values=c("Cancelled"= "red",
                            "Processing"= "blue",
                            "Shipped"= "green")
                            )
    

  