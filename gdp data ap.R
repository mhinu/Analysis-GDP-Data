library(tidyverse)
library(janitor)
library(stringr)


dir()



"GDP Data/NAD-Andhra_Pradesh-GSVA_cur_2016-17.csv" %>% 
  read.csv() -> AP_data
"NAD-Andhra_Pradesh-GSVA_cur_2016-17.csv" %>% 
  str_split("-") %>%  #to seperate the string by notifying same string among the file name
  unlist() -> state_name_vector       #unlist function is used to separate all the string separately and make it available seperate strings
state_name_vector [2] -> st_name


AP_data %>% 
  slice(-c(7,11,27:33)) %>%   #if we didinot put the -symbol it will give the data which is given , if we put - it remove the given rows
  pivot_longer(-c(1,2), names_to = "year", values_to = "gsdp") %>% 
  clean_names()  %>% 
  select(-1) %>% 
  mutate(state=st_name) -> state_df

 
dir(path = "GDP Data",
    pattern = "NAD")->state_files
tibble()-> tempdf
#read all csv files
for(i in state_files){
  i %>% 
    str_split("-") %>% 
    unlist() -> state_name_vector
  
  state_name_vector[2] -> st_name
  
  #print(paste0("state name:", st_name))
  #read csv file
  paste0("GDP Data/",i) %>% 
    read_csv() -> st_df1
  print(st_df1)
  
  st_df1 %>% 
    slice(-c(7,11,27:33)) %>% 
  pivot_longer(-c(1,2), names_to = "year", values_to = "gsdp") %>% 
  clean_names()  %>% 
    select(-1) %>% 
    mutate(state=st_name) -> state_df
  print(state_df)
  bind_rows(tempdf, state_df) -> tempdf
  
}
tempdf -> final_statewise_gsdp
final_statewise_gsdp %>% 
  write.csv("final_statewise_gsdp")

