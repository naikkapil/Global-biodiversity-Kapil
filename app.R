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
    
  })
  
  # Timeline output
  output$timeline <- renderPlot({
    
  })
}

shinyApp(ui = ui, server = server)