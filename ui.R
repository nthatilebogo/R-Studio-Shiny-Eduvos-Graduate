#Name: Onthatile Lebogo
#Student Number: eduv4842477
library(shiny)
library(shinydashboard)
library(bs4Dash)
library(plotly)
library(DT)

ui <- dashboardPage( skin = "black",
  #Display the name of the dashboard
  dashboardHeader(
    title = dashboardBrand(
      title = "Eduvos Graduates")
  ),
  dashboardSidebar(
    #Sidebar menu that shows the options to visualize the tech tools. 
    sidebarMenu(
      menuItem("Tech Tools Analysis", icon = icon("chart-bar"), startExpanded = FALSE,
               menuSubItem("Programming Languages", tabName = "ProgLang", icon = icon("code")),
               menuSubItem("Databases", tabName = "Db", icon = icon("database")),
               menuSubItem("AI Tools", tabName = "AITool", icon = icon("microchip")),
               menuSubItem("Web Framework", tabName = "WebFrame", icon = icon("file-code")),
               menuSubItem("Cloud Platforms", tabName = "Platform", icon = icon("server")),
               menuSubItem("AI Search Engine", tabName = "AISearch", icon = icon("brain"))
               ),
      
      menuItem("Popular Industries", tabName = "Industry", icon = icon("industry")),
      menuItem("Top Job Roles", tabName = "Role", icon = icon("laptop-code")),
      menuItem("Employment Rate", tabName = "Employment", icon = icon("briefcase"))
    )#sidebarMenu
  ),
  dashboardBody(
    #Visualisation of the tech tools will be disaplyed here
    tabItems(
      tabItem(tabName = "ProgLang", fluidRow(
        box(title = "Top Progamming Langauages", plotlyOutput("top_ProgLang", height = "700px"), width = 12, solidHeader = TRUE, status = "primary")
        )),#tabItem
      tabItem(tabName = "Db", fluidRow(
        box(title = "Top Databases", plotlyOutput("top_Db", height = "700px"), width = 12, solidHeader = TRUE, status = "primary")
      )),#tabItem
      tabItem(tabName = "AITool", fluidRow(
        box(title = "Top AI Tools", plotlyOutput("top_AITool", height = "700px"), width = 12, solidHeader = TRUE, status = "primary")
      )),#tabItem
      tabItem(tabName = "WebFrame", fluidRow(
        box(title = "Top Progamming Langauages", plotlyOutput("top_WebFrame", height = "700px"), width = 12, solidHeader = TRUE, status = "primary")
      )),#tabItem
      tabItem(tabName = "Platform", fluidRow(
        box(title = "Top Progamming Langauages", plotlyOutput("top_Platform", height = "700px"), width = 12, solidHeader = TRUE, status = "primary")
      )),#tabItem
      tabItem(tabName = "AISearch", fluidRow(
        box(title = "Top Databases", plotlyOutput("top_AISearch", height = "700px"), width = 12, solidHeader = TRUE, status = "primary")
      )),#tabItem
      tabItem(tabName = "Industry", fluidRow(
        box(title = "Top Progamming Langauages", plotlyOutput("top_Industry", height = "700px"), width = 12, solidHeader = TRUE, status = "primary")
      )),#tabItem
      tabItem(tabName = "Role", fluidRow(
        box(title = "Top Progamming Langauages", plotlyOutput("top_Role", height = "700px"), width = 12, solidHeader = TRUE, status = "primary")
      )),#tabItem
      tabItem(tabName = "Employment", fluidRow(
        box(title = "Top Progamming Langauages", plotlyOutput("top_Employment", height = "700px"), width = 12, solidHeader = TRUE, status = "primary")
      ))#tabItem
    )#tabItems
  )#dashboardBody
)