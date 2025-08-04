#Name: Onthatile Lebogo
#Student Number: eduv4842477

library(readxl)
library(ggplot2)
library(ggthemes)
library(tidyverse)
library(forcats)
library(readr)


grad <- read.csv("C:/Users/user/Desktop/Nthati/School/Eduvos/Modules/3rd Year/ITRDA3-11/Assignment/Dashboard/graduate_survey.csv", header=TRUE)
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

#Removing rows with empty cells
#Vector to store rows with empty cells
remove_emptyCells <- function(df,a)
{
  empty_rows <- c()

  for (i in 1:nrow(df)){
    if (df[i,a] == "") {
      #Store row with empty cell in vector
      empty_rows <- append(empty_rows,i)
    }
  }
  #Delete rows and return dataset
  df <- df[-empty_rows,]
  return(df)
}

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

#Remove rows with empty cell in ProgLang column
grad_resp_PL <- remove_emptyCells(grad_resp,6)

progLang_freq <- grad_resp_PL |>
  separate_rows(ProgLang, sep = ';')|>
  group_by(ProgLang)|>
  summarise(count=n(), .groups = "drop")|>
  slice_max(count,n = 15, with_ties = FALSE)

#Total Programming Languages
progLang_Tot <- grad_resp_PL |>
  separate_rows(ProgLang, sep = ';')|>
  group_by(ProgLang)|>
  summarise(count=n(), .groups = "drop")|>
  nrow()
#Total Graduates 
progLang_TotGrad <- grad_resp_PL |>
  nrow()
#Top Programming Language
progLang_Top <- progLang_freq[1,1]
progLang_Top <- paste(progLang_Top)
  
progLangPlot <- progLang_freq |>
  ggplot(aes(y = fct_rev(fct_reorder(ProgLang,count)), x=count, fill = ProgLang)) + 
  geom_col() +
  scale_x_continuous(breaks = seq(0,8000,by = 1000),expand = expansion(add = 0.6))+
  theme_classic()+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        axis.line = element_line(linewidth = 0.6),
        axis.ticks = element_line(linewidth = 0.6),
        plot.title = element_text(face = "bold"),
        legend.position = "none")+
  labs(y=NULL,x="Number of Graduates", 
       title = "Top Programming Languages",
       fill = "Programming Language") +
  coord_cartesian(xlim = c(0,8000))


#Databases

#Remove empty cells in database column
grad_resp_Db <- remove_emptyCells(grad_resp,7)
Db_freq <- grad_resp_Db |>
  separate_rows(Databases, sep=";")|>
  group_by(Databases)|>
  summarise(count=n(), .groups = "drop")|>
  slice_max(count,n = 15, with_ties = FALSE)

#Total Databases
Db_Tot <- grad_resp_Db |>
  separate_rows(Databases, sep = ';')|>
  group_by(Databases)|>
  summarise(count=n(), .groups = "drop")|>
  nrow()
#Total Graduates 
Db_TotGrad <- grad_resp_Db |>
  nrow()
#Top Database
Db_Top <- Db_freq[1,1]
Db_Top <- paste(Db_Top)

DbPlot <- Db_freq |>
  ggplot(aes(y = fct_rev(fct_reorder(Databases,count)), x=count, fill = Databases)) + 
  geom_col() + 
  scale_x_continuous(breaks = seq(0,6000,by = 500),expand = expansion(add = 0.6))+
  theme_classic()+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        axis.line = element_line(linewidth = 0.6),
        axis.ticks = element_line(linewidth = 0.6),
        plot.title = element_text(face = "bold"),
        legend.position = "none")+
  labs(y=NULL,x="Number of Graduates", 
       title = "Top Databases")+
  coord_cartesian(xlim = c(0,6000))


#AITool

AITool_freq <- grad_resp |>
  separate_rows(AITool, sep=";")|>
  group_by(AITool)|>
  summarise(count=n(), .groups = "drop")|>
  slice_max(count,n = 15, with_ties = FALSE)

#Total AI Tools
AITool_Tot <- grad_resp |>
  separate_rows(AITool, sep = ';')|>
  group_by(AITool)|>
  summarise(count=n(), .groups = "drop")|>
  nrow()
