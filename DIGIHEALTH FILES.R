hd <- read.csv("C:/Users/fziad/Desktop/DIGITAL HEALTH/HABIE_DATA.csv")
hd 
print(head(hd))
summary(hd$column.id)
summary(hd$age)
summary(hd$gender)
summary(hd$gender=='F')

summary(hd$hypertension=='yes')
 summary(hd$region)
ggplot(hd,aes(x=age)) + geom_histogram(binwidth = 2, fill = "blue", color ="red",
                                       alpha =0.8 )+ labs (title = "Age Distribution",
                                                           x= "Age", y = "Frequency")

ggplot(hd, aes(x=gender, y= age, fill=gender)) + geom_boxplot() +labs(title = "Age Distribution by Gender", x= "gender",  y= "age") + theme_minimal()

ggplot(hd, aes (x=factor(education.level), fill=factor(education.level))) +geom_bar()+
  labs(title = "Education Distribution", x="education level", y="count")+
  theme_minimal()

cor_hd = cor(hd)
print ("Correlation matrix")
print(cor_hd)


ggplot(hd, aes (x=factor(region), fill=factor(region))) +geom_bar()+
  labs(title = "Regions", x="region", y="count")+
  theme_minimal()


ggplot(hd, aes(x= age, y=bmi)) +geom_line()+
  labs(title = "Line Graph", x="age", y="bmi")

ggplot(hd, aes(x= age, y=bmi)) +geom_point()+
  labs(title = "Line Graph", x="age", y="bmi")

data <-read.csv("C:/Users/fziad/Desktop/DIGITAL HEALTH/HABIE_DATA.csv")
count <-sum(str_count(data$gender, "F"))
print(paste0("There are", count, " 'F'characters in the 'gender'colum."))
