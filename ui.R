#Name: Onthatile Lebogo
#Student Number: eduv4842477
library(shiny)
library(bs4Dash)
library(plotly)
library(DT)


ui <- dashboardPage(
  #Display the name of the dashboard
  header = dashboardHeader(
    title = dashboardBrand(
      title = "Eduvos Graduates",
      color = "info")
  ),
  sidebar =  dashboardSidebar(
    status = "info",
    #Sidebar menu that shows the options to visualize the tech tools. 
    sidebarMenu(
      menuItem(text = "Tech Tools Analysis", 
               icon = icon("chart-bar"), 
               startExpanded = FALSE,
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
  footer = dashboardFooter(
    left = a(
      href = "https://www.linkedin.com/in/onthatile-lebogo",
      target = "_blank", "@OnthatileLebogo"
    ),
    right = "2025"
  ),
  dashboardBody(
    #Visualisation of the tech tools will be disaplyed here
    tabItems(
      tabItem(tabName = "ProgLang", fluidRow(
        bs4Card(
            title = "Top Programming language",
            width = 4,
            background = "info",
            textOutput("progLang_Top")
          ),#bs4Card
          bs4Card(
            title = "Total Programming languages",
            width = 4,
            background = "info",
            textOutput("progLang_Tot")
          ),#bs4Card
        bs4Card(
            title = "Total Graduates",
            width = 4,
            background = "info",
            textOutput("progLang_TotGrad")
          ),#bs4Card
        
        box(title = "Top Progamming Langauages", 
            plotlyOutput("top_ProgLang", height = 500), 
            width = 12, solidHeader = TRUE, 
            status = "info")
        )),#tabItem
      
      tabItem(tabName = "Db", fluidRow(
        bs4Card(
          title = "Top Database",
          width = 4,
          background = "info",
          textOutput("Db_Top")
        ),#bs4Card
        bs4Card(
          title = "Total Databases",
          width = 4,
          background = "info",
          textOutput("Db_Tot")
        ),#bs4Card
        bs4Card(
          title = "Total Graduates",
          width = 4,
          background = "info",
          textOutput("Db_TotGrad")
        ),#bs4Card
        
        box(title = "Top Databases", 
            plotlyOutput("top_Db", height = 500), 
            width = 12, 
            solidHeader = TRUE, 
            status = "info")
      )),#tabItem
      
      tabItem(tabName = "AITool", fluidRow(
        bs4Card(
          title = "Top AI Tools",
          width = 4,
          background = "info",
          textOutput("AITool_Top")
        ),#bs4Card
        bs4Card(
          title = "Total AI Tools",
          width = 4,
          background = "info",
          textOutput("AITool_Tot")
        ),#bs4Card
        bs4Card(
          title = "Total Graduates",
          width = 4,
          background = "info",
          textOutput("AITool_TotGrad")
        ),#bs4Card
        
        box(title = "Top AI Tools", 
            plotlyOutput("top_AITool", height = 500), 
            width = 12, solidHeader = TRUE, 
            status = "info")
      )),#tabItem
      
      tabItem(tabName = "WebFrame", fluidRow(
        bs4Card(
          title = "Top Web Framework",
          width = 4,
          background = "info",
          textOutput("Web_Top")
        ),#bs4Card
        bs4Card(
          title = "Total Web Frameworks",
          width = 4,
          background = "info",
          textOutput("Web_Tot")
        ),#bs4Card
        bs4Card(
          title = "Total Graduates",
          width = 4,
          background = "info",
          textOutput("Web_TotGrad")
        ),#bs4Card
        
        box(title = "Top Web Framework", 
            plotlyOutput("top_WebFrame", height = 500), 
            width = 12, solidHeader = TRUE, 
            status = "info")
      )),#tabItem
      
      tabItem(tabName = "Platform", fluidRow(
        bs4Card(
          title = "Top Cloud Platform",
          width = 4,
          background = "info",
          textOutput("Plt_Top")
        ),#bs4Card
        bs4Card(
          title = "Total Cloud Platforms",
          width = 4,
          background = "info",
          textOutput("Plt_Tot")
        ),#bs4Card
        bs4Card(
          title = "Total Graduates",
          width = 4,
          background = "info",
          textOutput("Plt_TotGrad")
        ),#bs4Card
        
        box(title = "Top Cloud Platforms", 
            plotlyOutput("top_Platform", height = 500), 
            width = 12, solidHeader = TRUE, 
            status = "info")
      )),#tabItem
      
      tabItem(tabName = "AISearch", fluidRow(
        bs4Card(
          title = "Top AI Search Engine",
          width = 4,
          background = "info",
          textOutput("AIS_Top")
        ),#bs4Card
        bs4Card(
          title = "Total AI Search Engines",
          width = 4,
          background = "info",
          textOutput("AIS_Tot")
        ),#bs4Card
        bs4Card(
          title = "Total Graduates",
          width = 4,
          background = "info",
          textOutput("AIS_TotGrad")
        ),#bs4Card
        
        box(title = "Top AI Search Engines", 
            plotlyOutput("top_AISearch", height = 500), 
            width = 12, solidHeader = TRUE, 
            status = "info", background = "gray-dark")
      )),#tabItem
      tabItem(tabName = "Industry", fluidRow(
        box(title = "Top Industries", 
            plotlyOutput("top_Industry", height = 535), 
            width = 12, solidHeader = TRUE, 
            status = "info")
      )),#tabItem
      tabItem(tabName = "Role", fluidRow(
        box(title = "Top Job Roles", 
            plotlyOutput("top_Role", height = 535), 
            width = 12, solidHeader = TRUE, 
            status = "info")
      )),#tabItem
      tabItem(tabName = "Employment", fluidRow(
        box(title = "Rate of Employed Graduates", 
            plotlyOutput("top_Employment", height = 535), 
            width = 12, solidHeader = TRUE, 
            status = "info")
      ))#tabItem
    )#tabItems
  )#dashboardBody
)