#Total Graduates 
AITool_TotGrad <- grad_resp |>
  nrow()
#Top AI Tool
AITool_Top <- AITool_freq[1,1]
AITool_Top <- paste(AITool_Top)

AIToolPLot <- grad_resp |>
  separate_rows(AITool, sep = ";")|>
  ggplot(aes(y = fct_infreq(AITool), fill = AITool)) + 
  geom_bar() + 
  scale_x_continuous(breaks = seq(0,8000,by = 500),expand = expansion(add = 0.6))+
  theme_classic()+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        axis.line = element_line(linewidth = 0.6),
        axis.ticks = element_line(linewidth = 0.6),
        plot.title = element_text(face = "bold"),
        legend.position = "none")+
  labs(y=NULL,x="Number of Graduates", 
       title = "Top AI Tools") + 
  coord_cartesian(xlim = c(0,8000))


#WebFrameworks
grad_resp_Web <- remove_emptyCells(grad_resp,9)
Web_freq <- grad_resp_Web |>
  separate_rows(WebFramework, sep=";")|>
  group_by(WebFramework)|>
  summarise(count=n(), .groups = "drop")|>
  slice_max(count,n = 15, with_ties = FALSE)

#Total Web Framework
Web_Tot <- grad_resp_Web |>
  separate_rows(WebFramework, sep = ';')|>
  group_by(WebFramework)|>
  summarise(count=n(), .groups = "drop")|>
  nrow()
#Total Graduates 
Web_TotGrad <- grad_resp_Web |>
  nrow()
#Top WebFramework
Web_Top <- Web_freq[1,1]
Web_Top <- paste(Web_Top)
  
WebFramePlot <- Web_freq |>
  ggplot(aes(y = fct_rev(fct_reorder(WebFramework,count)), x=count, fill = WebFramework)) + 
  geom_col() +
  scale_x_continuous(breaks = seq(0,5000,by = 500),expand = expansion(add = 0.6))+
  theme_classic()+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        axis.line = element_line(linewidth = 0.6),
        axis.ticks = element_line(linewidth = 0.6),
        plot.title = element_text(face = "bold"),
        legend.position = "none")+
  labs(y=NULL,x="Number of Graduates", title = "Top Web Frameworks") + 
  coord_cartesian(xlim = c(0,5000))


#Platforms
grad_resp_Plt <- remove_emptyCells(grad_resp,8)
Platform_freq <- grad_resp_Plt |>
  separate_rows(Platform, sep=";")|>
  group_by(Platform)|>
  summarise(count=n(), .groups = "drop")|>
  slice_max(count,n = 15, with_ties = FALSE)

#Total Platform
Plt_Tot <- grad_resp_Plt |>
  separate_rows(Platform, sep = ';')|>
  group_by(Platform)|>
  summarise(count=n(), .groups = "drop")|>
  nrow()
#Total Graduates 
Plt_TotGrad <- grad_resp_Plt |>
  nrow()
#Top platform
Plt_Top <- Platform_freq[1,1]
Plt_Top <- paste(Plt_Top)

PlatformPlot <- Platform_freq |>
  ggplot(aes(y = fct_rev(fct_reorder(Platform,count)), x=count, fill = Platform)) + 
  geom_col() +
  scale_x_continuous(breaks = seq(0,5000,by = 500),expand = expansion(add = 0.6))+
  theme_classic()+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        axis.line = element_line(linewidth = 0.6),
        axis.ticks = element_line(linewidth = 0.6),
        plot.title = element_text(face = "bold"),
        legend.position = "none")+
  labs(y=NULL,x="Number of Graduates", title = "Top Cloud Platforms") + 
  coord_cartesian(xlim = c(0,5000))


#AISearch
grad_resp_AIS <- remove_emptyCells(grad_resp,11)
AISearch_freq <- grad_resp_AIS |>
  separate_rows(AISearch, sep=";")|>
  group_by(AISearch)|>
  summarise(count=n(), .groups = "drop")|>
  slice_max(count,n = 15, with_ties = FALSE)

#Total Platform
AIS_Tot <- grad_resp_AIS |>
  separate_rows(AISearch, sep = ';')|>
  group_by(AISearch)|>
  summarise(count=n(), .groups = "drop")|>
  nrow()
