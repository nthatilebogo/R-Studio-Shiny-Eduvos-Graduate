#Name: Onthatile Lebogo
#Student Number: eduv4842477

library(readxl)
library(ggplot2)
library(ggthemes)
library(tidyverse)
library(forcats)
library(readr)

grad <- read_csv("C:/Users/user/Desktop/Nthati/School/Eduvos/Modules/ITRDA3-11/Assignment/graduate_survey.csv")
grad_cleaned <- grad |>
  #1a
  select(Campus, StudyField, Branch, Role, EduLevel, ProgLang, Databases, Platform, WebFramework, Industry, AISearch, AITool, Employment)|>
  #1b
  na.omit()|>
  #complete()|>
  #1c
  mutate(Campus = case_when(
    Campus=='Umhlanga Campus' ~ 'Durban Campus',
    .default = as.character(Campus)
    ))
  
  
#1d
grad_top5 <- grad_cleaned |>
  
  group_by(Campus)|>
  summarise(Responses = n())|>
  arrange(desc(Responses))

grad_resp <- grad_cleaned |>
  filter(Campus %in% 
           c('Durban Campus','Pretoria Campus','Nelson Mandela Bay Campus','Bloemfontein Campus','Vanderbijlpark Campus'))

#2I
#Programming Language

progLangPlot <- grad_resp |>
  separate_rows(ProgLang, sep = ';')|>
  ggplot(aes(y = fct_infreq(ProgLang), fill = ProgLang)) + geom_bar() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  labs(y="Programming Language",x="Frequency", title = "Top Programming Languages") + 
  theme_minimal()
  
#Databases
DbPlot <- grad_resp |>
  separate_rows(Databases, sep=";")|>
  ggplot(aes(y = fct_infreq(Databases), fill = Databases)) + geom_bar() + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  labs(y="Databases",x="Frequency", title = "Top Databases") + 
  theme_minimal()

#AITool
AIToolPLot <- grad_resp |>
  separate_rows(AITool, sep = ";")|>
  ggplot(aes(y = fct_infreq(AITool), fill = AITool)) + geom_bar() + 
  theme(axis.text.x = element_text(angle = 90,vjust = 0.5, hjust = 1)) +
  labs(y="AI Tool",x="Frequency", title = "Top AI Tools") + 
  theme_minimal()

#WebFrameworks
WebFramePlot <- grad_resp |>
  separate_rows(WebFramework, sep=';')|>
  ggplot(aes(y = fct_infreq(WebFramework), fill = WebFramework)) + geom_bar() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  labs(y="Web Framework",x="Frequency", title = "Top Web Frameworks") + 
  theme_minimal()

#Platforms
PlatformPlot <- grad_resp |>
  separate_rows(Platform,  sep = ';')|>
  ggplot(aes(y =  fct_infreq(Platform), fill = Platform)) + geom_bar() + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  labs(y="Cloud Platform",x="Frequency", title = "Top Cloud Platforms") + 
  theme_minimal()

#AISearch
AISearchPlot <- grad_resp |>
  separate_rows(AISearch, sep = ';')|>
  ggplot(aes(y= fct_infreq(AISearch), fill = AISearch)) + geom_bar() + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  labs(y="AI Search Engine",x="Frequency", title = "Top AI Search Engines") + 
  theme_minimal()

#2.II
#Count total number of Industries per Study field
industry_freq <- grad_resp |>
  separate_rows(Industry, sep = ';')|>
  group_by(StudyField,Industry)|>
  summarise(Count=n(), .groups = "drop")|>
  arrange(StudyField,desc(Count))
#Get top 5 Industries per Study field
industryTop5 <- industry_freq |>
  group_by(StudyField)|>
  slice_max(Count,n = 5, with_ties = FALSE)|>
  ungroup()
#Visualize the top 5 industries per study field
IndustryPlot <- industryTop5 |>
  ggplot(aes(x = StudyField, y=Count, fill = Industry)) + 
  geom_bar(stat = "identity",position = "dodge") +
  labs(x="Study Field", 
       y="Frequency",
       title = "Top Industries in each Study Field",
       fill = "Industry") + 
  theme_minimal()




#2.III
#Count total number of Industries per Study field
role_freq <- grad_resp |>
  separate_rows(Role, sep = ';')|>
  group_by(StudyField,Role)|>
  summarise(Count=n(), .groups = "drop")|>
  arrange(StudyField,desc(Count))
#Get top 5 Industries per Study field
roleTop5 <- role_freq |>
  group_by(StudyField)|>
  slice_max(Count,n = 5, with_ties = FALSE)|>
  ungroup()
#Visualize the top 5 industries per study group
RolePlot <- roleTop5 |>
  ggplot(aes(x = StudyField, y=Count, fill = Role)) + 
  geom_bar(stat = "identity",position = "dodge") +
  labs(x="Study Field", 
       y="Frequency",
       title = "Top Job Roles in each Study Field",
       fill = "Job Roles") + 
  theme_minimal()


#2.IV
#find total graduates per study field
all_grad <- grad_resp |> 
  separate_rows(Employment, sep = ';') |>
  group_by(StudyField)|>
  summarise(Count = n(), .groups = "drop")|>
  
#find total employed graduates per study field
employed_grad <- grad_resp |> 
  separate_rows(Employment, sep = ';') |>
  filter(grepl('self-employed|Employed', Employment))|>
  group_by(StudyField)|>
  summarise(Count = n(), .groups = "drop")
  
#Add employment rate to the employed_grad dataset
employed_grad$Rate = (employed_grad$Count / all_grad$Count)*100

RatePlot <- employed_grad |>
  ggplot(aes(x= StudyField, y = Rate, fill = StudyField)) + 
  geom_bar(stat = "identity", position = "dodge") +
  coord_cartesian(ylim = c(0,100))+
  labs(x="Field of Study",y="Number of Graduates", title = "Employment rate of graduates")



library(shiny)