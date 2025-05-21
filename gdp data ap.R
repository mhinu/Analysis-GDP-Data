library(tidyverse)
library(janitor)


dir()

dir(path = "GDP Data")

"GDP Data/NAD-Andhra_Pradesh-GSVA_cur_2016-17.csv" %>% 
  read.csv()