#Total Graduates 
AIS_TotGrad <- grad_resp_AIS |>
  nrow()
#Top platform
AIS_Top <- AISearch_freq[1,1]
AIS_Top <- paste(AIS_Top)


AISearchPlot <- grad_resp_AIS |>
  separate_rows(AISearch, sep = ';')|>
  ggplot(aes(y= fct_infreq(AISearch), fill = AISearch)) + geom_bar() + 
  scale_x_continuous(breaks = seq(0,8000,by = 500),expand = expansion(add = 0.6))+
  theme_classic()+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        axis.line = element_line(linewidth = 0.6),
        axis.ticks = element_line(linewidth = 0.6),
        plot.title = element_text(face = "bold"),
        legend.position = "none")+
  labs(y=NULL,x="Number of Graduates", title = "Top AI Search Engines") + 
  coord_cartesian(xlim = c(0,8000))


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
  ggplot(aes(x = StudyField, y=Count, fill = Industry,label = Count)) + 
  geom_bar(stat = "identity",position = "dodge") + 
  geom_text(aes(y=Count+2),position = position_dodge(width = 0.9), vjust = 0)+
  scale_fill_manual(values = c("red","orange","yellow","darkgreen","blue","lightblue","violet","purple","#021F62" ))+
  scale_y_continuous(breaks = seq(350,420,by = 10),
                     expand = c(0,0))+
  scale_x_discrete(expand = expansion(add = 0.5))+
  theme_classic()+
  theme(axis.line = element_line(linewidth = 0.6),
        axis.ticks = element_line(linewidth = 0.6),
        plot.title = element_text(face = "bold"))+
  labs(x="Study Field", 
       y="Number of Graduates",
       title = "Top Industries in each Study Field") + 
  coord_cartesian(ylim = c(350,420))




#2.III
#Count total number of Industries per Study field
grad_resp6 <- remove_emptyCells(grad_resp,4)
role_freq <- grad_resp6 |>
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
  ggplot(aes(x = StudyField, y=Count, fill = Role, label = Count)) + 
  geom_bar(stat = "identity",position = "dodge") +
  scale_fill_manual(values = c("red","orange","yellow","darkgreen","blue"))+
  scale_y_continuous(breaks = seq(0,1300,by = 100),
                     expand = c(0,0))+
  scale_x_discrete(expand = expansion(add = 0.5))+
  theme_classic()+
  theme(axis.line = element_line(linewidth = 0.6),
        axis.ticks = element_line(linewidth = 0.6),
        plot.title = element_text(face = "bold"))+
  labs(x="Study Field", 
       y="Number of Graduates",
       title = "Top Job Roles in each Study Field",
       fill = "Job Roles") + 
  coord_cartesian(ylim = c(0,1300))



#2.IV
#find total graduates per study field
all_grad <- grad_resp |> 
  separate_rows(Employment, sep = ';') |>
  group_by(StudyField)|>
  summarise(Count = n(), .groups = "drop")
  
#find total employed graduates per study field
employed_grad <- grad_resp |> 
  separate_rows(Employment, sep = ';') |>
  filter(grepl('self-employed|Employed', Employment))|>
  group_by(StudyField)|>
  summarise(Count = n(), .groups = "drop")
  
#Add employment rate to the employed_grad dataset
employed_grad$Rate = (employed_grad$Count / all_grad$Count)*100

RatePlot <- employed_grad |>
  ggplot(aes(x= StudyField, y = Rate, fill = StudyField,
             label = scales::percent(Rate, scale = 1))) + 
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(y=Rate +2, vjust = 0))+
  scale_fill_manual(values = c("red","darkgreen","blue"))+
  scale_y_continuous(breaks = seq(0,100,by = 10),
                     labels = scales::label_percent(scale = 1),
                     expand = c(0,0))+
  scale_x_discrete(expand = expansion(add = 0.5))+
  coord_cartesian(ylim = c(0,100))+
  theme_classic()+
  theme(axis.line = element_line(linewidth = 0.6),
        axis.ticks = element_line(linewidth = 0.6),
        plot.title = element_text(face = "bold"),
        legend.position = "none") +
  labs(x="Field of Study",y="Employment rate (%)", 
       title = "Rate of Employed Graduates by Study Field")



