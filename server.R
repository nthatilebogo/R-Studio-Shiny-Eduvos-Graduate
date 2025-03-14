#Name: Onthatile Lebogo
#Student Number: eduv4842477
library(shiny)
library(shinydashboard)
library(bs4Dash)
library(plotly)

# Define server logic
shinyServer(function(input, output) {
  #reference the plot from the Q1 and Q2 to server.R
  #Output the plot to ui.R
  output$top_ProgLang <- renderPlotly({progLangPlot})
  output$top_Db <- renderPlotly({DbPlot})
  output$top_AITool <- renderPlotly({AIToolPLot})
  output$top_WebFrame <- renderPlotly({WebFramePlot})
  output$top_Platform <- renderPlotly({PlatformPlot})
  output$top_AISearch <- renderPlotly({AISearchPlot})
  output$top_Industry <- renderPlotly({IndustryPlot})
  output$top_Role <- renderPlotly({RolePlot})
  output$top_Employment <- renderPlotly({RatePlot})
})
