students <- tibble(
  Name = c("Asha", "Ben", "Chitra", "Dev", "Esha", "Farhan", "Geeta", "Hari", "Isha", "Jay"),
  Gender = c("F", "M", "F", "M", "F", "M", "F", "M", "F", "M"),
  Score = c(78, 85, 69, 92, 88, 76, 83, 95, 70, 80),
  Hours = c(5, 7, 4, 9, 6, 5, 8, 10, 3, 6),
  Department = c("Math", "Science", "Math", "Math", "Science", "Science", "Math", "Science", "Math","Science")
)

#Plot Score vs Hours with both point and a line
ggplot(students, aes(x=Score, y=Hours))+
  geom_point(color=4)+
  geom_line() +
  labs(title= "Scores Vs Hours")

#Faceted by department and colour by gender
ggplot(students, aes(x=Score, y=Hours,
                     colour = Gender))+
  geom_point(color=4)+
  facet_wrap(~Department)+
  geom_line() +
  labs(title= "Scores Vs Hours")

#Add proper title and remove the legend title
ggplot(students, aes(x=Score, y=Hours,
                     colour = Gender))+
  geom_point(c)+
  facet_wrap(~Department)+
  geom_line() +
  labs(title= "Student performance")+
  #theme(legend.position = "none")

  
#task 2
  #Plot Score vs Hours 
  #Colors shows Gender
  #Shape shows Department
  #Add title, subtitile, and axis labels,
  #Make it clean and readable
  
ggplot(students,aes(x=Score, y=Hours,
                    colour = Gender, shape = Department))+
  geom_point(size=4)+
  labs(title = "Student Performance", subtitle = "effeciency", x="Score", y="Hours")+
  facet_grid(Department~Gender)







read.csv("city_day.csv") -> city
city

library(lubridate)
ggplot(city, aes(x="Date", y= "NO"))