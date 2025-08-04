#Name: Onthatile Lebogo
#Student Number: eduv4842477
library(shiny)
library(bs4Dash)
library(plotly)
library(DT)

source("Q1&2_cleaning_visualization.R")

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
  
  #Output text to ui.R
  
  #ProgLang
  output$progLang_Top <- renderText(progLang_Top)
  output$progLang_Tot <- renderText(progLang_Tot)
  output$progLang_TotGrad <- renderText(progLang_TotGrad)
  
  #Databases
  output$Db_Top <- renderText(Db_Top)
  output$Db_Tot <- renderText(Db_Tot)
  output$Db_TotGrad <- renderText(Db_TotGrad)
  
  #AITool
  output$AITool_Top <- renderText(AITool_Top)
  output$AITool_Tot <- renderText(AITool_Tot)
  output$AITool_TotGrad <- renderText(AITool_TotGrad)
  
  #WebFramework
  output$Web_Top <- renderText(Web_Top)
  output$Web_Tot <- renderText(Web_Tot)
  output$Web_TotGrad <- renderText(Web_TotGrad)
  
  #Platform
  output$Plt_Top <- renderText(Plt_Top)
  output$Plt_Tot <- renderText(Plt_Tot)
  output$Plt_TotGrad <- renderText(Plt_TotGrad)
  
  #Databases
  output$AIS_Top <- renderText(AIS_Top)
  output$AIS_Tot <- renderText(AIS_Tot)
  output$AIS_TotGrad <- renderText(AIS_TotGrad)
  
  
})
