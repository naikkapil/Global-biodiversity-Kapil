 library(dplyr)
 library(leaflet)
 library(ggplot2)
 library(DT)
 library(shinytest2)
 
source("map_server.R",local = T)
source("timeline_server.R",local = T)
 
 server <- function(input, output, session) {
   observations <- read.csv("occurence_poland.csv")
   
   filteredData <- reactive({
     if (input$speciesName != "") {
       subset(observations, vernacularName == input$speciesName | scientificName == input$speciesName)
     } else {
       subset(observations, vernacularName == "Slow Worm")
     }
   })
   
   input_specieName <- reactive({
     input$speciesName
   })
   # Pass filteredData to the modules
   mapServer("mapModule", filteredData, session)
   timelineServer("timelineModule", filteredData, input_specieName)
 }
 
#shinyApp(ui = ui, server = server)
