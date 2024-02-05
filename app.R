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
}

shinyApp(ui = ui, server = server)