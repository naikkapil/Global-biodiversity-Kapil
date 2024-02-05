library(shiny)
library(shinydashboard)
library(leaflet)
library(ggplot2)
library(dplyr)
library(DT)



ui <- dashboardPage(
  dashboardHeader(title = "Species Observation Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      textInput("speciesName", "Enter Species Name"),
      actionButton("search", "Search")
      ## Additional filters or options
    )
  ),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                box(leafletOutput(), width = 6),
                box(plotOutput(), width = 6)
              )
      )
    )
  )
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
      subset(observations, vernacularName == "Herb-Paris" )
    }
  })
  
  ## Map output
  output$map <- renderLeaflet({
    # Map rendering using leaflet()
    data <- filteredData()  # Get the filtered data
    
    leaflet(data) %>% 
      addTiles() %>%  # Add default OpenStreetMap map tiles
      addMarkers(~longitudeDecimal, ~latitudeDecimal, popup = ~vernacularName)
  })
  
  # Timeline output
  output$timeline <- renderPlot({
    # Plotting logic using ggplot2
    
    data <- filteredData()
    data$eventDate <- as.Date(data$eventDate)
    
    ggplot(data, aes(x = eventDate)) +
      geom_histogram(binwidth = 30, fill = "blue", color = "black") +
      labs(x = "Date of Observation", y = "Number of Observations") +
      theme_minimal() +
      ggtitle(paste("Observations Over Time for", input$speciesName))
    
  })
}

shinyApp(ui = ui, server = server)