library(shiny)
library(shinydashboard)
library(leaflet)
library(ggplot2)
library(dplyr)
library(DT)
library(shinytest2)


ui <- dashboardPage(
  dashboardHeader(title = "Species Observation Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      textInput("speciesName", "Enter Species Name")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                box(leafletOutput("map"), width = 12)
              ),
              fluidRow(
                box(plotOutput("timeline"), width = 12)
              )
              
      )
    )
  ),
  skin = "blue"
)

server <- function(input, output) {
  observations <- read.csv("occurence_poland.csv")
  ## Data filtering based on search
  filteredData <- reactive({
    # Filter the data based on the input from the species name search box
    
    if (input$speciesName != "") {
      subset(observations, vernacularName == input$speciesName | scientificName == input$speciesName)
    } else {
      ## Return a subset for the default view
      subset(observations, vernacularName == "Slow Worm" )
    }
  })
  
  ## Map output
  output$map <- renderLeaflet({
    # Map rendering using leaflet()
    data <- filteredData()  # Get the filtered data
    
    leaflet(data) %>%
      addTiles() %>%
      addCircleMarkers(
        ~longitudeDecimal, ~latitudeDecimal, popup = ~paste(vernacularName,locality),
        radius = 8, color = "red", stroke = TRUE, fillOpacity = 0.8
      ) %>%
      addScaleBar(position = "bottomleft")
  })
  
  # Timeline output
  output$timeline <- renderPlot({
    # Plotting logic using ggplot2
    
    data <- filteredData()
    data$eventDate <- as.Date(data$eventDate)
    
    ggplot(data, aes(x = eventDate)) +
      geom_histogram(binwidth = 150, fill = "blue", color = "black") +
      labs(x = "Date of Observation", y = "Number of Observations") +
      theme_minimal() +
      if(input$speciesName==""){
        ggtitle("Observations Over Time for Slow Worm")
      }
    else{
      ggtitle(paste("Observations Over Time for", input$speciesName))
    }
    
  })
}

shinyApp(ui = ui, server = server)